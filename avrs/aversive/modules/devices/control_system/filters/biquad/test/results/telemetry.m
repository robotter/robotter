function sortie = teletry(filename)

global SER_PORT_ID;


if ~exist('filename')
  filename = 'COM1';
end

if isnumeric(filename)
    filename = strcat('COM', num2str(filename));
end

% detection port ou ficier 
if isnumeric(sscanf(filename, 'COM%i'))        
    % Set serial port mode 
    SER_PORT_ID = serial(filename, 'baudrate',38400);
    fopen(SER_PORT_ID);
    SER_PORT_ID.Terminator = 10; % LF

    SER_PORT_ID.Timeout = 2;
    
    com = 1;
else
    SER_PORT_ID = fopen(filename);
    com = 0;
end

%init
sortie = [];
labels = cell(0);
time = 2;


% waiting for first input
while 1 
    read = fgetl(SER_PORT_ID);
    if ~ strcmp(read, '')
        break;
    end
end

read = fgetl(SER_PORT_ID); % skip first entry, coz could be incomplete

% main loop
while 1
    
    %exit when finished
    if strcmp(read, '') || ~isstr(read)
        fclose(SER_PORT_ID);
        break;
    end
 
    % convertir
    result = sscanf(read,'%c%i');
    
    sortie(time, :) = NaN;
    for no_param=1:length(result)/2
        % classement
        a_classer = 1;
        for i=1:length(labels)
            if strcmp(labels{i}, char(result(no_param*2 -1)))
                sortie(time, i) = result(no_param*2);
                a_classer = 0;
                break;
            end
        end
        % ajout
        if a_classer
            labels{length(labels)+1} = char(result(no_param*2 -1));
            sortie(1, length(labels)) = result(no_param*2 -1); % label 2
            sortie(time, length(labels)) = result(no_param*2);
        end
    end
        
    % lecture suivant
    read = fgetl(SER_PORT_ID);
    time = time +1;
end






