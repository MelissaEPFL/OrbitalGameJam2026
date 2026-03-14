extends Node3D

@export var radius: float = 2.0

func _ready():
	# Area for detection
	var area = Area3D.new()
	var shape = CylinderShape3D.new()
	shape.radius = radius
	shape.height = 0.1
	
	var body = CollisionShape3D.new()
	body.shape = shape
	area.add_child(body)
	
	
	add_child(area)
	
	# Signal connection
	area.body_entered.connect(_on_finish_line_entered)

func _on_finish_line_entered(body):
	if body.is_in_group("player"):
		print("Puzzle completed!")
		# Trigger success effectsextends Node3D
