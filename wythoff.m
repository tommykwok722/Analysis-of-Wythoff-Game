fprintf('We want to find out the P-positions and N-positions ')
fprintf('of a Wythoff’s game with given number of chips.\n')

while true
    P1 = input('Input number of chips of the 1st pile: ');
    P2 = input('Input number of chips of the 2nd pile: ');
    if P1 == 0 & P2 == 0
        fprintf('The piles must be non-empty.\n')
        continue;
    end
    break;
end

M = repmat(' ', [P1+1 P2+1]);

for i = 0:P1
    for j = 0:P2
        % Terminal position is a P-position
        if i == 0 && j == 0
            M(i+1, j+1) = 'P';
            continue;
        end
        
        % Check vertical
        for k = i-1:-1:0
            if M(k+1, j+1) == 'P'
                M(i+1, j+1) = 'N';
                break;
            end
        end
        
        % Check horizontal
        for k = j-1:-1:0
            if M(i+1, k+1) == 'P'
                M(i+1, j+1) = 'N';
                break;
            end
        end
        
        % Check diagonal
        for k = 1:min(i, j)
            if M(i-k+1, j-k+1) == 'P'
                M(i+1, j+1) = 'N';
                break;
            end
        end
        
        % If it is not a N-position, then it must be a P-position
        if M(i+1, j+1) == ' '
            M(i+1, j+1) = 'P';
        end
    end 
end

% Display matrix of N-Positions and P-positions
% Comment out line 57-73 if the output matrix is too large
fprintf('    ')
for i = 0:P2
    fprintf('%-4d', i)
end
fprintf('\n')

for i = 1:P1+1
    fprintf('%-4d', i-1)
    for j = 1:P2+1
        if M(i, j) == 'P'
            fprintf(2, '%-4c', M(i, j))
        else
            fprintf('%-4c', M(i, j))
        end
    end
    fprintf('\n')
end

% A visualization of Wythoff's game
n = 1;
X = []; Y = [];

for i = 1:size(M, 1)
    for j = 1:size(M, 2)
        if M(i, j) == 'P'
            X(n) = i - 1;
            Y(n) = j - 1;
            n = n + 1;
        end
    end
end

plot(X, Y, 'rx')
title('A visualization of Wythoff''s Game')
grid on