% Todos os jogos do domínio possuem um ano de lancamento
lancou(disneyMagicalQuest3, 1992).
lancou(megaManX4, 1997).
lancou(megaManX5, 2000).
lancou(castlevaniaX, 1995).
lancou(metalSlug1, 1996).
lancou(metalSlug2, 1998).
lancou(broforce, 2015).
lancou(crash1, 1996).
lancou(crash2, 1997).
lancou(crash3, 1998).
lancou(godOfWar2, 2007).
lancou(godOfWar3, 2010).
lancou(devilMayCry1, 2001).
lancou(devilMayCry3, 2003).
lancou(tekken3, 1997).
lancou(tekken5, 2005).
lancou(mortalKombat, 2011).
lancou(maxPayne, 2001).
lancou(gtaSanAndreas, 2004).
lancou(left4Dead2, 2009).
lancou(portal2, 2011).
lancou(mirrorsEdge, 2008).
lancou(tombRaider, 2013).
lancou(crysis, 2007).
lancou(legoStarWars, 2005).
lancou(limbo, 2010).
lancou(bindingOfIsaac, 2011).
lancou(overcooked2, 2016).
lancou(amongUs, 2018).


% Produção
desenvolveu(travellersTales, legoStarWars).

publicou(sony, crash1).
publicou(sony, crash2).
publicou(sony, crash3).
publicou(sony, godOfWar2).
publicou(sony, godOfWar3).

% Jogabilidade
plataforma2D(disneyMagicalQuest3).
plataforma2D(megaManX4).
plataforma2D(megaManX5).
plataforma2D(castlevaniaX).
plataforma2D(metalSlug1).
plataforma2D(metalSlug2).
plataforma2D(broforce).

plataforma(X) :- plataforma2D(X).
jogabilidade2D(X) :- plataforma2D(X).
jogabilidade2D(X) :- not(jogabilidade3D(X)).
jogabilidade3D(X) :- not(jogabilidade2D(X)).

jogabilidade3D(crash1).
jogabilidade3D(crash2).
jogabilidade3D(crash3).
jogabilidade3D(godOfWar2).
jogabilidade3D(godOfWar3).
jogabilidade3D(devilMayCry1).
jogabilidade3D(devilMayCry3).
jogabilidade3D(tekken3).
jogabilidade3D(tekken5).
jogabilidade3D(mortalKombat).
jogabilidade3D(maxPayne).
jogabilidade3D(gtaSanAndreas).
jogabilidade3D(left4Dead2).
jogabilidade3D(portal2).
jogabilidade3D(mirrorsEdge).
jogabilidade3D(tombRaider).
jogabilidade3D(crysis).

% HACK'N'SLASH
genero(hackNSlash, godOfWar2).
genero(hackNSlash, godOfWar3).
genero(hackNSlash, devilMayCry1).
genero(hackNSlash, devilMayCry3).

% JOGOS DE LUTA
genero(luta, tekken3).
genero(luta, tekken5).
genero(luta, mortalKombat).

% QUICK TIME EVENT
franquiaGodOfWar(godOfWar2).
franquiaGodOfWar(godOfWar3).
quickTimeEvent(Jogo) :- franquiaGodOfWar(Jogo).

% MAPA ALEATORIO
mapaGeradoAleatoriamente(bindingOfIsaac).

% MAIS DE 4 JOGADORES
qtdJogadoresMax4(Jogo, _) :- jogo(Jogo), Jogo \= amongUs, Jogo \= left4Dead2.
jogo(X) :- lancou(X, _).
jogo(Jogo) :- podeJogar(_, Jogo).  % Relativo a jogadores

franquiaMetalSlug(metalSlug1).
franquiaMetalSlug(metalSlug2).

% MODO COOPERATIVO
cooperativo(Jogo) :- franquiaMetalSlug(Jogo).
cooperativo(Jogo) :- desenvolveu(travellersTales, Jogo).

% CONECTADO A INTERNET
internet(left4Dead2).
not(internet(Jogo)) :- lancou(Jogo, Ano), Ano < AnoL4D2, lancou(left4Dead2, AnoL4D2). 

% HACK'N'SLASH = SEQUENCIA DE GOLPES
sequenciaDeGolpes(Jogo) :- genero(hackNSlash, Jogo).
sequenciaDeGolpes(Jogo) :- genero(luta, Jogo).

% JOGOS DE LUTA = ARCADE
modoArcade(Jogo) :- genero(luta, Jogo).

% JOGOS DE LUTA = VERSUS
modoVersus(Jogo) :- genero(luta, Jogo).

% JOGOS DA SONY = SEM CONTROLE DE CAMERA
semControleCamera(Jogo) :- publicou(sony, Jogo).

% TODO PLATAFORMA 2D POSSUI FASES
fases(Jogo) :- plataforma2D(Jogo).

% Jogadores
jogador(jose).
jogador(sabrina).
jogador(marcos).
jogador(renata).
jogador(robson).

% Pessoas que consomem determinados jogos com profundidade maximizada
hardcore(renata).
hardcore(robson).

possui(jose, pcVelho).
possui(sabrina, pcVelho).
possui(renata, pcMediano).
possui(marcos, pcNovo).
possui(robson, pcNovo).

usa(jose, tecladoMouse).
usa(sabrina, gamepad).
usa(marcos, tecladoMouse).
usa(marcos, fightingStick).
usa(renata, fightingStick).
usa(robson, tecladoMouse).
usa(robson, gamepad).

podeJogar(Jogador, Jogo) :- possui(Jogador, pcVelho), lancou(Jogo, Ano), Ano < 2001.
podeJogar(Jogador, Jogo) :- possui(Jogador, pcMediano), lancou(Jogo, Ano), Ano < 2007.
podeJogar(Jogador, Jogo) :- possui(Jogador, pcNovo), lancou(Jogo, _).

jogoNovo(Jogo) :- lancou(Jogo, Ano), Ano >= 2001.
jogoVelho(Jogo) :- lancou(Jogo, Ano), Ano < 2001.

gosta(marcos, Jogo) :- jogador(marcos), jogoNovo(Jogo).
gosta(jose, Jogo) :-  jogador(jose), jogoVelho(Jogo).

gosta(Jogador, Jogo) :- usa(Jogador, fightingStick), genero(luta, Jogo).
gosta(Jogador, Jogo) :- usa(Jogador, gamepad), publicou(sony, Jogo).
gosta(Jogador, Jogo) :- usa(Jogador, gamepad), plataforma2D(Jogo).
gosta(Jogador, Jogo) :- hardcore(Jogador), genero(hackNSlash, Jogo).

recomenda(Jogador, Jogo) :- podeJogar(Jogador, Jogo), gosta(Jogador, Jogo).