function [i1,i2] = parent_selection(population,fitness)
    [index,col]=find(fitness(:,1)>=0);
    if isempty(index)
        i1=floor(200*rand+1);
        i2=floor(200*rand+1);
    else
        i1=floor(length(index)*rand+1);
        i2=floor(length(index)*rand+1);
        if i1==i2 && length(index)==i2
            i2=i2-1;
        end
        i1=index(i1);
        i2=index(i2);
    end
    
end