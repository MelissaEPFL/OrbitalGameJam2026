extends RigidBody3D

var speed = 5.0
var elasticity = 0.5  # 0.0 = no bounce, 1.0 = super bouncy
var bounciness = 20.0

func _physics_process(delta):
	
	# Control Left/right only
	var dir_x = Input.get_axis("ui_right", "ui_left")
	linear_velocity.x = dir_x * speed
	
	#Control elasticity
	if Input.is_action_pressed("elasticity_up"):
		elasticity = min(elasticity + 0.5 * delta, 1.0)
	if Input.is_action_pressed("elasticity_down"):
		elasticity = max(elasticity - 0.5 * delta, 0.0)

	physics_material_override.bounce = elasticity
	
func _on_body_entered(body):
	if body.is_in_group("ground"):
		var bounce_force = elasticity * bounciness
		apply_central_impulse(Vector3.UP * bounce_force)
