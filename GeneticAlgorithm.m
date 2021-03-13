%% Generating the Genes

population=zeros(200,162);

for i=1:200
    for j=1:162
        population(i,j)=floor(5*rand)+1;
    end
end

%% Fitness for 100 maps

fitness_per_map=zeros(1000,100,3);
fitness_max_per_map=zeros(100,1);
rubbish_arr = zeros(100,1);

global rubbish;

figure
hold on
xlabel('Map')
ylabel('Fitness')
prev_max=0;
for u=1:100
    theatre=create_map();
    load('population.mat', 'population')
    generation=1;
    age_pop=zeros(200,1);
    while(generation<1001)   
        %hold on
        % ===== Fitness =====
        [fitness,steps]=score(population,theatre,rubbish);
        % ===== Ranking =====
        [population,fitness,age_pop] = ranking(population,fitness,age_pop);
        % ===== Mutation and Crossover =====
        [new_population, ages] = new_gen(population,fitness);
        % ===== Ages ======
        age_pop=age_pop+ages;
        % ===== Survivor Selection =====
        [new_population,ages] = survivor_selection(new_population,age_pop,fitness);
        age_pop=ages;
        % ===== New Poppulation & Generation =====
        population = new_population;
%         %s = mesh(generation,fitness(:,1),'FaceAlpha','0.5')
%         plot(generation, max(fitness(:,1)),'-o')
%         plot(generation, mean(fitness(:,1)),'-d')
%         plot(generation, min(fitness(:,1)),'-x')
        fitness_per_map(u,generation,1)=max(fitness(:,1));
        fitness_per_map(u,generation,2)=mean(fitness(:,1));
        fitness_per_map(u,generation,3)=min(fitness(:,1));
        generation=generation+1;
    end
    fitness_max_per_map(u)=max(fitness_per_map(u,:,1));
    if prev_max <= max(fitness_per_map(u,:,1))
        prev_max=max(fitness_per_map(u,:,1));
    end
    rubbish_arr(u)=rubbish;
    fprintf('Map %d has finished\n',u)
end

yline(prev_max);
stem(1:100,fitness_max_per_map)
stem(1:100,rubbish_arr)
plot(1:100,10*rubbish_arr,'-d')


