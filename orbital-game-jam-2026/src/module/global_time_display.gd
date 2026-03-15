class_name GlobalTimeDisplay extends Node

static var singleton: GlobalTimeDisplay

var elapsed_time: float = 0.0
var _running: bool = true

func _ready() -> void:
	elapsed_time = 0.0
	singleton = self

func _process(delta: float) -> void:
	if _running:
		elapsed_time += delta

func stop() -> void:
	_running = false

func resume() -> void:
	_running = true

func reinitialize() -> void:
	elapsed_time = 0.0
	_running = true

func get_time() -> float:
	return elapsed_time

func get_formatted_time() -> String:
	var minutes := floori(elapsed_time / 60.0)
	var seconds := floori(elapsed_time) % 60
	var milliseconds := int(fmod(elapsed_time, 1.0) * 100)
	return "%02d:%02d.%02d" % [minutes, seconds, milliseconds]
