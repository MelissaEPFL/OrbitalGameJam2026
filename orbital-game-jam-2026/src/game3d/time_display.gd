extends RichTextLabel

var elapsed_time: float = 0.0
var _running: bool = true

func _ready() -> void:
	elapsed_time = 0.0
	_running = true

func _process(delta: float) -> void:
	if _running:
		elapsed_time += delta
		_update_display()

func stop() -> void:
	_running = false

func resume() -> void:
	_running = true

func reinitialize() -> void:
	elapsed_time = 0.0
	_running = true
	_update_display()

func _update_display() -> void:
	var minutes := int(elapsed_time) / 60
	var seconds := int(elapsed_time) % 60
	var milliseconds := int(fmod(elapsed_time, 1.0) * 100)
	text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]
