extends Node

func on_death():
	ModulManager.singleton.load_module("lose-screen")
	GlobalSound.singleton.play("KiwiDeath")
	pass
