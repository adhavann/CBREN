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
    public partial class Config : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                FetchConfigValues();
              
             }

        }

        private void FetchConfigValues()
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");

            DataSet dsLogin = DBClass.ExecSPds("sp_LoadConfig", new string[] { "@UserId"}, new object[] { Session["UserId"] });
            if(dsLogin!=null)
            {
                if(dsLogin.Tables.Count>0)
                {
                    if(dsLogin.Tables[0].Rows.Count>0)
                    {
                        txtAlpha.Text = dsLogin.Tables[0].Rows[0][0].ToString();
                        txtLTheta.Text = dsLogin.Tables[0].Rows[0][1].ToString();

                    }
                    if (dsLogin.Tables[1].Rows.Count > 0)
                    {
                        txtLeftAlpha.Text= dsLogin.Tables[1].Rows[0][0].ToString();
                        txtRightAlpha.Text = dsLogin.Tables[1].Rows[0][1].ToString();
                        txtNTheta.Text = dsLogin.Tables[1].Rows[0][2].ToString();

                    }
                }
            }
        }

       

        protected void btnDefault_Click(object sender, EventArgs e)
        {
            string query = "select LeftFrontalAlpha,RightFrontalAlpha,Theta from NeuralSettings";
            DataSet dsres = new DataSet();
            dsres = DBClass.ExecQryds(query);
            if(dsres!=null)
            {
                if(dsres.Tables.Count>0 && dsres.Tables[0].Rows.Count>0)
                {
                    txtLeftAlpha.Text = dsres.Tables[0].Rows[0][0].ToString();
                    txtRightAlpha.Text = dsres.Tables[0].Rows[0][1].ToString();
                    txtNTheta.Text = dsres.Tables[0].Rows[0][2].ToString();

                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            string result = DBClass.ExecSPstr("sp_InsUpdConfig", new string[] { "@UserId", "@value1", "@Value2", "@Value3", "@Mode" }, new object[] { Session["UserId"], txtLeftAlpha.Text, txtRightAlpha.Text, txtNTheta.Text, "L" });
            if (result == "Successful")
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Neural Feeback Configurations Saved successfully'); ", true);

        }

        protected void btnLDefault_Click(object sender, EventArgs e)
        {
            string query = "select Alphalevel,Thetalevel from LikeabilitySetting";
            DataSet dsres = new DataSet();
            dsres = DBClass.ExecQryds(query);
            if (dsres != null)
            {
                if (dsres.Tables.Count > 0 && dsres.Tables[0].Rows.Count > 0)
                {
                    txtAlpha.Text = dsres.Tables[0].Rows[0][0].ToString();
                    txtLTheta.Text = dsres.Tables[0].Rows[0][1].ToString();
                    
                }
            }

        }

        protected void btnLSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
            string result = DBClass.ExecSPstr("sp_InsUpdConfig", new string[] { "@UserId","@value1","@Value2","@Value3","@Mode" }, new object[] { Session["UserId"],txtAlpha.Text,txtLTheta.Text,"0","L" });
            if(result=="Successful")
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Likeability Configurations Saved successfully'); ", true);
        }

        protected void lnkLtrain_Click(object sender, EventArgs e)
        {
            Response.Redirect("LTrain.aspx");
        }
    }
}