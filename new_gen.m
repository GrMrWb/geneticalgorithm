function [new_pop,ages] =new_gen(old_population,fitness_value)
    global generation;
    % Crossover
    random_crossover=floor(20*rand)+1;
    while random_crossover>0
        %Multi-point Crossover
        [i1,i2] = parent_selection(old_population, fitness_value);
        %if fitness_value(i1)< 0 && fitness_value(i2) < 0
            crossover_point_1=floor(162*rand)+1;
            crossover_point_2=floor(162*rand)+1;
            section1=old_population(i1,crossover_point_1:crossover_point_2);
            section2=old_population(i2,crossover_point_1:crossover_point_2);
            old_population(201-i1,crossover_point_1:crossover_point_2)=section1;
            old_population(201-i2,crossover_point_1:crossover_point_2)=section2;
            random_crossover=random_crossover-1 ;
        %end
    end
    
    random_mutation=floor(50*rand)+1;
    ages=zeros(200,1);
    %Mutation
    iterator=0;
    while random_mutation>0      
        [i1,i2] = parent_selection(old_population, fitness_value);
        chromo=201-i1;
        if fitness_value(chromo,1)<0
            if (floor(2*rand)+1)==2
                gene1=floor(162*rand)+1;
                gene2=floor(162*rand)+1;
                for h=gene1:gene2
                    old_population(chromo,h)=floor(5*rand)+1;
                end
                ages(chromo)=1;
            else
                gene=floor(162*rand)+1;
                old_population(chromo,gene)=floor(5*rand)+1;
                ages(chromo)=1;
            end
            random_mutation=random_mutation-1 ;
        elseif fitness_value(chromo,1)==0 && iterator>5
            gene=floor(162*rand)+1;
            old_population(chromo,gene)=floor(5*rand)+1;
            ages(chromo)=1;
            random_mutation=random_mutation-1 ;
        else
            gene=floor(162*rand)+1;
            old_population(chromo,gene)=floor(5*rand)+1;
            ages(chromo)=1;
            random_mutation=random_mutation-1 ;
        end
        iterator=iterator+1;
    end
    new_pop=old_population;
end