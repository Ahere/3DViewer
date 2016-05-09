using UnityEngine;
using System.Collections;

public class LoadLevelScript : MonoBehaviour {

	public void LoadMainMenu(){
		Application.LoadLevel( "MainMenu");
	}

	public void LoadJoystickEvent(){
		Application.LoadLevel( "Joystick-Event-Input");
	}

	public void LoadJoysticParameter(){
		Application.LoadLevel("Joystick-Parameter");
	}

	public void LoadDPadEvent(){
		Application.LoadLevel("DPad-Event-Input");
	}

	public void LoadDPadClassicalTime(){
		Application.LoadLevel("DPad-Classical-Time");
	}

	public void LoadTouchPad(){
		Application.LoadLevel ("TouchPad-Event-Input");
	}

	public void LoadButton(){
		Application.LoadLevel("Button-Event-Input");
	}

	public void LoadFPS(){
		Application.LoadLevel("FPS_Example");
	}
}
