extends RichTextLabel

@export var player_body: RigidBody3D

func _ready() -> void:
	if not player_body:
		player_body = owner.get_node_or_null("world/KiwiBall/RigidBody3D")

func _process(_delta: float) -> void:
	if player_body:
		text = "Elasticity: %.2f" % player_body.elasticity
	else:
		text = "Elasticity: N/A"
