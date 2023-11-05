extends Node2D

signal angleFound

@onready var ball = $"../Ball"

#var rot = 0
var getAngle = true
var move = true
var up = true #0 to -65
# Called when the node enters the scene tree for the first time.
func _ready():
	var move = true
	var up = true #0 to -65
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if getAngle:
		if Input.is_action_just_pressed("ui_select"):
			move = false
			getAngle = false
			var angle = abs(rotation_degrees)
			Global.playerShot.x = angle
			emit_signal("angleFound")
			
			
			
			
		if move:
			
			if up:
				rotation_degrees -= .025
			else:
				rotation_degrees += .025
			
			if rotation_degrees < -180:
				up = false
			elif rotation_degrees > 0:
				up = true
	position = ball.global_position





func _on_ball_start():
	visible = true
	
	getAngle = true
	move = true
	up = true 
