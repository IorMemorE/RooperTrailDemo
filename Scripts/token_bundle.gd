extends Control
class_name TokenBundle
var is_ready := false

@export 
var num := 1:
	set(v):
		num = v
		if is_ready:
			put_token()

@onready
var counter:Label = $Counter

func put_token() -> void:
	counter.text = "x%d" % num
	if num <= 0:
		hide()
	else:
		show()

func _ready() -> void:
	is_ready = true