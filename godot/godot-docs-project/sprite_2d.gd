extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta):
	# rotation is a property or Sprite2D
	rotation += angular_speed * delta
	
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_button_pressed() -> void:
	set_process(not is_processing())
	
func _ready():
	var timer = get_node("Sprite2DTimer")
	timer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout():
	visible = not visible
