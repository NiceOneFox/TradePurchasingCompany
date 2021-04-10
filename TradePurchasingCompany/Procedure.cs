using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace TradePurchasingCompany
{
    public partial class Procedure : Form
    {

        private string connectionString = @"Data Source=SMALLESTROOMPC\SQLEXPRESS;Initial Catalog=CP;Integrated Security=True";

        private bool[] wasAdded;
        public Procedure()
        {
            InitializeComponent();
        }

        private void Procedure_Load(object sender, EventArgs e)
        {
            InitializeComboBox(comboBox1, "agent_name", "Agent");
            InitializeComboBox(comboBox2, "name", "Goods");

            wasAdded = new bool[comboBox2.Items.Count];

            dataGridView1.ColumnCount = 2;
            dataGridView1.Columns[0].HeaderText = "Good";
            dataGridView1.Columns[1].HeaderText = "total";
        }

        private void InitializeComboBox(ComboBox comboBox, string columnName, string tableName)
        {
            List<string> listAgents = new List<string>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SELECT DISTINCT " + columnName + " FROM " + tableName, con))
                {
                    con.Open();

                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            listAgents.Add(dataReader.GetString(0));
                        }
                    }
                }
            }
            comboBox.DataSource = listAgents;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // ADD to datagridview 1 
            // 

            if (numericUpDown1.Value <= 0)
            {
                MessageBox.Show("Количество должно быть больше нуля");
                return;
            }
            else
            {
                if (wasAdded[comboBox2.SelectedIndex])
                {
                    MessageBox.Show("Данный товар уже был добавлен");
                }
                else
                {
                    dataGridView1.Rows.Add(comboBox2.SelectedValue, numericUpDown1.Value);
                    wasAdded[comboBox2.SelectedIndex] = true;
                }
            }
        }

        private void button18_Click(object sender, EventArgs e)
        {
            if (dataGridView1.RowCount == 0)
            {
                MessageBox.Show("Введите список товаров");
            }
            else
            {
                try
                {
                    // ADD to DATABAASE FROM datagridview
                    // ADD order // get agent id by name
                    // GET last id order
                    // Add all rows from datagridview
                    int agent_id = -1;
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand("SELECT agent_id FROM Agent WHERE agent_name = '" + comboBox1.SelectedValue + "'", con))
                        {
                            con.Open();
                            agent_id = (int)command.ExecuteScalar();
                        }
                    }


                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand("Add_Order @agent_id, @status_id", con))
                        {
                            con.Open();
                            command.Parameters.Add("@agent_id", SqlDbType.Int);
                            command.Parameters["@agent_id"].Value = agent_id;

                            command.Parameters.Add("@status_id", SqlDbType.Int);
                            command.Parameters["@status_id"].Value = 1;

                            command.ExecuteNonQuery();

                        }

                        // get last id order
                        int id_order = -1;
                        using (SqlCommand command2 = new SqlCommand("Get_last_id_order", con))
                        {
                            command2.CommandType = CommandType.StoredProcedure;
                            command2.Parameters.Add("@idReturn", SqlDbType.Int).Direction =
                                ParameterDirection.Output;
                            command2.ExecuteNonQuery();

                            id_order = (int)command2.Parameters["@idReturn"].Value;
                        }

                        // add all rows from datagridview

                        // get vender code from name of product

                        foreach (DataGridViewRow row in dataGridView1.Rows)
                        {
                            //whatever you are currently doing
                            using (SqlCommand command2 = new SqlCommand("Add_Order_list", con))
                            {
                                // get vender code for this procedure
                                string vender_code = null;
                                using (SqlCommand command3 = new SqlCommand("SELECT vender_code FROM Goods WHERE name = '" + row.Cells[0].Value + "'", con))
                                {                                   
                                    vender_code = (string)command3.ExecuteScalar();
                                }

                                command2.CommandType = CommandType.StoredProcedure;
                                command2.Parameters.Add("@order_id", SqlDbType.Int);
                                command2.Parameters["@order_id"].Value = id_order;

                                command2.Parameters.Add("@vender_code", SqlDbType.VarChar);
                                command2.Parameters["@vender_code"].Value = vender_code;

                                command2.Parameters.Add("@total", SqlDbType.Int);
                                command2.Parameters["@total"].Value = row.Cells[1].Value;

                                command2.ExecuteNonQuery();
                            }
                        }
                        MessageBox.Show("Order has been created");

                    }




                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    throw;
                }
            }
        }
    }
}
