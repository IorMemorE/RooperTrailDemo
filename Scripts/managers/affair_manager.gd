extends Control
class_name AffairManager
const affair_count_max: = 8

@onready
var info_pivot := $InfoPivot
@onready
var index_pivot := $IndexPivot
@onready
var index_start_position:Vector2= index_pivot.position - Vector2(0, index_gap)
var index_pivot_list: Array[TextureRect] = []

const info_size: Vector2 = Vector2(128,128)
const index_size: Vector2 = Vector2(118,118)
const index_gap := 18.0 + 118.0
var is_ready := false

var max_day:int:
	get:
		return $"../DayManager".max_day

func int8_to_bit_array(v:int) -> Array[bool]:
	var result :Array[bool] = []
	for i in affair_count_max:
		result.append(bool((v >> i) & 1))
	return result

func get_affair_list() -> Array[bool]:
	return int8_to_bit_array(happen_list)

func set_affair(day:int,is_happend : bool = true) -> void:
	if day < 1 or day > max_day:
		return
	day -= 1
	if is_happend:
		happen_list |= 1 << day
	else:
		happen_list &= ~(1 << day)	

func is_affair_happend(day:int) -> bool:
	if day < 1 or day > max_day:
		return false
	day -= 1
	return bool((happen_list >> day) & 1)

## 在编辑器面板中，只应该设置前八位
@export_flags("1","2","3","4","5","6","7","8")
var happen_list:int = 0:
	set(v):
		happen_list = v
		if is_ready:
			put_token()

func put_token() -> void:
	var affair_list = get_affair_list()
	if happen_list != 0:
		info_pivot.hide()
	else:
		info_pivot.show()
	for i in affair_count_max:
		if affair_list[i]:
			index_pivot_list[i].show()
		else:
			index_pivot_list[i].hide()

func _ready() -> void:
	print("Affair manager ready")
	# print(info_pivot)
	# print(index_pivot.position)
	var gen_index_pivot := preload("res://Scenes/index_pivot.tscn")
	for i in affair_count_max:
		var new_index_pivot:TextureRect = gen_index_pivot.instantiate() as TextureRect
		new_index_pivot.name = "AffairDay{0}".format([i + 1])
		new_index_pivot.position = index_start_position + Vector2(0,(i + 1) * index_gap)	
		index_pivot_list.append(new_index_pivot)
		self.add_child(new_index_pivot)
	is_ready = true
