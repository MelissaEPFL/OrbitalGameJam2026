extends Node3D

@export var elasticity: float = 0.5

func _ready() -> void:
	$RigidBody3D.elasticity = elasticity
