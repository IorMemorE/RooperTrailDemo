extends GridContainer
class_name CharaTokens

@onready var goodwill:TokenBundle = $Goodwill
@onready var paranoia:TokenBundle = $Paranoia
@onready var intrigue:TokenBundle = $Intrigue
@onready var acquainted:TokenBundle = $Acquainted
@onready var perished:TokenBundle = $Perished
@onready var dead:TokenBundle = $Dead
@onready var hope:TokenBundle = $Hope
@onready var despair:TokenBundle = $Despair

var is_ready := false
func _ready() -> void:
	is_ready = true


