extends Button

@onready var Gramby = $"/root/Node2D/HandleCookies/Gramby"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var display = $"/root/Node2D/HandleCookies/Label"
@onready var GrambyCount = $"/root/Node2D/HandleCookies/Gramby/GrambyCount"

var isfirstpurchase = true

var GrambyAmt = 0
var Grambycost = 100
var GrambyGenAmt = 2

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getcookies():
	return handlecookies.cookies



func _ready():
	Gramby.pressed.connect(self.onpurchase)

func haspointer():
	while (GrambyAmt > 0):
		var cookies = getcookies()
		cookies += (GrambyAmt * (GrambyGenAmt))
		handlecookies.cookies = cookies
		await wait(1)



func onpurchase():
	var currentcc = getcookies()
	if (currentcc >= Grambycost):
		var cost = getcookies()
		cost -= Grambycost
		handlecookies.cookies = cost
		GrambyAmt += 1
		GrambyCount.text = "Current: " + str(GrambyAmt) + "\nGenerating " + str(GrambyAmt * GrambyGenAmt) + " cookies per second"
		Grambycost += (Grambycost / 2) + GrambyAmt
		self.text = "gramby: " + str(Grambycost) + " cookies"
		if (isfirstpurchase):
			isfirstpurchase = false
			haspointer()
