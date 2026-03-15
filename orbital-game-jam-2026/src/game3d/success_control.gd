extends Node

func on_success():
	ModulManager.singleton.load_module("win-screen")
	GlobalTimeDisplay.singleton.stop()
	GlobalSound.singleton.play("KiwiWin")
	pass
