# Projeto Lógico

- ### Entidades Fortes (com Atributos Multivalorado e Auto - Relacionamentos 1:1 e 1:N)<br>
>Usuario (<ins>userID</ins>, email, senha)<br>
>Item (<ins>itemID</ins>, itemDesc, peso)<br>
>Mapa (<ins>mapID</ins>, imagem)<br>
>Jogo (<ins>vgID</ins>, vgDesc)<br>
>Personagem (<ins>charID</ins>, leaderID, nome, atrFOR, atrDES, atrINT, atrCON, atrSAB, atrCAR)<br>
    >>>leaderID -> Personagem (charID)<br>
>
> prof_ARMA (<ins>charID</ins>)<br>
    >>>charID -> Personagem (charID)<br>
>
>prof_ARMAD (<ins>charID</ins>)<br>
    >>>charID -> Personagem (charID)<br>
>
>prof_IDIOMA (<ins>charID</ins>)<br>
    >>>charID -> Personagem (charID)<br>
---
- ### Entidades Fracas

>Inventário (<ins>charID</ins>, pesoTotal*)<br>
>
    >>>charID -> Personagem (charID)<br>
---
- ### Heranças

>Jogador (<ins>userID</ins>)<br>
    >>>userID -> Usuário (userID)<br>
>
>Mestre (<ins>userID</ins>)<br>
    >>>userID -> Usuário (userID)<br>
>
>PC (<ins>charID</ins>)<br>
    >>>charID -> Personagem (charID)<br>
>
>NPC (<ins>charID</ins>)<br>
    >>>charID -> Personagem (charID)<br>
---
- ### Entidades Associativas<br>

>Mestra (<ins>hostID</ins>, <ins>vgID</ins>, <ins>sessão</ins>)<br>
    >>>hostID -> Mestre (userID)<br>
    >>>vgID -> Jogo (vgID)<br>
---
- ### Relacionamentos (Binários N:N e N-ários)<br>

>Aparece (<ins>mapID</ins>, <ins>vgID</ins>)<br>
    >>>mapID -> Mapa (mapID)<br>
    >>>vgID -> Jogo (vgID)<br>
>
>Joga (<ins>vgID</ins>, <ins>pcID</ins>, <ins>sessãoJogo</ins>, playerID!)<br>
    >>>vgID -> Jogo (vgID)<br>
    >>>pcID -> PC (charID)<br>
    >>>playerID -> Jogador (userID)<br>
>
>Participa (<ins>hostID</ins>, <ins>vgID</ins>, <ins>sessão</ins>, <ins>npcID</ins>)<br>
    >>>(hostID , vgID , sessão) -> Mestra (hostID , vgID, sessão)<br>
    >>>npcID -> NPC (charID)<br>
>
>Tem/Possui (<ins>invID</ins>, <ins>itemID</ins>, qtd)<br>
    >>>invID -> Inventário (charID)<br>
    >>>itemID -> Item (itemID)<br>
<br>
---