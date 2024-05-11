# Expert-System
Sistema especialista modelado em prolog. 

Para executar o programa utilizar os seguintes comandos:
```
swipl -o games-expert-system -c games-expert-system.pl
swipl games-expert-system
```

Temos dois domínios bem definidos:

## Jogo
O primeiro domínio são os jogos que podem ser todos listados a partir da seguinte consulta:
```
lancou(Jogo, Ano).
```

## Jogador
O segundo domínio são os jogadores que podem ser todos listados a partir da seguinte consulta:
```
jogador(Jogador).
```

A principal função do programa é recomendar jogos para os jogadores a partir de várias fatos conhecidos tanto dos jogadores quanto dos jogos através da seguinte consulta:
```
recomenda(Jogador, Jogo).
```

## Autores:
- André William Régis (19200411)
- Julien Hervot de Mattos Vaz (19202276)