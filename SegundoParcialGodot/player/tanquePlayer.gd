extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 200

onready var preBala = preload("res://Escenas/Bala.tscn")


func _physics_process(delta):
	
	if Input.is_action_pressed("a"):
		velocity.x = -speed
		
	elif Input.is_action_pressed("d"):
		velocity.x = speed
		
	else:
		velocity.x = lerp(velocity.x,0,0.2)
		
	if Input.is_action_pressed("w"):
		velocity.y = -speed
		
	elif Input.is_action_pressed("s"):
		velocity.y = speed
		
	else:
		velocity.y = lerp(velocity.y,0,0.2)
		
	#apuntar
	look_at(get_global_mouse_position())
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_released("click_izq"):
		
		var balaInstan = preBala.instance()
		get_parent().add_child(balaInstan)
		#bala obtiene posicion del player
		balaInstan.position = self.position
		#bala rota con el player
		balaInstan.rotate(self.rotation)
	
	
	
	
