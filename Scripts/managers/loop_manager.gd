extends Control
class_name LoopManager
@onready
var info_pivot = $InfoPivot
@onready
var index_pivot = $IndexPivot
# on 0
@onready
var index_start_position:Vector2 = index_pivot.position + Vector2(0, 7 * index_gap)

signal loop_over(v:int)
signal game_over()

const info_size: Vector2 = Vector2(128,128)
const index_size: Vector2 = Vector2(118,118)
const index_gap := 18.0 + 118.0
var is_ready := false
@export
var current_loop:= 0:
	set(v):
		if v < 1:
			v = 1
		if v > max_loop:
			emit_signal("loop_over")
			current_loop = max_loop + 1
		else:
			emit_signal("game_over", v - 1)
			current_loop = v
		
		if is_ready:
			put_token()

func put_token() -> void:
	if current_loop == 0:
		index_pivot.hide()
		info_pivot.show()
		return
	var left_loop = max_loop - current_loop + 1
	info_pivot.hide()
	index_pivot.position = index_start_position - Vector2(0,left_loop * index_gap)
	index_pivot.show()

@export 
var max_loop := 7:
	set(v):
		max_loop = clamp(v, 1, 7)

func _ready() -> void:
	print("Loop manager ready")
	# print(info_pivot)
	# print(index_pivot)
	is_ready = true
