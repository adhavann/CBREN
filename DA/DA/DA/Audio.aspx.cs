using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace DA
{
    public partial class Audio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                audio1.Visible = true;
                audio2.Visible = false;
                audio3.Visible = false;
            }

        }

        protected void rbq2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbq2.SelectedValue == "1")
            {
                audio1.Visible = true;
                audio2.Visible = false;
                audio3.Visible = false;


            }
            if (rbq2.SelectedValue == "2")
            {
                audio2.Visible = true;
                audio1.Visible = false;
                audio3.Visible = false;
            }
            if (rbq2.SelectedValue == "3")
            {
                audio3.Visible = true;
                audio1.Visible = false;
                audio2.Visible = false;
            }

        }

        //protected void btnGame_Click(object sender, EventArgs e)
        //{
        //    Process p = new Process();
        //    p.StartInfo.FileName = Server.MapPath("GameUnity/test1.exe");
        //    p.Start();

        //}
    }
}