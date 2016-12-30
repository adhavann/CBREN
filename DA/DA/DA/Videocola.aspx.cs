using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using ClientMLT;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using System.Security.Cryptography.X509Certificates;

namespace DA
{
    public partial class Videocola : System.Web.UI.Page
    {
        string IotEndpoint = "a1pt2qyitncu2z.iot.us-west-2.amazonaws.com";
        List<string> mqval = new List<string>();
        int likecount;
        string flag = "0";
        /// <summary>
        /// This is the default TLS1.2 port that AWS IoT uses
        /// </summary>
        int BrokerPort = 8883;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");

            // Response.AppendHeader("Refresh", "10; URL="+url);

            if (!IsPostBack)
            {

                Session["sec"] = 2;

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

                Subscribeweb();
                Timer1.Enabled = false;

            }
            else
            {
                Label19.Text = "Time Left: " + secval.ToString() + " seconds";
            }

        }
        public void ClientMqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            char[] a = System.Text.Encoding.UTF8.GetChars(e.Message);
            //mqval.Add(a[0].ToString());



            if (a[0].ToString() == "T" || mqval.Count >= 1)
            {
                mqval.Add(a[0].ToString());
                int idx = mqval.IndexOf("T");
                if (a[0].ToString() == "T" && mqval.Count > 1)
                {
                    for (int i = 0; i < mqval.Count; i++)
                    {
                        // Console.WriteLine(" Val: " + mqval[i]);
                        if (mqval[i] == "1")
                            likecount += 1;


                    }
                    mqval.Clear();
                    if (likecount < 8)
                        flag = "1";


                }

            }



        }

        public void Subscribeweb()
        {
            //convert to pfx using openssl
            //you'll need to add these two files to the project and copy them to the output
            var clientCert = new X509Certificate2(Server.MapPath("YOURPFXFILE.pfx"), "12345");
            //this is the AWS caroot.pem file that you get as part of the download
            var caCert = X509Certificate.CreateFromSignedFile(Server.MapPath("Authfile.pem")); // this doesn't have to be a new X509 type...

            var client = new MqttClient(IotEndpoint, BrokerPort, true, caCert, clientCert, MqttSslProtocols.TLSv1_2 /*this is what AWS IoT uses*/);

            //event handler for inbound messages
            client.MqttMsgPublishReceived += ClientMqttMsgPublishReceived;


            //client id here is totally arbitary, but I'm pretty sure you can't have more than one client named the same.
            client.Connect("1183a");

            // '#' is the wildcard to subscribe to anything under the 'root' topic
            // the QOS level here - I only partially understand why it has to be this level - it didn't seem to work at anything else.
            client.Subscribe(new[] { "$aws/things/eeg/shadow/update" }, new[] { MqttMsgBase.QOS_LEVEL_AT_LEAST_ONCE });

            while (true)
            {
                //listen good!
                // onMessageArrived();
                // ClientMqttMsgPublishReceived(this, MqttMsgPublishEventArgs.Empty);
                if (likecount < 8 && flag == "1")
                {

                    //string Result = ClientMLT.DBClass.ExecSPstr("sp_InsertLikeCount", new string[] { "@LikeCount" }, new object[] { likecount });
                    Response.Redirect("Videocat.aspx");
                }


            }

        }
    }
}