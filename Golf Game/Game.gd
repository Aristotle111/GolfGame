extends Node2D

@onready var c1 = $cameras/Camera1
@onready var c2 = $cameras/Camera2D

@onready var ball = $Ball

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if ball.global_position.x < 36:
		c1.global_position.x = -800
	elif ball.global_position.x >= 36 and ball.global_position.x < 2015:
		c1.global_position.x = 1052
	elif ball.global_position.x >= 2015:
		c1.enabled = false 
		c2.enabled = true
		
	$cameras/Camera2D.global_position = Vector2(ball.global_position.x, ball.global_position.y - 400)








func _on_ball_win():
	$Floor/Hole/win/particles.emitting = true
	print('won')
