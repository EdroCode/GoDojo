extends Area2D

@export var sempre_ativo: bool = true
@export var tempo_ativo: float = 1.0
@export var tempo_inativo: float = 1.0

@onready var anim = $AnimationPlayer

var ativo: bool = true

func _ready() -> void:
	if sempre_ativo:
		ativo = true
		anim.play("spin")
	else:
		ativo = false
		anim.play("idle")
		_alternar_estado()


func _alternar_estado() -> void:
	while not sempre_ativo:
		ativo = true
		anim.play("spin")
		await get_tree().create_timer(tempo_ativo).timeout

		ativo = false
		anim.play("idle")
		await get_tree().create_timer(tempo_inativo).timeout


func _on_body_entered(body: Node2D) -> void:
	if ativo and body.is_in_group("Jogador"):
		get_tree().quit()
