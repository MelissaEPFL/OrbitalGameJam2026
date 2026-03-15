class_name TimeDisplay extends RichTextLabel

func _ready() -> void:
	GlobalTimeDisplay.singleton.reinitialize()

func _process(_delta: float) -> void:
	_update_display()

func stop() -> void:
	GlobalTimeDisplay.singleton.stop()

func resume() -> void:
	GlobalTimeDisplay.singleton.resume()

func reinitialize() -> void:
	GlobalTimeDisplay.singleton.reinitialize()
	_update_display()

func _update_display() -> void:
	var t := GlobalTimeDisplay.singleton.elapsed_time
	var minutes := floori(t / 60.0)
	var seconds := floori(t) % 60
	var milliseconds := int(fmod(t, 1.0) * 100)
	text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]
