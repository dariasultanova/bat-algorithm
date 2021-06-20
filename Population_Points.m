function points = Population_Points(Population, optimiser, points)
    if isempty(points)
        figure(1)
        cla
        hold on
        Optimisation_Function([],[],optimiser,"Contour");
        
    else
        reset(points);
    end
    
    points = scatter(Population(:,1), Population(:,2), 'ko', 'MarkerFaceColor', 'k');
    pause(0.1)
    drawnow()
end