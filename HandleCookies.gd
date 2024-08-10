extends Node

var cookies = 0
@onready var cookiedisplay = $"/root/Node2D/HandleCookies/Label"
@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
@onready var savefunc = $"/root/Savefunc"

var save_path = "user://cookie.save"


func _process(delta):
	cookiedisplay.text = "cookies: " + str(cookies)

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getpointeramnt():
	return Pointer.PointerAmt

func _ready():
	load_data()


func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		cookies = file.get_var(cookies)
	else:
		print ("no data saved")
		cookies = 0

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		savefunc.save()
		get_tree().quit()
