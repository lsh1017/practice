function [ y ] = ga_fitness( X , size)

check = 0;

for i = 1:size
    if i >= 1 && i <= size/2
        if X(1,i) == 0
            check = check + 1;
        end
    elseif i >= (size/2+1) && i <= size
        if X(1,i) == 1
            check = check + 1;
        end
    end
end

y = check;

end

