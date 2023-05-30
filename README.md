# Analysis-of-Wythoff-Game
A MATLAB program related to Wythoff’s Game.

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
1. Terminal position $(0,0)$ is a **P-position**
2. A position which has a move to a **P-position** is a **N-position**
3. A position which can **ONLY** move to a **N-position** is a **P-position**

## Idea to determine P-positions and N-positions
We want to determine all P-positions and N-positions so as to find out the optimal strategy of the game.

Suppose there are 4 and 5 chips in the 1<sup>st</sup> and the 2<sup>nd</sup> pile. Denote $(a,b)$ the position, $a$ and $b$ are the number of 
chips in the 1<sup>st</sup> and the 2<sup>nd</sup> pile.

**Step 1:** Terminal position $(0,0)$ is a **P-position** by ***Rule 1***
|       | **0** | **1** | **2** | **3** | **4** | **5** |
|-------|-------|-------|-------|-------|-------|-------|
| **0** |***P***|       |       |       |       |       |
| **1** |       |       |       |       |       |       |
| **2** |       |       |       |       |       |       |
| **3** |       |       |       |       |       |       |
| **4** |       |       |       |       |       |       |

**Step 2:** $(0,x)$, $(x,0)$ and $(x,x)$ are **N-positions** by ***Rule 2***. These positions can move to $(0,0)$, which is a **P-position**
|       | **0** | **1** | **2** | **3** | **4** | **5** |
|-------|-------|-------|-------|-------|-------|-------|
| **0** |***P***|  *N*  |  *N*  |  *N*  |  *N*  |  *N*  |
| **1** |  *N*  |  *N*  |       |       |       |       |
| **2** |  *N*  |       |  *N*  |       |       |       |
| **3** |  *N*  |       |       |  *N*  |       |       |
| **4** |  *N*  |       |       |       |  *N*  |       |

**Step 3:** $(1,2)$ and $(2,1)$ are **P-positions** by ***Rule 3***. These positions can **ONLY** move to a **N-position**
|       | **0** | **1** | **2** | **3** | **4** | **5** |
|-------|-------|-------|-------|-------|-------|-------|
| **0** |***P***|  *N*  |  *N*  |  *N*  |  *N*  |  *N*  |
| **1** |  *N*  |  *N*  |***P***|       |       |       |
| **2** |  *N*  |***P***|  *N*  |       |       |       |
| **3** |  *N*  |       |       |  *N*  |       |       |
| **4** |  *N*  |       |       |       |  *N*  |       |

$(1,2)$ &rarr; Possible moves: $(0,2)$, $(1,1)$, $(1,0)$ or $(0,1)$ <br>
$(2,1)$ &rarr; Possible moves: $(2,0)$, $(1,1)$, $(0,1)$ or $(1,0)$ <br>

**Repeat similar steps to find out all P-positions and N-positions**
|       | **0** | **1** | **2** | **3** | **4** | **5** |
|-------|-------|-------|-------|-------|-------|-------|
| **0** |***P***|  *N*  |  *N*  |  *N*  |  *N*  |  *N*  |
| **1** |  *N*  |  *N*  |***P***|  *N*  |  *N*  |  *N*  |
| **2** |  *N*  |***P***|  *N*  |  *N*  |  *N*  |  *N*  |
| **3** |  *N*  |  *N*  |  *N*  |  *N*  |  *N*  |***P***|
| **4** |  *N*  |  *N*  |  *N*  |  *N*  |  *N*  |  *N*  |

## Conclusion
If there are 4 and 5 chips in the 1<sup>st</sup> and the 2<sup>nd</sup> pile,
then the **P-positions** are $(0,0)$, $(1,2)$, $(2,1)$ and $(3,5)$,
which means that our target is to remove certain amount of chips in order to reach a **P-position**,
then our opponent can only move from **P-position** to a **N-position**, hence assuring us to have a winning move.

[^1]: Wikipedia contributors. (2023). Wythoff’s game. Wikipedia. https://en.wikipedia.org/wiki/Wythoff%27s_game
[^2]: Wikipedia contributors. (2023). Subtraction game. Wikipedia. https://en.wikipedia.org/wiki/Subtraction_game
[^3]: Combinatorial Games - Definition | Brilliant Math & Science Wiki. (n.d.). https://brilliant.org/wiki/combinatorial-games-definition/
