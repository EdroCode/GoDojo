extends CharacterBody2D

enum CorPlataforma { RELVA, TERRA, ROXO, METAL }
enum Direcoes { HORIZONTAL, VERTICAL}

@export var CorPlat: CorPlataforma = CorPlataforma.RELVA
@export var Direcao: Direcoes = Direcoes.HORIZONTAL

# Movimento
@export var velocidade: float = 100.0
@export var tempo_mudanca_direcao: float = 2.0

var dir: int = 1
var tempo_atual: float = 0.0

func _ready() -> void:
	match CorPlat:
		CorPlataforma.RELVA:
			$Relva.visible = true
			$Terra.visible = false
			$Roxo.visible = false
			$Metal.visible = false
		CorPlataforma.TERRA:
			$Relva.visible = false
			$Terra.visible = true
			$Roxo.visible = false
			$Metal.visible = false
		CorPlataforma.ROXO:
			$Relva.visible = false
			$Terra.visible = false
			$Roxo.visible = true
			$Metal.visible = false
		CorPlataforma.METAL:
			$Relva.visible = false
			$Terra.visible = false
			$Roxo.visible = false
			$Metal.visible = true

func _physics_process(delta: float) -> void:
	tempo_atual += delta

	if tempo_atual >= tempo_mudanca_direcao:
		tempo_atual = 0.0
		dir *= -1
	
	if Direcao == HORIZONTAL:
		velocity.x = velocidade * dir
	else:
		velocity.y = velocidade * dir
	
	move_and_slide()
	
