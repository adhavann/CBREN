using UnityEngine;
using System;
using Realtime.Ortc;
using System.Collections.Generic;
using System.Linq;
using Foundation.Debuging;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using uPLibrary.Networking.M2Mqtt.Utility;
using uPLibrary.Networking.M2Mqtt.Exceptions;
using LitJson;

[System.Serializable]
public class Boundary
{
	public float xMin,xMax,zMin,zMax;
}

public class Emotiv
{

	public double Valence { get; set;}
}

public class PlayerController : MonoBehaviour
{
	private Rigidbody rb;
	public float speed;
	public float tilt;
	public Boundary boundary;
	public float firerate = 0.5f;
	private float nextfire =0.0f;
	public char imp;
	public string character;
	public MqttClient client;
	public const string IotEndPoint = "iot.eclipse.org";
	public const int BrokerPort = 1883;

	private AudioSource weponshot;
	public GUIText ScoreText;
	public int score;
	public GUIText time;
	public float gametime;
	public GUIText gameover;
	public bool gameoverflag = false;
	public double result =0;






    public GameObject shot;
	public Transform shotspawn;
	void Start()
	{
		
		rb = GetComponent<Rigidbody> ();
		weponshot = GetComponent<AudioSource> ();
		score = 0;
		UpdateScore ();
		gametime = 60;
		UpdateTime();
		gameover.text = "";

		client = new MqttClient (IotEndPoint, BrokerPort, false, null);

		client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;	
		string clientId = "1883c"; 
		client.Connect(clientId); 
		client.Subscribe (new[] { "hci/brainwaves/result"}, new[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });

    }

	void Update()
	{
		/*using (FileStream fs = File.Open (path, FileMode.Open, FileAccess.Read, FileShare.Read)) {
			byte[] b = new byte[1];
			fs.Read (b, 0, 1);*/
		if (!gameoverflag) {
			SubractTime (Time.deltaTime);
		}
		if (gametime < 0) {
			gameover.text = "GameOver : Press 'R' to go to next Page";
			gametime = 0;
			UpdateTime ();
			GameOver ();

		}

		if (result > 0 && Time.time > nextfire) {	
				nextfire = Time.time + firerate;
				Instantiate (shot, shotspawn.position, shotspawn.rotation);
			weponshot.Play ();

			AddScore (1);
			result = 0;
			}
		if (gameoverflag) {
			if (Input.GetKeyDown (KeyCode.R)) {
				Application.OpenURL ("http://localhost:55906/Game");
				Application.Quit ();
			}
		}
		//}
	}
		
	void FixedUpdate ()
	{
		float moveHorizontal = Input.GetAxis ("Horizontal");
		float moveVertical = Input.GetAxis ("Vertical");

		Vector3 movement = new Vector3 (moveHorizontal, 0.0f, moveVertical);
		rb.velocity = movement * speed;


		rb.position = new Vector3
			(
				Mathf.Clamp(rb.position.x,boundary.xMin,boundary.xMax),
				0.0f,
				Mathf.Clamp(rb.position.z,boundary.zMin,boundary.zMax)
			);

		rb.rotation = Quaternion.Euler (0.0f, 0.0f, rb.velocity.x * -tilt);

	}

	void UpdateScore()
	{
		ScoreText.text = "SCORE: " + score;
	}

	void AddScore (int newScore)
	{
		score += newScore;
		UpdateScore();
	}
	void SubractTime(float timediff)
	{
		gametime -= timediff;
		UpdateTime ();
	}
	void UpdateTime()
	{
		time.text = "TIME: " + gametime;	
	}
	void GameOver ()
	{
		gameoverflag = true;
	}
	void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
	{ 
		character = System.Text.Encoding.UTF8.GetString (e.Message);
		Emotiv values = JsonMapper.ToObject<Emotiv> (character);
		result = values.Valence;
	}

}
