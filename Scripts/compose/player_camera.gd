extends Camera2D
class_name PlayerCamera	
@export
var zoom_speed := 0.1
@export
var zoom_range := Vector2(0.3, 3.0)

var is_dragging := false

func _input(event: InputEvent) -> void:
	match typeof(event):
		InputEventMouseButton:
			handle_mouse_button(event)
		InputEventMouseMotion:
			handle_drag(event)
		_:
			pass
	match event:
		_ when event as InputEventMouseButton:
			handle_mouse_button(event)
		_ when event as InputEventMouseMotion:
			handle_drag(event)
		_:
			pass

func handle_mouse_button(event: InputEventMouseButton) -> void:
	match [event.button_index, event.pressed]:
		[MOUSE_BUTTON_MIDDLE, true]:
			get_viewport().set_input_as_handled()
			start_drag()
		[MOUSE_BUTTON_MIDDLE, false]:
			get_viewport().set_input_as_handled()
			end_drag()
		[MOUSE_BUTTON_WHEEL_UP, true]:
			get_viewport().set_input_as_handled()
			handle_zoom(1)
		[MOUSE_BUTTON_WHEEL_DOWN, true]:
			get_viewport().set_input_as_handled()
			handle_zoom(-1)
		_:
			pass

func handle_zoom(direction: int) -> void:
	var zoom_factor = 1 + zoom_speed * direction
	var new_zoom = zoom * zoom_factor
	new_zoom = new_zoom.clamp(zoom_range.x * Vector2.ONE, zoom_range.y * Vector2.ONE)
	zoom = new_zoom

func handle_drag(event: InputEventMouseMotion) -> void:
	if !is_dragging:
		return
	position -= event.relative / zoom

func start_drag() -> void:
	if is_dragging:
		return
	is_dragging = true

func end_drag() -> void:
	if !is_dragging:
		return
	is_dragging = false

var fetch_global_mouse_position: Vector2:
	get:
		return get_canvas_transform().affine_inverse() * get_viewport().get_mouse_position()
