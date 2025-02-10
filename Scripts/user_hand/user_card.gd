extends Card
class_name UserCard
var is_ready := false

## 需要比Card更小的尺寸
const attach_size: Vector2 = Vector2(100,140) * 2
## 在手牌中的尺寸
const inhand_size: Vector2 = Vector2(100,140) * 4

func _ready() -> void:
	is_ready = true
