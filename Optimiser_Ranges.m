function [x,y] = Optimiser_Ranges(func)
    
    if func == "Beale"
        x(1) = -4.5; x(2) = 4.5;
        y(1) = -4.5; y(2) = 4.5;
        
    elseif func == "Ackley" || func == "EggCrate" || func == "Himmelblau"
        x(1) = -5.0; x(2) = 5.0;
        y(1) = -5.0; y(2) = 5.0;
        
    elseif func == "Levi" || func == "HolderTable"
        x(1) = -10; x(2) = 10;
        y(1) = -10; y(2) = 10;
        
    elseif func == "Rosenbrock"
        x(1) = -2; x(2) = 2;
        y(1) = -3; y(2) = 3;
        
    elseif func == "GoldsteinPrice"
        x(1) = -2; x(2) = 2;
        y(1) = -2; y(2) = 2;
                
    elseif func == "McCormick"
        x(1) = -1.5; x(2) = 4.0;
        y(1) = -3.0; y(2) = 4.0;
        
    end

end