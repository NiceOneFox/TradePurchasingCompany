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
    public partial class CreateDeliveryForm : Form
    {

        private string connectionString = @"Data Source=SMALLESTROOMPC\SQLEXPRESS;Initial Catalog=CP;Integrated Security=True";

        private bool[] wasAdded;
        public CreateDeliveryForm()
        {
            InitializeComponent();
        }

        private void CreateDeliveryForm_Load(object sender, EventArgs e)
        {
            InitializeComboBox(comboBox1, "warehouse_addr", "[Warehouse]");
            InitializeComboBox(comboBox2, "name", "Goods");

            wasAdded = new bool[comboBox2.Items.Count + 1];

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
                    int warehouse_id = -1;
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand("SELECT warehouse_id FROM [Warehouse] WHERE warehouse_addr = '" + comboBox1.SelectedValue + "'", con))
                        {
                            con.Open();
                            warehouse_id = (int)command.ExecuteScalar();
                        }
                    }


                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand("Add_Delivery @warehouse_id", con))
                        {
                            con.Open();
                            command.Parameters.Add("@warehouse_id", SqlDbType.Int);
                            command.Parameters["@warehouse_id"].Value = warehouse_id;                        
                            command.ExecuteNonQuery();
                        }

                        // get last id Delivery
                        int delivery_id = -1;
                        using (SqlCommand command2 = new SqlCommand("Get_last_id_delivery", con))
                        {
                            command2.CommandType = CommandType.StoredProcedure;
                            command2.Parameters.Add("@id", SqlDbType.Int).Direction =
                                ParameterDirection.Output;
                            command2.ExecuteNonQuery();

                            delivery_id = (int)command2.Parameters["@id"].Value;
                        }

                        // add all rows from datagridview

                        // get vender code from name of product

                        foreach (DataGridViewRow row in dataGridView1.Rows)
                        {
                            //whatever you are currently doing
                            using (SqlCommand command2 = new SqlCommand("Add_Delivery_list", con))
                            {
                                // get vender code for this procedure
                                
                                string vender_code = null;
                                using (SqlCommand command3 = new SqlCommand("SELECT vender_code FROM Goods WHERE name = '" + row.Cells[0].Value + "'", con))
                                {                              
                                    vender_code = (string)command3.ExecuteScalar();
                                }

                                command2.CommandType = CommandType.StoredProcedure;
                                command2.Parameters.Add("@delivery_id", SqlDbType.Int);
                                command2.Parameters["@delivery_id"].Value = delivery_id;

                                command2.Parameters.Add("@vender_code", SqlDbType.VarChar);
                                command2.Parameters["@vender_code"].Value = vender_code;

                                command2.Parameters.Add("@total", SqlDbType.Int);
                                command2.Parameters["@total"].Value = row.Cells[1].Value;

                                command2.ExecuteNonQuery();
                            }
                        }
                        MessageBox.Show("Delivery has been created");

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
