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
@onready
var sprite:Sprite2D  = $Sprite2D
@onready
var intrigue_area:IntrigueArea = $IntrigueAera 
@onready
var owner_area:OwnerArea = $OwnerArea

@export 
var board_name := "None"
@export
var board_id := 0

func get_intrigue() -> int:
	return intrigue_area.intrigue

func _ready() -> void:
	custom_minimum_size = std_size
	if sprite.texture:
		sprite.scale = std_size / sprite.texture.get_size()
		# print(sprite.scale)
