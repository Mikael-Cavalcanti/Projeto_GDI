# Projeto Lógico

- ### Entidades Fortes (com Atributos Multivalorado e Auto - Relacionamentos 1:1 e 1:N)<br>
>Usuario (<ins>userID</ins>, email, senha)<br>
>Mapa (<ins>mapID</ins>, imagem)<br>
>Jogo (<ins>vgID</ins>, vgDesc)<br>
>Personagem (<ins>charID</ins>, leaderID, nome, atrFOR, atrDES, atrINT, atrCON, atrSAB, atrCAR)<br>
&emsp;&emsp;leaderID -> Personagem (charID)<br>
>
> prof_ARMA (<ins>charID, arma</ins>)<br>
&emsp;&emsp;charID -> Personagem (charID)<br>
>
>prof_ARMAD (<ins>charID, armadura</ins>)<br>
&emsp;&emsp;charID -> Personagem (charID)<br>
>
>prof_IDIOMA (<ins>charID, idioma</ins>)<br>
&emsp;&emsp;charID -> Personagem (charID)<br>
>
>Item (<ins>itemID</ins>, itemDesc, peso)<br>
---
- ### Entidades Fracas

>Inventario (<ins>charID</ins>, pesoTotal*)<br>
&emsp;&emsp;charID -> Personagem (charID)<br>
---
- ### Heranças

>Jogador (<ins>userID</ins>)<br>
&emsp;&emsp;userID -> Usuario (userID)<br>
>
>Mestre (<ins>userID</ins>)<br>
&emsp;&emsp;userID -> Usuario (userID)<br>
>
>PC (<ins>charID</ins>)<br>
&emsp;&emsp;charID -> Personagem (charID)<br>
>
>NPC (<ins>charID</ins>)<br>
&emsp;&emsp;charID -> Personagem (charID)<br>
---
- ### Entidades Associativas<br>
>
>Mestra (<ins>hostID, vgID, sessao</ins>)<br>
&emsp;&emsp;hostID -> Mestre (userID)<br>
&emsp;&emsp;vgID -> Jogo (vgID)<br>
---
- ### Relacionamentos (Binários N:N e N-ários)<br>

>Aparece (<ins>mapID, vgID</ins>)<br>
&emsp;&emsp;mapID -> Mapa (mapID)<br>
&emsp;&emsp;vgID -> Jogo (vgID)<br>
>
>Joga (<ins>vgID, pcID, sessaoJogo</ins>, playerID!)<br>
&emsp;&emsp;vgID -> Jogo (vgID)<br>
&emsp;&emsp;pcID -> PC (charID)<br>
&emsp;&emsp;playerID -> Jogador (userID)<br>
>
>Participa (<ins>hostID, vgID, sessao, npcID</ins>)<br>
&emsp;&emsp;(hostID , vgID , sessao) -> Mestra (hostID , vgID, sessão)<br>
&emsp;&emsp;npcID -> NPC (charID)<br>
>
>Tem/Possui (<ins>invID, itemID</ins>, qtd)<br>
&emsp;&emsp;invID -> Inventario (charID)<br>
&emsp;&emsp;itemID -> Item (itemID)<br>
<br>
---
