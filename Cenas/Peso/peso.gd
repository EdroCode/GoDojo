extends CharacterBody2D

@export var tempo_queda := 0.0
var fall = false

func _ready() -> void:
	if tempo_queda > 0:
		$Timer.wait_time = tempo_queda
	$Timer.start()

func _physics_process(delta: float) -> void:
	if not is_on_floor() and fall:
		velocity += get_gravity() * delta

	move_and_slide()


func _on_hurt_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jogador"):
		get_tree().quit()


func _on_timer_timeout() -> void:
	fall = true
	$Timer.stop()
	print("startfall")
