# CoderDojo : Godot 4

Um projeto Godot 4 para o CoderCamp do CoderDojo onde os ninjas constroem o seu próprio nível de plataformas chamando funções simples (como blocos do Scratch), sem precisar de aprender toda a linguagem GDScript.

## Sobre o Projeto

Em vez de escrever GDScript do zero, os ninjas usam uma pequena biblioteca de funções prontas para controlar o personagem: mover, saltar e falar. A lógica do nível é construída chamando essas funções, uma linha de cada vez, de cima para baixo.

**Objetivos:**
- Compreender o conceito de função e de chamada de função
- Perceber que o código é executado linha a linha, de cima para baixo
- Personalizar um nível de plataformas usando as funções disponíveis

## Estrutura do Projeto

```
GoDojo/
├── project.godot
├── icon.svg
├── README.md
├── Artwork/
├── Scripts/
├── Cenas/
│   ├── base.tscn
│   ├── jogador.tscn
│   ├── Plataforma/
│   ├── Gear/
│   ├── Mola/
│   ├── Bandeira/
│   └── Niveis/
│       ├── 1/
│       │   ├── nivel_1.tscn
│       │   └── nivel_1.gd
│       ├── 2/
│       ├── 3/
│       ├── 4/
│       └── Custom/
```

## Como Funciona

Cada nível tem o seu próprio ficheiro de script, por exemplo `nivel_1.gd`:

```gdscript
extends Node
@onready var jogador = $Jogador

func _ready() -> void:
    # O teu código começa aqui!
    await jogador.esperar(0.5)
    await jogador.mover_direita(1.0)
    await jogador.saltar()
    await jogador.dizer("Olá!", 2.0)
```

Cada chamada como `await jogador.mover_direita(1.0)` é uma instrução ao personagem -> neste caso, "anda para a direita durante 1 segundo".

## Tabela de Funções (Cartão de Referência)

| Função | Parâmetro | O que faz |
|---|---|---|
| `mover_direita(seg)` | seg = segundos | Move o personagem para a direita |
| `mover_esquerda(seg)` | seg = segundos | Move o personagem para a esquerda |
| `saltar()` | — | Faz o personagem saltar |
| `saltar_direita(seg)` | seg = segundos | Salta e move para a direita |
| `saltar_esquerda(seg)` | seg = segundos | Salta e move para a esquerda |
| `esperar(seg)` | seg = segundos | Pausa o personagem |
| `dizer(texto, seg)` | texto, segundos | Mostra uma mensagem por cima do personagem |

### Exemplos Rápidos

```gdscript
# Mover 1 segundo para a direita
await jogador.mover_direita(1.0)

# Esperar meio segundo
await jogador.esperar(0.5)

# Saltar e depois mover para a direita
await jogador.saltar_direita(0.6)

# Dizer algo durante 3 segundos
await jogador.dizer("Consegui!", 3.0)
```

## Soluções de Referência

> Estas são soluções possíveis para cada nível, incluídas como referência - há várias formas corretas de completar cada um.

**Nível 1**
```gdscript
await jogador.dizer("Hora do Nivel 1!", 1)
await jogador.mover_direita(0.8)
await jogador.saltar()
await jogador.mover_direita(1.3)
await jogador.saltar()
await jogador.mover_direita(1.3)
await jogador.saltar()
await jogador.mover_direita(1.3)
```

**Nível 2**
```gdscript
await jogador.dizer("Hora do Nivel 2!", 1)
await jogador.mover_direita(0.8)
await jogador.saltar()
await jogador.mover_direita(0.8)
await jogador.saltar()
await jogador.mover_direita(3)
```

**Nível 3**
```gdscript
await jogador.esperar(2.1)
await jogador.mover_direita(2.2)
await jogador.esperar(0.8)
await jogador.mover_direita(2.5)
```

**Nível 4**
```gdscript
await jogador.dizer("Hora do Nivel 4!", 1)
await jogador.mover_direita(2.2)
await jogador.saltar()
await jogador.mover_direita(0.4)
await jogador.saltar()
await jogador.mover_direita(0.4)
await jogador.mover_direita(1.8)
await jogador.saltar()
await jogador.esperar(4)
await jogador.saltar()
await jogador.mover_direita(1.8)
```

## Notas para Mentores

Recomenda-se que os mentores sem experiência prévia com Godot experimentem o projeto de forma autónoma antes da sessão, e que compreendam o básico de tilemaps na Godot para a criação de níveis personalizados.
