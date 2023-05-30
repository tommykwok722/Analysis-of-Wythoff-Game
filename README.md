# Analysis-of-Wythoff-Game

## Background
Wythoff’s Game[^1] is a two-player subtraction game[^2]. The following are the rules and setup of the game:
- There are 2 piles of chips
- Player A and B take turns to remove chips according to the following rules:
  - Remove **any positive number** of chips from one of the piles or
  - Remove the **same positive number** of chips from **both** piles
- The player removing the last chip wins

## Objective
We want to determine the **winning** and **losing** positions of Wythoff’s Game.

## Definitions
In combinatorial games[^3], we introduce the definition of **P-positions** and **N-positions**. We say that a position is called a
1. **P-position** if the player who makes the **previous** move has a winning strategy
2. **N-position** if the player who makes the **next** move has a winning strategy

The classification of **P-positions** and **N-positions** can be carried out based on the following rules:

[^1]: Wikipedia contributors. (2023). Wythoff’s game. Wikipedia. https://en.wikipedia.org/wiki/Wythoff%27s_game
[^2]: Wikipedia contributors. (2023). Subtraction game. Wikipedia. https://en.wikipedia.org/wiki/Subtraction_game
[^3]: Combinatorial Games - Definition | Brilliant Math & Science Wiki. (n.d.). https://brilliant.org/wiki/combinatorial-games-definition/
