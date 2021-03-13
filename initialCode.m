%% Setting Up the scene
theatre = zeros(12,12);
theatre(1,:)= 2;
theatre(:,1)= 2;
theatre(:,12)= 2;
theatre(12,:)= 2;
theatre([6,7],[6,7])=2;


for i=1:length(theatre)
    for j=1:length(theatre)
        if theatre(i,j)~=2
            %if floor(2*rand)+1 ==5
                theatre(i,j) = floor(2*rand);
            %end
        end
        
    end
end


m = unique(theatre);
n = sum(hist(theatre,m),[2]);
rubbish = n(2);
fprintf('Number of Rubbish %i\n',rubbish);
%% Generating the Genes
population=zeros(200,162);

for i=1:200
    for j=1:162
        population(i,j)=floor(5*rand)+1;
    end
end

load('population.mat', 'population')

%% Fitness
figure
title('Max, Min and Mean Fitness per Generation')
xlabel('Generations') 
ylabel('Fitness Value')

global generation;
generation=1;
age_pop=zeros(200,1);
while(generation<1001)   
    hold on
    % ===== Fitness =====
    [fitness,steps]=score(population,theatre,rubbish);
    % ===== Ranking =====
    [population,fitness,ages] = ranking(population,fitness,ages);
    % ===== Mutation and Crossover =====
    [new_population, ages] = new_gen(population,fitness);
    % ===== Ages ======
    age_pop=age_pop+ages;
    % ===== Survivor Selection =====
    [new_population,ages] = survivor_selection(new_population,age_pop,fitness);
    age_pop=ages;
    % ===== New Poppulation & Generation =====
    population = new_population;
    %s = mesh(generation,fitness(:,1),'FaceAlpha','0.5')
    plot(generation, max(fitness(:,1)),'-o')
    plot(generation, mean(fitness(:,1)),'-d')
    plot(generation, min(fitness(:,1)),'-x')
    generation=generation+1
end
yline(max(fitness(:,1)));

max(fitness(:,1))

fprintf('finish\n')
