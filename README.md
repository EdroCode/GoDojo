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

## Componentes

Ao longo do projeto existem vários componentes que os ninjas podem usar no seu nível custom:

| | Componente | Descrição |
|---|---|---|
| <img width="48" height="48" alt="flag_yellow_a" src="https://github.com/user-attachments/assets/11955773-9b89-4b9b-a414-a8fdb67a68ad" /> | **Bandeira** | O objetivo do nível é apanhar a bandeira. |
| <img width="48" height="48" alt="key_yellow" src="https://github.com/user-attachments/assets/09285bae-4c92-4e6b-b662-26e6d9aa9a9c" /> | **Chave** | Existe em 4 cores. Cada cor está ligada ao cofre da mesma cor - ao ser apanhada, abre o(s) cofre(s) correspondente(s). |
| <img width="48" height="48" alt="lock_yellow" src="https://github.com/user-attachments/assets/fbb5acaf-0487-47fa-8f00-6bfc5dfa1f9f" /> | **Cofre** | Barreira que pode ser aberta ao apanhar a chave da cor correspondente. |
| <img width="48" height="48" alt="saw" src="https://github.com/user-attachments/assets/dcc5b87d-60af-4650-84c4-0b30710e0c84" /> | **Serra** | "Mata" o jogador ao ser tocada. Bloqueia caminhos, tornando os níveis mais difíceis. Pode estar sempre ativa ou ativar de X em X segundos por N tempo. |
| <img width="48" height="48" alt="spikes" src="https://github.com/user-attachments/assets/c49f79b0-599e-421a-be0c-e8a9171366d8" /> | **Spikes** | Igual à serra, mas mais versátil - pode ser colocado em paredes, solos, tetos, etc. |
| <img width="48" height="48" alt="spring" src="https://github.com/user-attachments/assets/aaf35436-bf11-45bc-b9d9-85ebf5e6cc2e" /> | **Mola** | Impulsiona o jogador com uma força definida. |
| <img width="48" height="48" alt="terrain_grass_cloud" src="https://github.com/user-attachments/assets/8abc5ab6-0697-421b-8f5e-9734871d6fe1" /> | **Plataforma** | Plataforma móvel que se desloca na horizontal ou vertical, durante X segundos, a uma velocidade definida. |
| <img width="48" height="48" alt="weight" src="https://github.com/user-attachments/assets/6d779b72-fc99-4457-9a0c-0bbe202e921c" /> | **Peso** | Cai após X segundos. "Mata" o jogador se o acertar por baixo. |
| <img width="64" height="64" alt="torch_on_a" src="https://github.com/user-attachments/assets/945851b6-bdf9-4765-b57f-a50dfe1ea636" />| **Tocha** | Uma tocha animada |

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
