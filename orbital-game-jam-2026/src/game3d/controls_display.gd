extends RichTextLabel

var elapsed_time: float = 0.0
var _running: bool = true
var control_text = "How to Play:\nLeft/Right arrows to move\nQ/E for Bounce control\nSPACE to restart !"
var max_time = 6.0


		
func _ready() -> void:
	elapsed_time = 0.0
	_running = true
	text = control_text
	pass 
	
func _process(delta: float) -> void:
	if _running:
		elapsed_time += delta
		if (int(elapsed_time) % 60)  > max_time:
			_update_display()


func _update_display() -> void:
	_running = false
	text = ""
	
