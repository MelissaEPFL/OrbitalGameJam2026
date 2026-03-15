extends RichTextLabel

func _ready() -> void:
	text = "Time : " + GlobalTimeDisplay.singleton.get_formatted_time()
