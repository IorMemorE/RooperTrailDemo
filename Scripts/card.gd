extends Panel
class_name Card
@onready
var sprite: Sprite2D = $Sprite2D
@export
var can_right := false
@export
var can_preview := false

const std_size: Vector2 = Vector2(200,280)

func _ready() -> void:
	custom_minimum_size = std_size
	if sprite.texture:
		sprite.scale = std_size / sprite.texture.get_size()

