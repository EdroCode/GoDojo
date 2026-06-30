extends Area2D

enum CorBandeira { VERMELHO, VERDE, AZUL, AMARELO }
signal apanhada

@export var cor_bandeira: CorBandeira = CorBandeira.VERMELHO

func _ready() -> void:
	match cor_bandeira:
		CorBandeira.VERMELHO:
			$Sprite.play("Vermelho")
		CorBandeira.VERDE:
			$Sprite.play("Verde")
		CorBandeira.AZUL:
			$Sprite.play("Azul")
		CorBandeira.AMARELO:
			$Sprite.play("Amarelo")
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jogador"):
		$Sprite.play("Apanhada")
		emit_signal("apanhada")
