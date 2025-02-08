extends Area2D
class_name OwnerArea
@export
var area_owner:Variant = null
@onready
var pivot : CollisionShape2D = $OwnerPivot 
func _ready() -> void:
    if !area_owner:
        pivot.hide()
