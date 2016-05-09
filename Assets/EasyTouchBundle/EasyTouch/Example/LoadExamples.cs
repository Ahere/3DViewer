using UnityEngine;
using System.Collections;

public class LoadExamples : MonoBehaviour {

	public void LoadExample(string level){
		Application.LoadLevel( level );
	}
}
