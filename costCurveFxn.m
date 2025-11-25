
function [q_star,q_MES] = costCurveFxn(total_cost, demand,y_lim, fig)
%Visualizing u-shaped cost curves
%   prints graphs of all cost curves and outputs MES and q^*
arguments (Input)
    total_cost
    demand
    y_lim
    fig
end

arguments (Output)
    q_star
    q_MES
end

q = linspace(0.01, y_lim, 300); % Example q from 0 to 100

total_cost = total_cost

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
q_MES = q(idx);
y_bar = min_ac;

% Plotting the curves
figure;
hold on;
plot(q, total_cost, 'b', 'DisplayName', 'Cost');
plot(q, avg_cost, 'r', 'DisplayName', 'Avg. Cost');
plot(q, m_cost, 'g', 'DisplayName', 'Marg. Cost');
if ~isnan(demand)
    plot(q, demand, 'm', 'DisplayName', 'Demand');
end

% Add vertical dashed lines that stop at the curves
plot([q_MES, q_MES], [0, y_bar], '--k', 'LineWidth', 2, 'HandleVisibility', 'off');
plot([q_star, q_star], [0, y_star], '--k', 'LineWidth', 2, 'HandleVisibility', 'off');

% Customize the plot
title('Fig. 2', 'FontSize', 14);
xlabel('q', 'FontSize', 12);
% customize the range
x_range = linspace(1, 4, 100);
ylim([0, y_lim]);  % Adjust based on your data range

% Add custom text labels at the bottom of the plot
text(q_MES+.05, -0.2, '$\bar{q}_{mes}$', 'Interpreter', 'latex', 'FontSize', 12, ...
     'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');
text(q_star, -0.2, '$q^*$', 'Interpreter', 'latex', 'FontSize', 12, ...
     'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');

% Add legend
legend('Location', 'best');

hold off;

% Adding labels and legend
xlabel('Quantity');
ylabel('Cost');
title(fig);
legend show;
grid on;

end