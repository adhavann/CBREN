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
    public partial class LinguisticTest : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {

                Session["sec"] = 15;
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
                Response.Redirect("Puzzle.aspx");
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
            string query = "select count(*) from PreLinguisticAnswers where UserId=" + Session["UserId"];
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
            string Result = DBClass.ExecSPstr("sp_Ins_LinguisticAnswers", new string[] { "@UserId", "@Ltq1", "@Ltq2", "@Ltq3", "@Mode" }, new object[] {Session["UserId"], rbq1.SelectedValue.ToString(),rbq2.SelectedValue.ToString(),rbq3.SelectedValue.ToString(),Mode });
            if(Result=="Successful")
                
                 ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Submitted successfully. \\n You can proceed to the next session. \\n Thank you.');window.location='Puzzle.aspx';", true);
        }
    }
}