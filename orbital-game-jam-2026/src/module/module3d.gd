class_name Module3d extends Node3D

signal on_unload

func unload() -> void:
	on_unload.emit()
	queue_free()
