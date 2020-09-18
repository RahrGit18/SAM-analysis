clear; close all; clc


functionality = input('0:Max, 1:Min. Enter your functionality: ');  
                    %0 = Max
                    %1 = Min
                    
filename = "data/";

x_array = 1:125;
y_array = 1:125;


for x = x_array(1):length(x_array)
    
    x_extension = "X" + num2str(x,'%03.f'); %X001
       
    for y = y_array(1):y_array(1)+length(y_array)
        
        y_extension = "Y" + num2str(y, '%03.f') + ".csv"; %Y002.csv
             
        filepath = filename + x_extension + y_extension;
        
        %Check if file exist
        if isfile(filepath)
            data = csvread(filepath);
        else
            data = NaN;
        end
        
        switch functionality
            case 0
                [z, time] = max(data);    
            case 1
                [z, time] = min(data);
        end
        
        z_array(x,y) = z;      
        
    end
    
end

figure(1)
surf(z_array)













