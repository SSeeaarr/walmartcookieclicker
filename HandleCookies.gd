extends Node

var cookies = 0
@onready var cookiedisplay = $"/root/Node2D/HandleCookies/Label"
@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
var elapsetime = 0

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getpointeramnt():
	return Pointer.PointerAmt

func _ready():
	cookiedisplay.text = "cookies: " + str(cookies)



