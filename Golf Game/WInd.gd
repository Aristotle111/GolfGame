extends Node2D

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.

var t = 0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += .0754
	
	global_position.y = 0 + displacement(t)
	
	
	
	
func displacement(t):
	var displacement = 20*sin(.0209*t)
	return displacement
