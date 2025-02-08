class_name Token
extends Control

const std_size: Vector2 = Vector2(100,100)  

@onready var sprite:Sprite2D = $Sprite2D

func _ready() -> void:
	custom_minimum_size = std_size
	if sprite.texture:
		sprite.scale = std_size / sprite.texture.get_size()
