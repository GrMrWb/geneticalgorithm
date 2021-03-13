function [population,ages] = survivor_selection(old_population,ages,fitness_value)
    for i=1:200
        if ages(i)>60  
            if floor(3*rand+1)==2 && fitness_value(i,3)<0
                for j=1:162
                    old_population(i,j)=floor(5*rand)+1;
                end
                ages(i)=0;
            elseif floor(4*rand+1)==2 && fitness_value(i,1)<=10
                for j=1:162
                    old_population(i,j)=floor(5*rand)+1;
                end
                ages(i)=0;
            elseif floor(10*rand+1)==6
                for j=1:162
                    old_population(i,j)=floor(5*rand)+1;
                end
                ages(i)=0;
                
            end
        end
        population=old_population;
    end
end