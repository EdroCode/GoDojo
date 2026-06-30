extends CharacterBody2D

# ============================================================
# JOGADOR - Movimento manual + Animações
# ============================================================

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVIDADE := 800.0

func _ready() -> void:
	$AnimationPlayer.play("Idle")

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity.y += GRAVIDADE * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer.play("Jump")

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite.flip_h = direction < 0
		if is_on_floor():
			$AnimationPlayer.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$AnimationPlayer.play("Idle")

	move_and_slide()
