extends Button

@onready var Farm = $"/root/Node2D/HandleCookies/Farm"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var display = $"/root/Node2D/HandleCookies/Label"
@onready var farmcount = $"/root/Node2D/HandleCookies/Farm/FarmCount"

var isfirstpurchase = true

var FarmAmt = 0
var Farmcost = 500
var FarmGenAmt = 10

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getcookies():
	return handlecookies.cookies

func _ready():
	Farm.pressed.connect(self.onpurchase)

func haspointer():
	while (FarmAmt > 0):
		var cookies = getcookies()
		cookies += (FarmAmt * (FarmGenAmt))
		handlecookies.cookies = cookies
		await wait(1)

func updatecounttext():
	farmcount.text = "Current: " + str(FarmAmt) + "\nGenerating " + str(FarmAmt * FarmGenAmt) + " cookies per second"

func updateselftext():
	self.text = "farm: " + str(Farmcost) + " cookies"

func onpurchase():
	var currentcc = getcookies()
	if (currentcc >= Farmcost):
		var cost = getcookies()
		cost -= Farmcost
		handlecookies.cookies = cost
		FarmAmt += 1
		updatecounttext()
		Farmcost += (Farmcost / FarmAmt) + FarmAmt
		updateselftext()
		if (isfirstpurchase) and (FarmAmt <= 1):
			isfirstpurchase = false
			haspointer()
