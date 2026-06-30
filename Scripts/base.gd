extends Node

# ============================================================
# NÍVEL 1 - Escreve aqui o teu código!
# ============================================================
# Referência para o teu personagem:
@onready var jogador = $Jogador

func _ready() -> void:
	# O teu código começa AQUI depois do sinal de dois pontos (:)
	# Exemplo:
	await jogador.esperar(2)
	await jogador.mover_direita(3)


func _on_bandeira_apanhada() -> void:
	await jogador.dizer("Ganhei!", 2.0)
