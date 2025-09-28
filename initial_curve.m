% Define the q range
q = linspace(0.01, 5, 300); % Example q from 0 to 100

% Define the total cost curve (example: quadratic cost function)
total_cost = q.^2 +sqrt(q); 

% Calculate average cost
avg_cost = total_cost ./ q; 

% Calculate marginal cost (derivative of total cost)
m_cost = gradient(total_cost, q);

% Find the lowest point of the marginal cost curve
[min_mc, idx] = min(m_cost);
q_star = q(idx);
y_star = min_mc;
% Find the lowest point of the average cost curve
[min_ac, idx] = min(avg_cost);
q_bar = q(idx);
y_bar = min_ac;

% Plotting the curves
figure;
hold on;
plot(q, total_cost, 'b', 'DisplayName', 'Total Cost');
plot(q, avg_cost, 'r', 'DisplayName', 'avg Cost');
plot(q, m_cost, 'g', 'DisplayName', 'm Cost');

% Add vertical dashed lines that stop at the curves
plot([q_bar, q_bar], [0, y_bar], '--k', 'LineWidth', 2, 'HandleVisibility', 'off');
plot([q_star, q_star], [0, y_star], '--k', 'LineWidth', 2, 'HandleVisibility', 'off');

% Customize the plot
title('Fig. 2', 'FontSize', 14);
xlabel('q', 'FontSize', 12);
xlim([0, 2]);
ylim([0, 5]);  % Adjust based on your data range

% Add custom text labels at the bottom of the plot
text(q_bar, -0.2, '$\bar{q}$', 'Interpreter', 'latex', 'FontSize', 12, ...
     'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');
text(q_star, -0.2, '$q^*$', 'Interpreter', 'latex', 'FontSize', 12, ...
     'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

% Add legend
legend('Location', 'best');

hold off;

% Adding labels and legend
xlabel('Quantity');
ylabel('Cost');
title('Cost Curves');
legend show;
grid on;
