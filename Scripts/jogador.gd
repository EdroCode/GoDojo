extends CharacterBody2D

# ============================================================
# BIBLIOTECA DO JOGADOR - CoderDojo Godot 4
# ============================================================
# Usa esta biblioteca para controlar o teu personagem!
# Chama as funções abaixo no ficheiro "nivel.gd"
# ============================================================

const VELOCIDADE := 200.0
const GRAVIDADE := 800.0
const FORCA_SALTO := -500.0

var _fila_acoes: Array = []
var _a_executar := false

func _ready() -> void:
	$AnimationPlayer.play("Idle") 

# ── Variáveis internas ──────────────────────────────────────
func _physics_process(delta: float) -> void:
	# Aplica gravidade
	if not is_on_floor():
		velocity.y += GRAVIDADE * delta
	
	move_and_slide()

# ============================================================
# FUNÇÕES PARA OS NINJAS USAREM
# ============================================================

## Move o personagem para a DIREITA durante [duracao] segundos
func mover_direita(duracao: float = 1.0) -> void:
	$AnimationPlayer.play("Run")
	await _mover(Vector2(VELOCIDADE, 0), duracao)

## Move o personagem para a ESQUERDA durante [duracao] segundos
func mover_esquerda(duracao: float = 1.0) -> void:
	$AnimationPlayer.play("Run")
	await _mover(Vector2(-VELOCIDADE, 0), duracao)

## Faz o personagem saltar
func saltar() -> void:
	$AnimationPlayer.play("Jump")
	if is_on_floor():
		velocity.y = FORCA_SALTO
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("Idle")

## Faz o personagem receber um impulso
func impulso(Multiplicador) -> void:
	$AnimationPlayer.play("Jump")
	velocity.y = FORCA_SALTO * Multiplicador  
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("Idle")

## Faz o personagem saltar e mover para a DIREITA durante [duracao] segundos
func saltar_direita(duracao: float = 0.6) -> void:
	$AnimationPlayer.play("Jump")
	if is_on_floor():
		velocity.y = FORCA_SALTO
	await _mover(Vector2(VELOCIDADE, 0), duracao)

## Faz o personagem saltar e mover para a ESQUERDA durante [duracao] segundos
func saltar_esquerda(duracao: float = 0.6) -> void:
	$AnimationPlayer.play("Jump")
	if is_on_floor():
		velocity.y = FORCA_SALTO
	await _mover(Vector2(-VELOCIDADE, 0), duracao)

## Espera [duracao] segundos sem fazer nada
func esperar(duracao: float = 1.0) -> void:
	$AnimationPlayer.play("Idle")
	velocity.x = 0
	await get_tree().create_timer(duracao).timeout

## Diz uma mensagem no ecrã durante [duracao] segundos
func dizer(mensagem: String, duracao: float = 2.0) -> void:
	var label := $Label
	label.text = mensagem
	await get_tree().create_timer(duracao).timeout
	label.text = ""



## Toca um som (nome do ficheiro sem extensão, ex: "salto")
func tocar_som(nome: String) -> void:
	var caminho := "res://sons/" + nome + ".wav"
	if ResourceLoader.exists(caminho):
		var player := AudioStreamPlayer.new()
		player.stream = load(caminho)
		add_child(player)
		player.play()
		await player.finished
		player.queue_free()

## Vai para o próximo nível
func proximo_nivel() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://niveis/nivel_2.tscn")

# ── Função interna de movimento ─────────────────────────────
func _mover(direcao: Vector2, duracao: float) -> void:
	$AnimationPlayer.play("Run")
	var tempo := 0.0
	while tempo < duracao:
		velocity.x = direcao.x
		await get_tree().process_frame
		tempo += get_process_delta_time()
	velocity.x = 0
	$AnimationPlayer.play("Idle")
