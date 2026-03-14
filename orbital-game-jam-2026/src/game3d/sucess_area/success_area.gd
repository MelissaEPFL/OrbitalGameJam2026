class_name SuccessArea extends Node3D

## Emitted when the player's physics body enters the success area.
## Connect this signal to trigger the win/puzzle-complete logic.
signal player_won

## Rotation speed of the ring visual in radians per second
@export var rotation_speed: float = 1.5

@onready var ring: MeshInstance3D = $GreenRing
@onready var detection_area: Area3D = $DetectionArea

func _ready() -> void:
	detection_area.body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	ring.rotation.y += rotation_speed * delta

## Fires player_won for any RigidBody3D that enters (the kiwi ball).
## Add the player body to a "player" group for stricter filtering if needed.
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") or body is RigidBody3D:
		player_won.emit()
