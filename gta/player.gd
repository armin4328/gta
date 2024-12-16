extends CharacterBody2D

@export var speed = 50 # Adjust this value to your desired speed
@onready var anim = $AnimationPlayer

var isAttacking = false

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if not isAttacking:
		if Input.is_action_pressed("left"):
			velocity.x -= speed
			
		if Input.is_action_pressed("right"):
			velocity.x += speed
		
		if Input.is_action_pressed("up"):
			velocity.y -= speed
			
		if Input.is_action_pressed("down"):
			velocity.y += speed
		
		# Play animations based on movement direction
		if velocity != Vector2.ZERO:
			if abs(velocity.x) > abs(velocity.y):
				if velocity.x > 0:
					anim.play("right")
				else:
					anim.play("left")
			else:
				if velocity.y > 0:
					anim.play("down")
				else:
					anim.play("up")
		else:
			anim.play("idle")
	
	move_and_slide()
