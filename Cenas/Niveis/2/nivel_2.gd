extends Node

# ============================================================
# NÍVEL 2 - Escreve aqui o teu código!
# ============================================================
# Referência para o teu personagem:
@onready var jogador = $Jogador

func _ready() -> void:
	# O teu código começa AQUI depois do sinal de dois pontos (:)
	# Exemplo:
	await jogador.dizer("Hora do Nivel 2!", 1)


# Não tocar 
func _on_bandeira_apanhada() -> void:
	await jogador.dizer("Ganhei!", 2.0)
