% функция для построения графиков p(b | d_1, ..., d_N) 

function plot_p4b_d(d, params, h1, h2, h3)
  if nargin < 3
    h1 = figure;
  end
  if nargin < 4
    h2 = figure;
  end
  if nargin < 5
    h3 = figure;
  end
  set(h1,'defaulttextinterpreter','latex');
  set(h2,'defaulttextinterpreter','latex');
  set(h3,'defaulttextinterpreter','latex');
  figure(h1);
  N = [0, 4:3:50, 50];
  m = zeros(length(N), 1);
  v = zeros(length(N), 1);
  
  for i = 2:length(N)
    [p, b, m(i), v(i)] = p4b_d(d(1:N(i)), params);
    plot(b, p, 'Color', [N(i)/50, 1-N(i)/50, 0.0], 'LineWidth', 2);
    hold on;
  end
  
  [p, b, m(1), v(1)] = p_b(params);
  plot(b, p, 'Color', [0.0, 0.0, 1.0], 'LineWidth', 2);
  xlabel('b');
  ylabel('$p(b\,|\,d_1, \dots, d_N)$');
  hold off;
  
  figure(h2);
  plot(N, m, 'Color', [1.0, 0.0, 0.0], 'LineWidth', 2);
  xlabel('N');
  ylabel('$Mean\,b\,|\,d_1, \dots, d_N$');
  figure(h3);
  plot(N, v, 'Color', [0.0, 0.0, 1.0], 'LineWidth', 2);
  xlabel('N');
  ylabel('$Var\,b\,|\,d_1, \dots, d_N$');  
end
