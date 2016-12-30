using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientMLT;

namespace DA
{
    public partial class MemoryTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {

                Session["sec"] = 20;
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int secval = Convert.ToInt32(Session["sec"].ToString());
            secval--;
            Session["sec"] = secval;
            if (secval <= 0)
            {
                Label19.Text = "TimeOut!";
                Session["sec"] = null;
                
                
            }
            else
            {
                Label19.Text = "Time Left: " + secval.ToString() + " seconds";
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            string query = "select count(*) from PreMemoryAnswers where UserId=" + Session["UserId"];
            string Mode = "";
            DataSet dsRes = DBClass.ExecQryds(query);
            if (dsRes != null)
            {
                if (dsRes.Tables.Count > 0 && dsRes.Tables[0].Rows.Count > 0)
                {
                    if (dsRes.Tables[0].Rows[0][0].ToString() != "0")
                    {
                        Mode = "Post";

                    }
                    else
                        Mode = "Pre";
                }
            }
            string Result = DBClass.ExecSPstr("sp_Ins_MemoryAnswers", new string[] { "@UserId", "@Mq1", "@Mq2", "@Mq3", "@Mq4", "@Mq5", "@Mq6",
                "@Mq7", "@Mq8", "@Mq9","@Mq10", "@Mq11", "@Mq12","@Mq13", "@Mq14", "@Mq15","@Mode" },
                new object[] 
            { Session["UserId"],chk1.Checked ? "1" : "0",chk2.Checked ? "1" : "0",chk3.Checked ? "1" : "0",chk4.Checked ? "1" : "0",chk5.Checked ? "1" : "0",chk6.Checked ? "1" : "0",
                chk7.Checked ? "1" : "0",chk8.Checked ? "1" : "0",chk9.Checked ? "1" : "0",chk10.Checked ? "1" : "0",chk11.Checked ? "1" : "0",
                chk12.Checked ? "1" : "0",chk13.Checked ? "1" : "0",chk14.Checked ? "1" : "0",chk15.Checked ? "1" : "0",Mode });
            if (Result == "Successful")
            {
                //
                string query1 = "select count(*) from PostTestResults where UserId=" + Session["UserId"];
                DataSet dsRes1 = DBClass.ExecQryds(query1);
                if (dsRes1 != null)
                {
                    if (dsRes1.Tables.Count > 0 && dsRes1.Tables[0].Rows.Count > 0)
                    {
                        if (dsRes1.Tables[0].Rows[0][0].ToString() != "0")
                        {
                            Response.Redirect("TestResults.aspx");
                            
                        }
                        else
                            Response.Redirect("VideoInstructions.aspx");
                    }
                }
            }

            //

           // ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Submitted successfully. \\n You can proceed to the Brain Entertainment session. \\n Thank you.');window.location='VideoInstructions.aspx';", true);
        }
    }
}