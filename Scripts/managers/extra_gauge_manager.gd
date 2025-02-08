extends Control
class_name ExtraGaugeManager
@onready
var info_pivot = $InfoPivot
@onready
var index_pivot = $IndexPivot
@onready
var index_start_position :Vector2= index_pivot.position 

signal extra_changed(v: int)

@export 
var enable := false:
	set(v):
		enable = v
		if is_ready:
			put_token()
const info_size: Vector2 = Vector2(128, 128)
const index_size: Vector2 = Vector2(118, 118)
const index_gap := 18.0 + 118.0
var is_ready := false
@export
var exvalue := 0:
	set(v):
		if v < 0 || v > max_exvalue:
			print("Invalid ExValue %d" % v)
			return
		if exvalue != v:
			emit_signal("extra_changed", v)
		exvalue = v
		if is_ready:
			put_token()

func put_token() -> void:
	if !enable:
		info_pivot.show()
		index_pivot.hide()
		return

	info_pivot.hide()
	index_pivot.position = index_start_position + Vector2(0, exvalue * index_gap)
	index_pivot.show()

@export
var max_exvalue := 7:
	set(v):
		max_exvalue = clamp(v, 1, 7)

func _ready() -> void:
	print("Extra Guage manager ready")
	# print(info_pivot)
	# print(index_pivot)
	is_ready = true
