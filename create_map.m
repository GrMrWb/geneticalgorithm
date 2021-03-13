    function [theatre] = create_map()
    theatre = zeros(12,12);
    theatre(1,:)= 2;
    theatre(:,1)= 2;
    theatre(:,12)= 2;
    theatre(12,:)= 2;
    theatre([6,7],[6,7])=2;


    for i=1:length(theatre)
        for j=1:length(theatre)
            if theatre(i,j)~=2
                if floor(5*rand)+1 ==5
                    theatre(i,j) = floor(2*rand);
                end
            end

        end
    end
    global rubbish;
    m = unique(theatre);
    n = sum(hist(theatre,m),[2]);
    rubbish = n(2);
    fprintf('Number of Rubbish %i\n',rubbish);
end