using UnityEngine;
using System.Collections;

public class Mover : MonoBehaviour {

	private  Rigidbody rb1;
	public float speed;

	void Start () {

		rb1 = GetComponent<Rigidbody>();
		rb1.velocity = transform.forward * speed;
		}
		
}
