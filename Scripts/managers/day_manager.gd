extends Control
class_name DayManager
@onready
var info_pivot = $InfoPivot
@onready
var index_pivot = $IndexPivot
@onready
var index_start_position = index_pivot.position - Vector2(0, index_gap)

signal today_over(v:int)
signal allday_over()

const info_size: Vector2 = Vector2(128,128)
const index_size: Vector2 = Vector2(118,118)
const index_gap := 18.0 + 118.0
var is_ready := false
@export
var today:= 0:
	set(v):
		if v < 1:
			today = 0
		elif v > max_day:
			emit_signal("allday_over")
			today = 0
		else:
			emit_signal("today_over", v - 1)
			today = v
		
		if is_ready:
			put_token()

func put_token() -> void:
	if today == 0:
		index_pivot.hide()
		info_pivot.show()
		return

	info_pivot.hide()
	index_pivot.position = index_start_position + Vector2(0,today * index_gap)
	index_pivot.show()

@export 
var max_day := 8:
	set(v):
		max_day = clamp(v, 1, 8)

func _ready() -> void:
	print("Day manager ready")
	# print(info_pivot)
	# print(index_pivot)
	is_ready = true
