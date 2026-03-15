extends Node

func on_success():
	ModulManager.singleton.load_module("win-screen")
	GlobalSound.singleton.play("KiwiWin")
	pass
