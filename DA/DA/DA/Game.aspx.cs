using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.ComponentModel;

namespace DA
{
    public partial class Game : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["run"] == null)
                Session["run"] = "0";

            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            if (Session["run"].ToString() == "0")
            {
                Process p = new Process();
                p.StartInfo.FileName = Server.MapPath("GameUnity/cbren_game_final.exe");
                p.Start();
                Session["run"] = "1";
            }
           

        }
    }
}