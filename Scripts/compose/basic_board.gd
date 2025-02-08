extends Panel
class_name BasicBoard
const std_size := Vector2(1519, 1076)

enum LocationKind {
	Faraway,
	Hospital,
	Shrine,
	City,
	School,
}

var sprite:Sprite2D 
@onready
var intrigue_area:IntrigueArea = $IntrigueAera 

@export 
var board_name := "None"
@export
var board_id := 0

func get_intrigue() -> int:
	return intrigue_area.intrigue

func _ready() -> void:
	if !sprite:
		sprite = $Sprite2D
	custom_minimum_size = std_size
	if sprite.texture:
		sprite.scale = std_size / sprite.texture.get_size()
		print(sprite.scale)
