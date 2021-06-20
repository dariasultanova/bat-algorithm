% Test functions
% 1.  Beale
% 2.  Ackley
% 3.  Levi
% 4.  McCormick
% 5.  Rosenbrock
% 6.  Goldstein-Price
% 7.  EggCrate
% 8.  Himmelblau
% 9.  Holder Table

function [z, min_val] = Optimisation_Function(x, y, func, mode)

    optimiser = str2func(func);
    
    if mode == "Optimiser"
        [z, min_val] = optimiser(x,y);
    else
        [x_range, y_range] = Optimiser_Ranges(func);
        x = linspace(x_range(1), x_range(2), 101);
        y = linspace(y_range(1), y_range(2), 101);
        
        for j = 1:length(x)
            for i = 1:length(y)
                z(j,i) = optimiser(x(j),y(i));
            end
        end
        
        figure(1)
        cla
        xlabel('y')
        ylabel('x')
        if mode == "Surf"
            surf(y,x,z)
            shading interp
        elseif mode == "Contour"
            contour(y,x,z)
        end
        
    end

end


function [z, min_val] = Beale(x,y)
    z = (1.5 - x + x*y)^2 + (2.25 - x + x*y^2)^2 + (2.625 - x + x*y^3)^2;
    min_val = 0;
end

function [z, min_val] = Ackley(x,y)
   z = -20*exp(-0.2*sqrt(0.5*(x^2 + y^2))) - exp(0.5*(cos(2*pi*x) + cos(2*pi*y))) + exp(1) + 20;
   min_val = 0;
end

function [z, min_val] = Levi(x,y)
    z = sin(3*pi*x)^2 + (x-1)^2 * (1 + sin(3*pi*y)^2) + (y-1)^2 * (1 + sin(2*pi*y)^2);
    min_val = 0;
end


function [z, min_val] = McCormick(x,y)
    z = sin(x + y) + (x - y)^2 - 1.5*x + 2.5*y + 1;
    min_val = -1.9133;
end

function [z, min_val] = Rosenbrock(x,y)
    z = ((1-x).^2)+(100*((y-(x.^2)).^2));
    min_val = 0;
end

function [z, min_val] = GoldsteinPrice(x,y)
    z = ( 1 + (x + y + 1)^2 * (19 - 14*x +  3*x^2 - 14*y +  6*x*y + 3*y^2)) * ...
        (30 + (2*x - 3*y)^2 * (18 - 32*x + 12*x^2 + 48*y - 36*x*y + 27*y^2));
    min_val = 3.0;
end

function [z, min_val] = EggCrate(x,y)
    z = x^2 + y^2 + 25*(sin(x)^2 + sin(y)^2);
    min_val = 0;
end

function [z, min_val] = Himmelblau(x,y)
    z = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
    min_val = 0;
end

function [z, min_val] = HolderTable(x,y)
    z = - abs(sin(x) * cos(y) * exp(abs(1 - sqrt(x^2 + y^2)/pi)));
    min_val = -19.2091;
end
