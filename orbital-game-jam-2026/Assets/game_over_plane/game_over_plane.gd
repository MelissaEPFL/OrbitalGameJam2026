class_name GameOverPlane extends Node3D

## Emitted when the player's physics body crosses the game-over plane.
## Connect this signal to trigger the game-over / respawn logic.
signal game_over

@onready var detection_area: Area3D = $DetectionArea

func _ready() -> void:
	detection_area.body_entered.connect(_on_body_entered)

## Fires game_over for any RigidBody3D that enters (the kiwi ball).
## Add the player body to a "player" group for stricter filtering if needed.
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") or body is RigidBody3D:
		game_over.emit()
