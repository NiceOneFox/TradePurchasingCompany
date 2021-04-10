using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TradePurchasingCompany
{
    public partial class Form1 : Form
    {
        private string connectionString = @"Data Source=SMALLESTROOMPC\SQLEXPRESS;Initial Catalog=CP;Integrated Security=True";

        private SqlConnection SqlConnection = null;

        private SqlCommandBuilder SqlCommandBuilder = null;

        private SqlDataAdapter sqlDataAdapter = null;

        private DataSet dataSet = null;

        private string currentTable;

        private bool newRowAdding = false;

        private int lastIndexTable = 2; // меняется в зависимости от таблицы
        public Form1()
        {
            InitializeComponent();

            ToolTipAgentInfo();

        }

        private void ToolTipAgentInfo()
        {
            ToolTip t = new ToolTip();         
            t.SetToolTip(button4, "Выводит информацию об агенте\nПараметры: Имя агента");

            ToolTip t1 = new ToolTip();
            t1.SetToolTip(button17, "Выводит наличие товара на складах\nПараметры: Артикуль товара");

            ToolTip t2 = new ToolTip();
            t2.SetToolTip(button14, "Выводит всех сотрудников определённой должности\n Параметры: Название должности");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            lastIndexTable = 4;
            currentTable = "[Order_list]";
            LoadData();
        }

        private DataTable GetTable(string tableName)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SELECT * FROM " + tableName, con))
                {
                    con.Open();

                    SqlDataReader dataReader = command.ExecuteReader();

                    dataTable.Load(dataReader);
                }
            }
            return dataTable;
        }

        private void LoadData()
        {
            try
            {
                sqlDataAdapter = new SqlDataAdapter("Select *, 'Delete' AS [Delete] FROM " + currentTable, SqlConnection);

                SqlCommandBuilder = new SqlCommandBuilder(sqlDataAdapter);

                SqlCommandBuilder.GetInsertCommand();
                SqlCommandBuilder.GetUpdateCommand();
                SqlCommandBuilder.GetDeleteCommand();

                dataSet = new DataSet();

                sqlDataAdapter.Fill(dataSet, currentTable);

                dataGridView1.DataSource = null;
                dataGridView1.DataSource = dataSet.Tables[currentTable];

                for (int i = 0; i < dataGridView1.Rows.Count; i++)
                {

                    DataGridViewLinkCell linkCell = new DataGridViewLinkCell();
                    dataGridView1[lastIndexTable, i] = linkCell;
                }

                dataGridView1.Refresh();
                dataGridView1.Update();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ReloadData()
        {
            try
            {             
                dataSet.Tables[currentTable].Clear(); // currentTABLE CHANGE DEPENDS ON BUTTOn

                sqlDataAdapter.Fill(dataSet, currentTable);

                dataGridView1.DataSource = dataSet.Tables[currentTable];

                for (int i = 0; i < dataGridView1.Rows.Count; i++)
                {

                    DataGridViewLinkCell linkCell = new DataGridViewLinkCell();
                    dataGridView1[lastIndexTable, i] = linkCell;
                }

                dataGridView1.Refresh();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            SqlConnection = new SqlConnection(connectionString);

            SqlConnection.Open();

            Initialize();
        }

        private void Initialize()
        {
            InitializeComboBox(comboBox1, "agent_name", "Agent");
            InitializeComboBox(comboBox2, "position", "Employee");
            InitializeComboBox(comboBox3, "vender_code", "Goods");
            InitializeComboBox(comboBox7, "agent_name", "Agent");
            InitializeComboBoxInt(comboBox8, "order_id", "[Order]");
            InitializeComboBox(comboBox9, "status", "Order_Status");
            InitializeComboBoxInt(comboBox6, "delivery_id", "Delivery");
            InitializeComboBoxInt(comboBox4, "Order_id", "[Order]");
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
       
        private void InitializeComboBoxInt(ComboBox comboBox, string columnName, string tableName)
        {
            List<int> listAgents = new List<int>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SELECT DISTINCT " + columnName + " FROM " + tableName, con))
                {
                    con.Open();

                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            listAgents.Add(dataReader.GetInt32(0));
                        }
                    }
                }
            }
            comboBox.DataSource = listAgents;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            lastIndexTable = 3;
            currentTable = "[Delivery]";
            LoadData();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            lastIndexTable = 6;
            currentTable = "[Agent_view]";
            dataGridView1.DataSource = GetTable(currentTable);
        }

        private void createDeliveryButton_Click(object sender, EventArgs e)
        {
            lastIndexTable = 3;
            currentTable = "[Warehouse]";
            LoadData();
        }

        private void button4_Click(object sender, EventArgs e)
        {

            DataTable dataTable = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Agent_info @agent_name", con))
                { // Мясников Виссарион Филатович
                    con.Open();                   
                    command.Parameters.Add("@agent_name", SqlDbType.VarChar);
                    command.Parameters["@agent_name"].Value = comboBox1.SelectedValue.ToString();
                    
                    using (SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                       dataTable.Load(dataReader); 
                    }
                }
            }
            //MessageBox.Show("Agnent info created");
            dataGridView1.DataSource = dataTable;
            dataGridView1.Update();
            dataGridView1.Refresh();
        }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            lastIndexTable = 4;
            currentTable = "[Order]";
            LoadData();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Environment.Exit(1);
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {           
            ReloadData();
            Initialize();
        }


        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.ColumnIndex == lastIndexTable)
                {
                    string task = dataGridView1.Rows[e.RowIndex].Cells[lastIndexTable].Value.ToString();

                    if (task == "Delete")
                    {
                        if (MessageBox.Show("Удалить эту строку?", "Удаление", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
                            == DialogResult.Yes)
                        {
                            int rowIndex = e.RowIndex;

                            dataGridView1.Rows.RemoveAt(rowIndex);

                            dataSet.Tables[currentTable].Rows[rowIndex].Delete(); // TODO table name---

                            sqlDataAdapter.Update(dataSet, currentTable); // TABLE NAME
                        } 

                    } else if (task == "Insert")
                    {
                        int rowIndex = dataGridView1.Rows.Count - 2;
                        DataRow row = dataSet.Tables[currentTable].NewRow(); // TABLE NAME

                        for (int i = 0; i < dataGridView1.Columns.Count; i++) 
                        {
                            string headerName = dataGridView1.Columns[i].HeaderText;
                            row[headerName] = dataGridView1.Rows[rowIndex].Cells[headerName].Value;
                        }

                        dataSet.Tables[currentTable].Rows.Add(row);

                        dataSet.Tables[currentTable].Rows.RemoveAt(dataSet.Tables[currentTable].Rows.Count - 1);

                        dataGridView1.Rows.RemoveAt(dataGridView1.Rows.Count - 2);

                        dataGridView1.Rows[e.RowIndex].Cells[lastIndexTable].Value = "Delete";

                        sqlDataAdapter.Update(dataSet, currentTable);

                        newRowAdding = false;
                    } else if (task == "Update")
                    {

                        int r = e.RowIndex;

                        for (int i = 0; i < dataGridView1.Columns.Count; i++)
                        {
                            string headerName = dataGridView1.Columns[i].HeaderText;
                            dataSet.Tables[currentTable].Rows[r][headerName] = dataGridView1.Rows[r].Cells[headerName].Value;
                        }

                        sqlDataAdapter.Update(dataSet, currentTable);
                        dataGridView1.Rows[e.RowIndex].Cells[lastIndexTable].Value = "Delete";

                    }
                    ReloadData();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                throw;
            }
        }

        private void dataGridView1_UserAddedRow(object sender, DataGridViewRowEventArgs e)
        {
            try
            {
                if (!newRowAdding)
                {
                    newRowAdding = true;

                    int lastRow = dataGridView1.Rows.Count - 2;

                    DataGridViewRow row = dataGridView1.Rows[lastRow];

                    DataGridViewLinkCell linkCell = new DataGridViewLinkCell();

                    dataGridView1[lastIndexTable, lastRow] = linkCell;

                    row.Cells["Delete"].Value = "Insert";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);               
                throw;
            }
        }

        private void dataGridView1_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (!newRowAdding)
                {
                    int rowIndex = dataGridView1.SelectedCells[0].RowIndex;

                    DataGridViewRow editingRow = dataGridView1.Rows[rowIndex];

                    DataGridViewLinkCell linkCell = new DataGridViewLinkCell();

                    dataGridView1[lastIndexTable, rowIndex] = linkCell;

                    editingRow.Cells["Delete"].Value = "Update";
                }
            }
             catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                throw;
            }
        }

        private void dataGridView1_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
        }

        private void Column_KeyPress(object sender, KeyPressEventArgs e)
        {
        }

        private void button6_Click(object sender, EventArgs e)
        {
            lastIndexTable = 4;
            currentTable = "[delivery_list]";
            LoadData();
           
        }

        private void button11_Click(object sender, EventArgs e)
        {
            lastIndexTable = 4;
            currentTable = "[Agent_Goods]";
            LoadData();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            lastIndexTable = 4;
            currentTable = "[Warehouse_goods]";
            LoadData();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            lastIndexTable = 3;
            
           
            currentTable = "[Employee_view]";
            dataGridView1.DataSource = GetTable(currentTable);
            //LoadData();
        }

        private void button17_Click(object sender, EventArgs e)
        {
            // procedure warehouse goods in stock
            //
            DataTable dataTable = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Warehouse_Goods_in_stock @vender_code", con))
                { 
                    con.Open();
                    command.Parameters.Add("@vender_code", SqlDbType.VarChar);
                    command.Parameters["@vender_code"].Value = comboBox3.SelectedValue.ToString();

                    using (SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dataTable.Load(dataReader);
                    }
                }
            }           
            dataGridView1.DataSource = dataTable;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            currentTable = "[Warehouse_goods_info_view]";
            dataGridView1.DataSource = GetTable(currentTable);
        }

        private void button12_Click(object sender, EventArgs e)
        {
            currentTable = "[delivery_goods_view_2]";
            dataGridView1.DataSource = GetTable(currentTable);
        }

        private void button13_Click(object sender, EventArgs e)
        {
            currentTable = "[Order_status_view]";
            dataGridView1.DataSource = GetTable(currentTable);
        }

        private void button14_Click(object sender, EventArgs e)
        {
            // procedure Emlployee_position
            DataTable dataTable = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Employee_position @position", con))
                {
                    con.Open();
                    command.Parameters.Add("@position", SqlDbType.VarChar);
                    command.Parameters["@position"].Value = comboBox2.SelectedValue.ToString();

                    using (SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dataTable.Load(dataReader);
                    }
                }
            }
            dataGridView1.DataSource = dataTable;

        }

        private void button15_Click(object sender, EventArgs e)
        {
            CreateDeliveryForm createDeliveryForm = new CreateDeliveryForm();
            createDeliveryForm.Show();

           //// ReloadData();
           // DataTable dataTable = new DataTable();
           // using (SqlConnection con = new SqlConnection(connectionString))
           // {
           //     using (SqlCommand command = new SqlCommand("Done_orders @left, @right", con))
           //     {
           //         con.Open();
           //         command.CommandType = CommandType.StoredProcedure;
           //         command.Parameters.Add("@left", SqlDbType.DateTime2);

           //         // 2020.11.25 00:00:00
           //         DateTime dateTime = DateTime.Parse(textBox1.Text.Trim());
           //         command.Parameters["@left"].Value = dateTime; // 1/1/2009 00:00:00 'YYYYMMDD hh:mm:ss.nnnnnnn'

           //         DateTime dateTime2 = DateTime.Parse(textBox2.Text.Trim());

           //         command.Parameters.Add("@right", SqlDbType.DateTime2);
           //         command.Parameters["@right"].Value = dateTime2;

           //         using (SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection))
           //         {
           //             dataTable.Load(dataReader);
           //         }
                    
           //     }
           // }
           // dataGridView1.DataSource = dataTable;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void button18_Click(object sender, EventArgs e)
        {
            lastIndexTable = 6;
            currentTable = "[Goods]";
            LoadData();
        }

        private void button16_Click(object sender, EventArgs e)
        {
            Procedure procedure = new Procedure();
            procedure.Show();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void button22_Click(object sender, EventArgs e)
        {
            // по имени агента вернуть его айди. и вывести все товары с этим айди из таблицы agent_goods
            DataTable dataTable = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                int agent_id = -1;
                using (SqlCommand command1 = new SqlCommand("SELECT agent_id FROM Agent WHERE agent_name = '" + comboBox7.SelectedValue.ToString() + "'", con)) // make it procedure?
                {
                    con.Open();
                    agent_id = (int)command1.ExecuteScalar();
                }

                using (SqlCommand command = new SqlCommand("SELECT vender_code, total FROM Agent_Goods WHERE agent_id = '" + agent_id.ToString() + "'", con))
                {
                    using (SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dataTable.Load(dataReader);
                    }
                }
            }
            dataGridView1.DataSource = dataTable;
        }

        private void button21_Click(object sender, EventArgs e)
        {
            // вернуть из delivery list таблицу где id = combobox6
            DataTable dataTable = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("SELECT vender_code, total FROM delivery_list WHERE delivery_id = '" + comboBox6.SelectedValue.ToString() + "'", con))
                {
                    using (SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dataTable.Load(dataReader);
                    }
                }
            }
            dataGridView1.DataSource = dataTable;

        }

        private void button23_Click(object sender, EventArgs e)
        {
            // get id_status
            //and change id status by order id
            int status_id = -1;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("SELECT status_id FROM Order_Status WHERE status = '" + comboBox9.SelectedValue.ToString() + "'", con))
                {
                    status_id = (int)command.ExecuteScalar();
                }

                using (SqlCommand command1 = new SqlCommand("Change_order_status", con))
                {
                    command1.CommandType = CommandType.StoredProcedure;
                    command1.Parameters.Add("@status_id", SqlDbType.Int);
                    command1.Parameters["@status_id"].Value = status_id;

                    command1.Parameters.Add("@order_id", SqlDbType.Int);
                    command1.Parameters["@order_id"].Value = comboBox8.SelectedValue;

                    command1.ExecuteNonQuery();
                }
            }
        }

        private void button19_Click(object sender, EventArgs e)
        {
            // get order_list by order_id
            DataTable dataTable = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();               
                using (SqlCommand command1 = new SqlCommand("SELECT vender_code, total FROM [Order_list] WHERE order_id = '" + comboBox4.SelectedValue.ToString() + "'", con))
                {
                    using (SqlDataReader dataReader = command1.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        dataTable.Load(dataReader);
                    }
                }
            }
            dataGridView1.DataSource = dataTable;
        }
    }
}
