function [fitness,steps] = score(population, map,rubbish)
    fitness=zeros(200,3);
    steps=zeros(200,1);
    new_iter=map;
    for i=1:200 % 200 chromosomes
        y=2;
        x=2;
        map=new_iter; 
        for step=1:200 % 200 step for each chromosome
            %arr=[1->North      ,  2->South      ,  3-> East      , 4-> West       ,  5-> Current]
            arr=(map(x,y-1)*1) + (map(x,y+1)*3) + (map(x+1,y)*9) + (map(x-1,y)*27) + (map(x,y)*81) + 1;
            sum=arr;
            if population(i,sum)==1
                if map(x,y-1)==2
                    fitness(i,1)=fitness(i,1)-5;
                    fitness(i,3)=fitness(i,3)+1;
                else
                    y=y-1;
                    steps(i)=steps(i)+1;
                end
            end
            if population(i,sum)==2
                if map(x,y+1)==2
                    fitness(i,1)=fitness(i,1)-5;
                    fitness(i,3)=fitness(i,3)+1;
                elseif map(x,y+1)==0 || map(x,y+1)==1
                    y=y+1;
                    steps(i)=steps(i)+1;
                end                
            end
            if population(i,sum)==3
                if map(x+1,y)==2
                    fitness(i,1)=fitness(i,1)-5;
                    fitness(i,3)=fitness(i,3)+1;
                else
                    x=x+1;
                    steps(i)=steps(i)+1;
                end
            end
            if population(i,sum)==4
                if map(x-1,y)==2
                    fitness(i,1)=fitness(i,1)-5;
                    fitness(i,3)=fitness(i,3)+1;
                else
                    x=x-1;
                    steps(i)=steps(i)+1;
                end
            end
            if population(i,sum)==5
                if map(x,y)==1
                    fitness(i,1)=fitness(i,1)+10;
                    map(x,y)=0;
                    rubbish=rubbish-1;
                    fitness(i,2)=fitness(i,2)+1;
                elseif map(x,y)==0
                    fitness(i)=fitness(i)-1;
                end
            end
        end
    end
end