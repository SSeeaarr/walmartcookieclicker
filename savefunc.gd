extends Node

var save_path = "user://cookie.save"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
@onready var Gramby = $"/root/Node2D/HandleCookies/Gramby"
@onready var Farm = $"/root/Node2D/HandleCookies/Farm"


func getpointeramt():
	return Pointer.PointerAmt

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(handlecookies.cookies)
	file.store_var(Pointer.PointerAmt)
	file.store_var(Pointer.Pointercost)
	file.store_var(Gramby.GrambyAmt)
	file.store_var(Gramby.Grambycost)
	file.store_var(Farm.FarmAmt)
	file.store_var(Farm.Farmcost)
