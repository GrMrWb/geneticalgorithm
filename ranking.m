function [population,fitness,ages] = ranking(population,fitness,ages)
    [fitness, indices] = sortrows(fitness,1,'descend');
    population = population(indices,:);
    ages=ages(indices,:);
end