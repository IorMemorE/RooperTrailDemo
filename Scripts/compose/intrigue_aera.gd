extends Area2D
class_name IntrigueArea

signal intrigue_changed(v:int)

@export
var intrigue := 0:
	set(value):
		intrigue = max(0, value)
		emit_signal("intrigue_changed", value)

@onready
var first:CollisionShape2D = $First
@onready
var second:CollisionShape2D = $Second
@onready
var tripled:CollisionShape2D = $Tripled
@onready
var extra:TextureRect = $Extra
@onready
var extra_label:Label = $Extra/Label

func _ready() -> void:
	first.hide()
	second.hide()
	tripled.hide()
	intrigue_changed.connect(_on_intrigue_changed)

func do_all_hide() -> void:
	first.hide()
	second.hide()
	tripled.hide()
	extra.hide()

func _on_intrigue_changed(v:int) -> void:
	print("Intrigue changed to: ", v)
	do_all_hide()
	if v > 5:
		print("Intrigue value is too high")
		extra.show()
		extra_label.text = "x{0}".format([v])
		return
	var _1f = v == 1 or v == 5
	var _2f = v == 2 or v > 3
	var _3f = v > 2
	first.visible = _1f
	second.visible = _2f
	tripled.visible = _3f

