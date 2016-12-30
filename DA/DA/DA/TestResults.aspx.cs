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
    public partial class TestResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["UserId"] == null)
               Response.Redirect("Login.aspx");
            LoadResults();

        }

        private void LoadResults()
        {
            string qry1 = "select Linguistic,Puzzle,Memory,Total from PreTestResults where UserId=" + Session["UserId"];
            DataSet dsres = DBClass.ExecQryds(qry1);
            if(dsres!=null)
            {
                if(dsres.Tables.Count>0 && dsres.Tables[0].Rows.Count>0)
                {
                    lblPreL.Text = dsres.Tables[0].Rows[0]["Linguistic"].ToString();
                    lblPreP.Text= dsres.Tables[0].Rows[0]["Puzzle"].ToString();
                    lblPreM.Text = dsres.Tables[0].Rows[0]["Memory"].ToString();
                    lblPreT.Text = dsres.Tables[0].Rows[0]["Total"].ToString();

                }
            }
            string qry2 = "select Linguistic,Puzzle,Memory,Total from PostTestResults where UserId=" + Session["UserId"];
            DataSet dsrespost = DBClass.ExecQryds(qry2);
            if (dsrespost != null)
            {
                if (dsrespost.Tables.Count > 0 && dsrespost.Tables[0].Rows.Count > 0)
                {
                    lblPostL.Text = dsrespost.Tables[0].Rows[0]["Linguistic"].ToString();
                    lblPostP.Text = dsrespost.Tables[0].Rows[0]["Puzzle"].ToString();
                    lblPostM.Text = dsrespost.Tables[0].Rows[0]["Memory"].ToString();
                    lblPostT.Text = dsrespost.Tables[0].Rows[0]["Total"].ToString();

                }
            }
        }
    }
}