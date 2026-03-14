extends Node

func on_success():
	ModulManager.singleton.load_module("main_menu")
	GlobalSound.singleton.play("UiPlop")
	pass
