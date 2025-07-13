extends Area2D

@export var 	speed		:	int 	=	 400
var 			screen_size	:	Vector2
var 			radius	:	Vector2
signal			hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Hide at the start
	screen_size = get_viewport_rect().size
	radius = Vector2($CollisionShape2D.shape.radius, $CollisionShape2D.shape.height / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1 #+= 1 because if also pressing move_left it cancels out
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed #normalized() is used so diagonal peed is the same as vertical/horizontal
		position += velocity * delta
		
		if abs(velocity.x) > abs(velocity.y):
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_h = velocity.x < 0
		else:
			$AnimatedSprite2D.animation = "up"
			$AnimatedSprite2D.flip_v = velocity.y > 0
		
		$AnimatedSprite2D.play()

	else:
		$AnimatedSprite2D.stop()
		
	position = position.clamp(radius, screen_size - radius)


func _on_body_entered(body: Node2D) -> void:
	hide() 
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true) #prevent repeat hits

func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false
