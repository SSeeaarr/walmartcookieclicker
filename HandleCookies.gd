extends Node

var cookies = 0
@onready var cookiedisplay = $"/root/Node2D/HandleCookies/Label"
@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
@onready var Gramby = $"/root/Node2D/HandleCookies/Gramby"
@onready var Farm = $"/root/Node2D/HandleCookies/Farm"
@onready var savefunc = $"/root/Savefunc"
var save_path = "user://cookie.save"

var pointeramt
var pointercost
var grambyamt
var grambycost
var farmamt
var farmcost

func updatepointers():
	Pointer.PointerAmt = pointeramt
	Pointer.Pointercost = pointercost
	Pointer.updatecounttext()
	Pointer.updateselftext()
	Pointer.haspointer()
	Gramby.GrambyAmt = grambyamt
	Gramby.Grambycost = grambycost
	Gramby.updatecounttext()
	Gramby.updateselftext()
	Gramby.haspointer()
	Farm.FarmAmt = farmamt
	Farm.Farmcost = farmcost
	Farm.updatecounttext()
	Farm.updateselftext()
	Farm.haspointer()
	
	


func _process(delta):
	cookiedisplay.text = "cookies: " + str(cookies)

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout


func _ready():
	cookies = 0
	grambyamt = Gramby.GrambyAmt
	grambycost = Gramby.Grambycost
	farmamt = Farm.FarmAmt
	farmcost = Farm.Farmcost
	load_data()




func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		cookies = file.get_var(cookies)
		pointeramt = file.get_var(Pointer.PointerAmt)
		pointercost = file.get_var(Pointer.Pointercost)
		grambyamt = file.get_var(Gramby.GrambyAmt)
		grambycost = file.get_var(Gramby.Grambycost)
		farmamt = file.get_var(Farm.FarmAmt)
		farmcost = file.get_var(Farm.Farmcost)
		updatepointers()
	else:
		print ("no data saved")


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		savefunc.save()
		get_tree().quit()
