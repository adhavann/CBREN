using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DA
{
    public partial class LTrain : System.Web.UI.Page
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            Response.Redirect("LinguisticTest.aspx");
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
                Response.Redirect("LinguisticTest.aspx");
            }
            else
            {
                Label19.Text ="Time Left: "+ secval.ToString() + " seconds";
            }

        }
    }
}