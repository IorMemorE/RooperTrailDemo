extends Control

@onready
var info_bar:InfoBar= $InfoBar
@onready
var hospital_board:BasicBoard= $HospitalBoard
@onready
var shrine_board:BasicBoard= $ShrineBoard
@onready
var city_board:BasicBoard= $CityBoard
@onready
var school_board:BasicBoard= $SchoolBoard

func get_board(board_name: StringName) -> BasicBoard:
	match board_name:
		&"hospital":
			return hospital_board
		&"shrine":
			return shrine_board
		&"city":
			return city_board
		&"school":
			return school_board
		_:
			return null

var is_ready := false

func _ready() -> void:

	is_ready = true