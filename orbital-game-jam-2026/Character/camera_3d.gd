extends Camera3D

@export var target: Node3D
@export var offset := Vector3(0, 2, -3)
@export var follow_speed := 5.0

func _physics_process(delta):
	if target:
		var goal = target.global_position + offset
		global_position = global_position.lerp(goal, follow_speed * delta)
		look_at(target.global_position, Vector3.UP)
