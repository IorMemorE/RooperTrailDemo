extends Panel
class_name InfoBar

@onready
var day_manager:DayManager = $DayManager
@onready
var affair_manager:AffairManager = $AffairManager
@onready
var loop_manager:LoopManager= $LoopManager
@onready
var extra_gauge_manager:ExtraGaugeManager= $ExtraGaugeManager
@onready
var step_manager:StepManager = $StepManager
var is_ready := false
func _ready() -> void:
	is_ready = true	
