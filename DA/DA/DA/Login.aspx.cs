using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ClientMLT;
using System.Data;
using System.Web.UI.WebControls;

namespace DA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUname.Focus();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Trim() != "" && txtPassword.Text.Trim() != "" & txtEmail.Text.Trim() != "")
            {
                if (rdgender.SelectedValue == "")
                    rdgender.SelectedValue = "M";
                // string strResult = DBClass.ExecSPstr("sp_Ins_Partners", new string[] { "@Name", "@Email", "@Password" }, new object[] { txtName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text.Trim() });
                DataSet dsResult = DBClass.ExecSPds("sp_Ins_users", new string[] { "@UserId", "@Firstname", "@Lastname", "@Username", "@Password", "@Email" ,"@Dob","@Gender"}, new object[] { "0", txtFname.Text.Trim(), txtLname.Text.Trim(), txtUsername.Text.Trim(), txtPassword.Text.Trim(), txtEmail.Text.Trim(),txtDOB.Text,rdgender.SelectedValue.ToString() });
                if (dsResult != null)
                {
                    if (dsResult.Tables.Count > 0)
                    {
                        if (dsResult.Tables[0].Rows[0][0].ToString() == "Successful")
                        {
                            
                            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Registered Successfully.');", true);
                            txtUname.Focus();
                            txtFname.Text = "";
                            txtLname.Text = "";
                            txtUsername.Text = "";
                            txtEmail.Text = "";
                            txtPassword.Text = "";
                            txtDOB.Text = "";
                            rdgender.SelectedIndex = -1;

                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Username already exists');", true);
                            txtUsername.Focus();
                        }

                    }
                }

            }
            else
            {
                if (txtUsername.Text.Trim() == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Username');", true);
                    txtUsername.Focus();
                }
                else if (txtPassword.Text.Trim() == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Password'); ", true);
                    txtPassword.Focus();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Email'); ", true);
                    txtEmail.Focus();
                }


            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUname.Text.Trim() != "" & txtPwd.Text.Trim() != "")
            {

                DataSet dsLogin = DBClass.ExecSPds("sp_Sel_UserLogin", new string[] { "@Username", "@Password" }, new object[] { txtUname.Text.Trim(), txtPwd.Text.Trim() });
                if (dsLogin != null)
                {
                    if (dsLogin.Tables.Count > 0 && dsLogin.Tables[0].Rows.Count > 0)
                    {
                        Page.MaintainScrollPositionOnPostBack = false;
                        Session["Username"] = dsLogin.Tables[0].Rows[0][0].ToString();
                        Session["UserId"] = dsLogin.Tables[0].Rows[0][1].ToString();
                        Response.Redirect("Config.aspx");
                    }
                    else
                    {
                        Page.MaintainScrollPositionOnPostBack = true;
                        lblError.Text = "Invalid Credentials";
                    }


                }
                else
                {
                    Page.MaintainScrollPositionOnPostBack = true;
                    lblError.Text = "Invalid Credentials";
                }



            }
            else
            {
                if (txtUname.Text.Trim() == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Username'); ", true);
                    txtUname.Focus();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Password'); ", true);
                    txtPwd.Focus();
                }


            }
        }
    }
}