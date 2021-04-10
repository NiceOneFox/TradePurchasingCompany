using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace TradePurchasingCompany
{
    public partial class Auth : Form
    {
        private string connectionString = @"Data Source=SMALLESTROOMPC\SQLEXPRESS;Initial Catalog=CP;Integrated Security=True";
        public Auth()
        {
            InitializeComponent();
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (SignInUser())
            {
                OpenProgramWindow();
                this.Visible = false;
            } else
            {
                // TODO если неудачный логин
                MessageBox.Show("Неверный логин или пароль");
            }
           
        }

        private bool SignInUser()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString)) //TODO найти логин который ввёл пользователь в бд. вернуть пароль и расшифровать
                {

                    using (SqlCommand command = new SqlCommand("Get_user_password", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        command.Parameters.Add("@login", SqlDbType.VarChar);
                        command.Parameters["@login"].Value = textBox1.Text.Trim();

                        //command.ExecuteNonQuery();

                        //// возращает пароль который надо декодировать и сравнить с textbox2.
                        ///
                        string encodedPassword = "";
                        using (SqlDataReader dataReader = command.ExecuteReader())
                        {
                            while (dataReader.Read())
                            {
                                encodedPassword = dataReader.GetString(0);
                            }
                            //MessageBox.Show(encodedPassword); // читает пароль
                        }

                        using (SHA256 sha256Hash = SHA256.Create())
                        {
                            string hash = GetHash(sha256Hash, textBox2.Text.Trim()); // кодируем пароль чтобы сравнить
                           // MessageBox.Show(hash + "of password");

                            if (VerifyHash(sha256Hash, textBox2.Text.Trim(), encodedPassword))
                            {
                                //MessageBox.Show("The hashes are the same.");
                                return true;
                            }
                            else
                            {
                                //MessageBox.Show("he hashes are not same.");
                                return false;
                            }

                        }

                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                throw;
            }
        }

        private static string GetHash(HashAlgorithm hashAlgorithm, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = hashAlgorithm.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            var sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        // Verify a hash against a string.
        private static bool VerifyHash(HashAlgorithm hashAlgorithm, string input, string hash)
        {
            // Hash the input.
            var hashOfInput = GetHash(hashAlgorithm, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            return comparer.Compare(hashOfInput, hash) == 0;
        }

        private void Auth_Load(object sender, EventArgs e)
        {

        }
        // login 4
        // password 3
        private bool Verification()
        {
            if ((textBox6.Text == "" || textBox7.Text == "" || textBox8.Text == ""))
            {
                label11.ForeColor = Color.Red;
                return false;
            }

            if (textBox4.Text.Length < 4)
            {
                label11.Text = "Login lenght must be at least 4 characters";
                return false;
            } 
            if (textBox4.Text.Length > 16)
            {
                label11.Text = "Login lenght must be less than 17 charachers";
                return false;
            }
            if (textBox3.Text.Length < 4)
            {
                label11.Text = "Password lenght must be at least 4 characters";
                return false;
            }


            return true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // проверка корректности данных
            if (Verification())
            {
                if (Registration())
                {
                    OpenProgramWindow();
                    this.Visible = false;
                }
                else
                {
                    MessageBox.Show("Ошибка данных");
                }
            } else
            {
                MessageBox.Show("Введите данные");
            }

           // If everything is Ok, open program
        }

        private bool Registration()
        {
            // TODO Добавить в таблицу Authentication login и закодированный пароль
            //TODO взять номер последн его айди в таблице
            // добавить в Employee информацию из текст боксов указав полученный айди
            // либо добавить в Agent 
            // роль зависит от того агент или нет и от текста в .position
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {

                    using (SqlCommand command = new SqlCommand("Add_auth", con))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        command.Parameters.Add("@login", SqlDbType.VarChar);
                        command.Parameters["@login"].Value = textBox4.Text.Trim();
                        string password = textBox3.Text.Trim();

                        // hash password
                        using (SHA256 sha256hash = SHA256.Create())
                        {
                            string hashPassword = GetHash(sha256hash, password);
                            command.Parameters.Add("@password", SqlDbType.NChar);
                            command.Parameters["@password"].Value = hashPassword;
                        }

                        //MessageBox.Show(textBox4.Text.Trim() + "  " + password);
                        command.ExecuteNonQuery();
                    }
                    int id_auth = -1;

                    using (SqlCommand command2 = new SqlCommand("Get_last_id_auth", con))
                    {
                        command2.CommandType = CommandType.StoredProcedure;
                        command2.Parameters.Add("@id", SqlDbType.Int).Direction =
                            ParameterDirection.Output;
                        command2.ExecuteNonQuery();
                        id_auth = (int)command2.Parameters["@id"].Value;
                    }

                   // MessageBox.Show(id_auth.ToString());

                    // добавляем инфу либо в таблице Employee либо в Agent
                    if (checkBox1.Checked) // employee
                    {
                        using (SqlCommand command3 = new SqlCommand("Add_Employee @name, @phone, @position, @addr, @id_auth", con))
                        {
                            command3.Parameters.Add("@name", SqlDbType.VarChar);
                            command3.Parameters["@name"].Value = textBox8.Text.Trim();

                            command3.Parameters.Add("@phone", SqlDbType.VarChar);
                            command3.Parameters["@phone"].Value = textBox6.Text.Trim();

                            command3.Parameters.Add("@position", SqlDbType.VarChar);
                            command3.Parameters["@position"].Value = textBox5.Text.Trim();

                            command3.Parameters.Add("@addr", SqlDbType.VarChar);
                            command3.Parameters["@addr"].Value = textBox7.Text.Trim();

                            command3.Parameters.Add("@id_auth", SqlDbType.Int);

                            command3.Parameters["@id_auth"].Value = id_auth;

                            command3.ExecuteNonQuery();
                        }
                        return true;
                    }
                    else // agent
                    {
                        if (textBox5.Text != null || textBox5.Text != "")
                        {

                        }
                        using (SqlCommand command4 = new SqlCommand("Add_Agent @agent_name, @agent_phone, @agent_addr, @id_auth", con))
                        {
                            command4.Parameters.Add("@agent_name", SqlDbType.VarChar);
                            command4.Parameters["@agent_name"].Value = textBox8.Text.Trim();

                            command4.Parameters.Add("@agent_phone", SqlDbType.VarChar);
                            command4.Parameters["@agent_phone"].Value = textBox6.Text.Trim();

                            command4.Parameters.Add("@agent_addr", SqlDbType.VarChar);
                            command4.Parameters["@agent_addr"].Value = textBox7.Text.Trim();

                            command4.Parameters.Add("@id_auth", SqlDbType.Int);
                            command4.Parameters["@id_auth"].Value = id_auth;

                            command4.ExecuteNonQuery();

                            MessageBox.Show("Аккаунт успешно создан");
                        }
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                throw;
            }      
            
        }

        private void OpenProgramWindow()
        {
            Form1 form1 = new Form1();
            form1.Show();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox8_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (char.IsDigit(e.KeyChar)){
                MessageBox.Show("Name can not contain digits");
                e.Handled = true;
                return;
            }

            return;            
        }

        private void textBox6_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (char.IsLetter(e.KeyChar))
            {
                MessageBox.Show("Phone number can not contain letters");
                e.Handled = true;
                return;
            }            

            return;
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                textBox2.PasswordChar = '\0'; 
            }
            if (!checkBox2.Checked)
            {
                textBox2.PasswordChar = '*';
            }
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
