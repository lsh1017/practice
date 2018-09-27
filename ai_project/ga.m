%% genetic algorithm example

clc;
clear all;
close all;

% variables

string_size = 20;
mutation_ratio = 0.01;
gene_number = 100;
genertion_number = 1000;

for i = 1:gene_number
    %gene(i,:) = randi([0 1], string_size, 1);
    
    for j = 1:string_size
        if j <= string_size/2
            gene(i,j) = 1;
        else
            gene(i,j) = 0;
        end
    end
end

for iter = 1:genertion_number
    
    for num = 1:gene_number
        
        % selection - roulette wheel
        
        k = 3;
        Cw = 0;
        Cb = string_size;
        Ci = 0;
        
        % find cost
        for n = 1:gene_number
            Ci = string_size - ga_fitness(gene(n,:),string_size);
            
            if Ci > Cw
                Cw = Ci;
            end
            
            if Ci < Cb
                Cb = Ci;
            end
        end
        
        for n = 1:gene_number
            Ci = string_size - ga_fitness(gene(n,:),string_size);
            f(n,1) = (Cw - Ci) + (Cw - Cb)/(k-1);
        end
        
        sizeGene = length(f);
        sum_of_fitness = 0;
        for i = 1:sizeGene
            sum_of_fitness = sum_of_fitness + f(i);
        end
        
        % find father
        point = randi([0 sum_of_fitness],1,1);
        sum = 0;
        for i = 1:sizeGene
            sum = sum + f(i);
            if point < sum
                break;
            end
        end
        parent1 = gene(i,:);
        
        % find mother
        point = randi([0 sum_of_fitness],1,1);
        sum = 0;
        for i = 1:sizeGene
            sum = sum + f(i);
            if point < sum
                break;
            end
        end
        parent2 = gene(i,:);
        
        % Cross-over - 2-points cross-over
        point1 = randi([1 string_size-1],1,1);
        point2 = randi([point1+1 string_size],1,1);
        
        for i = 1:string_size
            if i < point1
                gene_new(num,i) = parent1(1,i);
            elseif point1 <= i && i <= point2
                gene_new(num,i) = parent2(1,i);
            else
                gene_new(num,i) = parent1(1,i);
            end
        end
        
        % Mutation
        
        for i = 1:string_size
            if rand < mutation_ratio
                gene_new(num,i) = ~gene_new(num,i);
            end
        end
    end % end of generation
    
    % Replacement
    for num = 1:gene_number
        old = ga_fitness(gene(num,:),string_size);
        new = ga_fitness(gene_new(num,:),string_size);
        
        %if old < new
            gene(num,:) = gene_new(num,:);
        %end
    end

    % Calculate Fitness
    fitness_max = 0;
    fitness_sum = 0;
    fitness_avg = 0;
    
    for num = 1:gene_number
        fitness = ga_fitness(gene(num,:),string_size);
        if fitness_max < fitness
            fitness_max = fitness;
        end
        fitness_sum = fitness_sum + fitness;
    end
    
    fitness_avg = fitness_sum / gene_number;
    
    figure(1)
    subplot(211)
    plot(iter, fitness_avg, '*', iter, fitness_max, 'o');
    grid on;
    hold on;
    xlabel('generation');
    ylabel('fitness');
    title('tracking step by step');
    
    track(iter,1) = fitness_avg;
    track(iter,2) = fitness_max;
    
    % Stop condition
    if fitness_avg >= string_size
        break;
    end
end

% plot
t = 1:1:iter;

subplot(212)
plot(t, track(:,1), t, track(:,2));
grid on;
xlabel('generation');
ylabel('fitness');
legend('average fitness', 'max fitness');
title('trajectory of fitness improvement');
