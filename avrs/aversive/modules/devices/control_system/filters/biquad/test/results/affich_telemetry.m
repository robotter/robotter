function affich_telemetry(tableau)

reunir_graphs = 0;



% labels asserv
labels =  { 't Couple moteur';'g Signal Gyro';'G Intégrale Gyro' ;'v Vitesse'; 'a Acceleration';'C position centre de gravité';'p position moteurs'};


if length(tableau) ~=0

    taille = size(tableau);
    
    figure;
    
    for graph = 1:taille(2)
        if reunir_graphs == 0
            subplot(taille(2), 1, graph);
        end
        
        hold on;
        
        data = tableau(2:end,graph);
        
        plot(data);
        
        %title
        titre =  char(tableau(1,graph));
        for i=1:length(labels)
            if(max(strncmp(labels(i),char(tableau(1,graph)),1)))
                titre = labels(i);
            end
        end
                
        title(strcat(  ...
            titre , ...
            ' - max: ', num2str(max(data)) , ...
            ' min: ', num2str(min(data)) , ...
            ' avg: ', num2str(mean(data)) ));
    end

    % histogramme sur la 4eme donnee
    data = tableau(2:end,1);
    
    %figure;
    %hist(data,length(data));
    
    
end

clear graph taille data i


