using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// will validate to see if a value is a decimal
        /// </summary>
        /// <param name="val"></param>
        /// <returns>true if decimal</returns>
        public bool Validate_Decimal(string val)
        {
            decimal valConverted = 0.0M;
            try
            {
                valConverted = Convert.ToDecimal(val);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// will remove numbers and special characters
        /// Will remove the characters then assign the 
        /// value back to the textbox it came from     
        /// </summary>
        /// <param name="val"></param>
        /// <param name="box"></param>
        /// <returns></returns>
        public bool Validate_Name(string val, TextBox box)
        {
            bool retval = false;
            // remove numbers
            val = val.Replace("1", "");
            val = val.Replace("2", "");
            val = val.Replace("3", "");
            val = val.Replace("4", "");
            val = val.Replace("5", "");
            val = val.Replace("6", "");
            val = val.Replace("7", "");
            val = val.Replace("8", "");
            val = val.Replace("9", "");
            val = val.Replace("0", "");
            //remove special charactes
            val = val.Replace("~", "");
            val = val.Replace("!", "");
            val = val.Replace("@", "");
            val = val.Replace("#", "");
            val = val.Replace("^", "");
            val = val.Replace("+", "");
            val = val.Replace("\\", "");
            val = val.Replace("/", "");
            val = val.Replace("&", "");

            box.Text = val; // assign the value back to the text box
            if (val.Length > 0)
            {
                retval = true;
            }
            else
            {
                retval = false;
            }
            return retval;
        }

        protected void btnGeneratePaystub_Click(object sender, EventArgs e)
        {
            //declare variables
            string firstName = string.Empty;
            string lastName = string.Empty;
            string workHours = string.Empty;
            string payRate = string.Empty;
            decimal dWorkHours = 0M;
            decimal regularHours = 0M;
            decimal overtimeHours = 0M;
            decimal dPayRate = 0M;
            decimal grossPay = 0M;
            decimal regularPay = 0M;
            decimal overtimePay = 0M;
            decimal taxes = 0M;
            decimal taxRate = 0.24M;
            decimal netPay = 0M;
            decimal overtimePayRate = 0M;

            //Grab Data from screen
            workHours = txtWorkHours.Text;
            payRate = txtPayRate.Text;

            //Validate Input
            if (Validate_Name(txtFirstName.Text, txtFirstName))
            {
                if (Validate_Name(txtLastName.Text, txtLastName))
                {
                    if (Validate_Decimal(workHours))
                    {
                        if (Validate_Decimal(payRate))
                        {
                            // passed validation run calculations and output to screen
                            Create_Paystub();
                            lblError.Visible = false;
                        }
                        else
                        {
                            lblError.Text = "Total Debt InValid";
                        }
                    }
                    else
                    {
                        lblError.Text = "Work Hours InValid";
                    }
                }
                else
                {
                    lblError.Text = "Last Name InValid";
                }

            }
            else
            {
                lblError.Text = "First Name InValid";
            }
            lblError.Visible = true;

            

            void Create_Paystub()
            {
                //Grab names from screen
                firstName = txtFirstName.Text;
                lastName = txtLastName.Text;

                //Convert to decimals
                dWorkHours = Convert.ToDecimal(workHours);
                dPayRate = Convert.ToDecimal(payRate);

                //Check for Overtime
                if (dWorkHours > 40)
                {
                    overtimeHours = dWorkHours - 40;
                    regularHours = dWorkHours - overtimeHours;
                }
                else
                {
                    overtimeHours = 0M;
                    regularHours = dWorkHours;
                }

                //Calculate Pay
                regularPay = (regularHours * dPayRate);
                overtimePayRate = (dPayRate * 1.5M);
                overtimePay = (overtimeHours * overtimePayRate);
                grossPay = regularPay + overtimePay;

                //calculate taxes
                taxes = taxRate * grossPay;

                //calculate netPay
                netPay = grossPay - taxes;

                //Round the decimals
                regularPay = Math.Round(regularPay, 2);
                overtimePay = Math.Round(overtimePay, 2);
                taxes = Math.Round(taxes, 2);
                netPay = Math.Round(netPay, 2);

                //display output
                txtStubName.Text = firstName + " " + lastName;
                txtStubHours.Text = dWorkHours.ToString();
                txtStubOvertimeHours.Text = overtimeHours.ToString();
                txtStubRate.Text = dPayRate.ToString();
                txtStubRegularPay.Text = regularPay.ToString();
                txtStubOvertimePay.Text = overtimePay.ToString();
                txtStubTaxes.Text = taxes.ToString();
                txtStubNetPay.Text = netPay.ToString();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear_Screen();
        }
        public void Clear_Screen()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtWorkHours.Text = string.Empty;
            txtPayRate.Text = string.Empty;
            txtStubName.Text = string.Empty;
            txtStubHours.Text = string.Empty;
            txtStubOvertimeHours.Text = string.Empty;
            txtStubRate.Text = string.Empty;
            txtStubRegularPay.Text = string.Empty;
            txtStubOvertimePay.Text = string.Empty;
            txtStubTaxes.Text = string.Empty;
            txtStubNetPay.Text = string.Empty;
            lblError.Visible = false;
            lblError.Text = string.Empty;
        }
    }
}