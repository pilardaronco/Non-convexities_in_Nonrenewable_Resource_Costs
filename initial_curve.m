% Define the quantity range
quantity = 0:100; % Example quantity from 0 to 100

% Define the total cost curve (example: quadratic cost function)
total_cost = 5 + 2 * quantity + 0.05 * quantity.^2; % Example cost function

% Calculate average cost
average_cost = total_cost ./ quantity; 
average_cost(quantity == 0) = NaN; % Avoid division by zero

% Calculate marginal cost (derivative of total cost)
marginal_cost = gradient(total_cost, quantity);

% Plotting the curves
figure;
hold on;
plot(quantity, total_cost, 'b', 'DisplayName', 'Total Cost');
plot(quantity, average_cost, 'r', 'DisplayName', 'Average Cost');
plot(quantity, marginal_cost, 'g', 'DisplayName', 'Marginal Cost');
hold off;

% Adding labels and legend
xlabel('Quantity');
ylabel('Cost');
title('Cost Curves');
legend show;
grid on;
