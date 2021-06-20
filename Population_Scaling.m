function Population = Population_Scaling(Population, x, y)

    Population(Population(:,1)<x(1),1) = x(1);
    Population(Population(:,1)>x(2),1) = x(2);
    
    Population(Population(:,1)<y(1),2) = y(1);
    Population(Population(:,2)>y(2),2) = y(2);
    
end