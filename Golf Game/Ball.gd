extends RigidBody2D

signal landed
signal start
signal win

@onready var arrow = $"../angleArrow"
@onready var bar = $"../powerBar"

var launchReady = false
var posX = 0
var posY = 0



var onFloor
var awaitLanding = true 
var landingVelocity = Vector2()

var x = 1

var started = true
var aiming = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = -1500
	position.y = 525
	emit_signal("start")
	gravity_scale = 1
	pass # Replace with function body.





	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(round(linear_velocity.x))
	
	
	if not started:
		if (abs(round(linear_velocity.x)) == 10) and (global_position.y >= 555 or (global_position.y <= 180 and global_position.y >= 143)):
			#$".".linear_velocity = Vector2(0,0)
			emit_signal("start")
			arrow.visible = true
			print('s')
			started = true
			aiming = false

	
	if linear_velocity.y != 0:
		landingVelocity = linear_velocity
			
	if launchReady:
		
		
		var posX = Global.playerShot.y * cos(deg_to_rad(Global.playerShot.x))
		var posY = -abs(Global.playerShot.y * sin(deg_to_rad(Global.playerShot.x)))
		
		apply_central_impulse(Vector2(posX,posY))
		
		launchReady = false
	



func _on_black_bar_launch():
	launchReady = true
	started = false
	toggle()
	pass


func _on_area_2d_body_entered(body):
	emit_signal("landed")
	#print('landed')


func _on_area_2d_body_exited(body):
	pass
	

	



func _on_landed():
	
	
	
	#landingVelocity = linear_velocity
	linear_velocity = Vector2(0.001,0.001)
	apply_central_impulse(Vector2((landingVelocity.x)/1.5, -abs(landingVelocity.y)/2))
	#apply_central_impulse(Vector2((landingVelocity.x)/1.5, -abs(600)/2))
	

func toggle():
	arrow.visible = !arrow.visible
	bar.visible = !bar.visible
	


#func _on_triangle_area_area_entered(area):
	#emit_signal("landed")





func _on_air_body_entered(body):
	gravity_scale = -1


func _on_air_body_exited(body):
	gravity_scale = 1


func _on_win(body):
	emit_signal("win")
