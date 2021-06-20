clear
clc

%% Bat Algorithm Settings
Population_Size = 50;
Num_Movements   = 50;
Dimension       = 2;
Freq_Min        = 0;
Freq_Max        = 1;
Loudness        = 0.5;
PulseRate       = 0.5;
Gamma           = 0.5;
Accuracy        = 5;
End_Condition   = true;

%% Select the optimiser function we wish to optimise
optimiser = "EggCrate";
[x_range, y_range] = Optimiser_Ranges(optimiser);

%% Initialise Bat Population
for i = 1:Population_Size
    Population(i,1) = (x_range(2)-x_range(1)).*rand(1,1)+x_range(1);
    Population(i,2) = (y_range(2)-y_range(1)).*rand(1,1)+y_range(1);
    Fitness(i,1) = Optimisation_Function(Population(i,1),Population(i,2),optimiser,"Optimiser");
end

[Best, ind] = min(Fitness);

%% Initializing the Bat Dynamics
Bat_Loudness = ones(Population_Size,1);
Bat_PulseRate = zeros(Population_Size,1);
Bat_Frequency = zeros(Population_Size,Dimension);
Bat_Velocity = Bat_Frequency;

%% Plot the bat locations
points = Population_Points(Population, optimiser, []);

%% Run the simulation
tic

for movements = 1:Num_Movements
    for bat = 1:Population_Size
        % Update the dynamics
        Bat_Frequency(bat,:) = Freq_Min + (Freq_Max-Freq_Min)*rand(1,Dimension);
        Bat_Velocity(bat,:) = (Population(ind,:) - Population(bat,:)).*Bat_Frequency(bat,:);
        Position = Population(bat,:) + Bat_Velocity(bat,:);
       
        % Perform a random walk
        if rand < Bat_PulseRate(bat,1)
           Position = Position + mean(Bat_Loudness)*rand(1,Dimension);
        end
       
        % Scale the Population
        Position = Population_Scaling(Position, x_range, y_range);
       
        % Update the fitness
        [Fitness_Value, Target] = Optimisation_Function(Position(1), Position(2), optimiser, "Optimiser");
        if Fitness_Value < Fitness(bat,1)
            Fitness(bat,1) = Fitness_Value;
            Population(bat,:) = Position;
            Bat_Loudness(bat,1) = Loudness*Bat_Loudness(bat,1);
            Bat_PulseRate(bat,1) = PulseRate*(1-exp(-Gamma*movements));
           
            if Fitness_Value < Best
                ind = bat;
                Best = Fitness_Value;
            end
        end
    end
   
%    if round(Best,Accuracy) == round(Target,Accuracy) && End_Condition
%        break
%    end
   
   points = Population_Points(Population, optimiser, points);
   
end

t = toc;
fprintf("Simulation ended after %.4f seconds (Movements: %0.0f)\n",t,movements);
fprintf("Best Solution is: x = %.5f, y = %.5f with a Fitness of %.6f \n", Population(ind,1), Population(ind,2), Best);









