using UnityEngine;
using System.Collections;

public class UICompatibility : MonoBehaviour {

	public void SetCompatibility(bool value){
		EasyTouch.SetUICompatibily( value);
	}
}
