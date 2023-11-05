extends ColorRect

signal launch

var angleF = false
var up = true
# Called when the node enters the scene tree for the first time.
func _ready():
	var angleF = false
	var up = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if angleF:
		if up:
			position.y -= .025
		else:
			position.y += .025
	
		if position.y <= -157:
			up = false
		elif position.y >= -6:
			up = true
			
		if Input.is_action_just_pressed("left"):
			angleF = false
			var x = abs(position.y)/157
			Global.playerShot.y = 1800*x
			emit_signal("launch")
			
			pass
			
	
	pass


func _on_angle_arrow_angle_found():
	angleF = true
	#position.y += 200
	pass 
