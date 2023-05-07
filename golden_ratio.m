fprintf('We are interested in finding out all winning positions by golden ratio.\n')
fprintf('Assume that the number of chips of the 2 piles are non-empty.\n')

n = 1;
w1 = []; w2 = [];
GR = 0.5*(1+sqrt(5)); % Golden ratio

while true
    Pos1 = input('Input number of chips of the 1st pile: ');
    Pos2 = input('Input number of chips of the 2nd pile: ');
    if Pos1 == 0 && Pos2 == 0
        fprintf('The piles must be non-empty.\n')
        continue;
    end
    break;
end

% Check the 1st position
A = floor(ceil(Pos1/GR)*GR);
B = floor(ceil(Pos1/(GR+1))*(GR+1));

if A == Pos1
    if A + ceil(Pos1/GR) < Pos2
        w1(n) = A;
        w2(n) = A + ceil(Pos1/GR);
        n = n + 1;
    end   
elseif B == Pos1
    if B - ceil(Pos1/(GR+1)) < Pos2
        w1(n) = B;
        w2(n) = B - ceil(Pos1/(GR+1));
        n = n + 1;
    end
end

% Check the 2nd position
A = floor(ceil(Pos2/GR)*GR);
B = floor(ceil(Pos2/(GR+1))*(GR+1));

if A == Pos2
    if A + ceil(Pos2/GR) < Pos1
        w1(n) = A + ceil(Pos2/GR);
        w2(n) = A;
        n = n + 1;
    end 
elseif B == Pos2
    if B - ceil(Pos2/(GR+1)) < Pos1
        w1(n) = B - ceil(Pos2/(GR+1));
        w2(n) = B;
        n = n + 1;
    end
end

% Check the difference of Pos1 and Pos2
if Pos1 < Pos2
    D = Pos2 - Pos1;
    A = floor(D*GR);
    B = floor(D*(GR+1));
    
    if A < Pos1 && B < Pos2
        w1(n) = A;
        w2(n) = B;
    end
elseif Pos1 > Pos2
    D = Pos1 - Pos2;
    A = floor(D*GR);
    B = floor(D*(GR+1));
    
    if A < Pos2 && B < Pos1
        w1(n) = B;
        w2(n) = A;
    end
end

% Display all winning moves
if Pos1 == Pos2
    fprintf('We can win the game directly by removing all chips from the 1st pile and the 2nd pile.\n')
elseif length(w1) < 1
    fprintf('It is a P-position, there are no winning moves.\n')
elseif length(w1) > 1
    fprintf('The winning moves are:\n')
    for i = 1:length(w1)
        fprintf('(%d,%d) by removing %d chips from the 1st pile and %d chips from the 2nd pile.\n', w1(i), w2(i), Pos1-w1(i), Pos2-w2(i))
    end
elseif length(w1) == 1
    fprintf('The only winning move is:\n')
    fprintf('(%d,%d) by removing %d chips from the 1st pile and %d chips from the 2nd pile.\n', w1(1), w2(1), Pos1-w1(1), Pos2-w2(1))
end