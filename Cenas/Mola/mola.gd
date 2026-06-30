extends Area2D

@export var Force = 1.0
@export var Cooldown = 1.0

var _jogador: Node2D = null

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jogador"):
		_jogador = body
		_jogador.impulso(Force)
		$Sprite.play("activate")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Jogador"):
		_jogador = null
