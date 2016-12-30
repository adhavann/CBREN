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
    public partial class Memory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {

                Session["sec"] = 10;
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
                Response.Redirect("MemoryTest.aspx");
            }
            else
            {
                Label19.Text = "Time Left: " + secval.ToString() + " seconds";
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemoryTest.aspx");
        }
    }
}