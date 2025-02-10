extends Panel
class_name Card
@onready
var sprite: Sprite2D = $Sprite2D
@export
var can_right := false
@export
var can_preview := false

## 预览时的尺寸
const preview_size: Vector2 = Vector2(100,140) * 6

const std_size: Vector2 = Vector2(100,140) * 3

func _ready() -> void:
	custom_minimum_size = std_size
	if sprite.texture:
		sprite.scale = std_size / sprite.texture.get_size()

