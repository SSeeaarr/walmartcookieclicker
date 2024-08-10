extends Node

var save_path = "user://cookie.save"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
@onready var Gramby = $"/root/Node2D/HandleCookies/Gramby"
@onready var Farm = $"/root/Node2D/HandleCookies/Farm"

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(handlecookies.cookies)
	file.store_var(Pointer.PointerAmt)
	file.store_var(Pointer.Pointercost)
