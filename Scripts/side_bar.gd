class_name RSidePanel
extends Panel
@export
var anime_duration := 0.3
var is_expanding := false
var can_anime := true

@export
var fake_expanding_control:bool: 
	set(_v):
		_on_toggle_pressed()

var tween :Tween
@onready
var contents:VBoxContainer = $Contents

func pull_out():
	can_anime = false
	tween = create_tween()
	tween.tween_property(self,"position:x", position.x - size.x, anime_duration)
	tween.tween_property(self,"can_anime", true, anime_duration)

func push_in():
	can_anime = false
	tween = create_tween().parallel()
	tween.tween_property(self,"position:x", position.x + size.x, anime_duration)
	tween.tween_property(self,"can_anime", true, anime_duration)

func _on_toggle_pressed() -> void:
	if !can_anime:
		return
	is_expanding = !is_expanding
	if is_expanding:
		pull_out()
	else:
		push_in()
	
