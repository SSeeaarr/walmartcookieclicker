extends Button


@onready var save = $"/root/Node2D/HandleCookies/save"
@onready var savefunc = $"/root/Savefunc"

func _ready():
	save.pressed.connect(self.savestate)

func savestate():
	savefunc.save()
