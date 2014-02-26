% функция для построения графиков p(b | d_1, ..., d_N) 

function plot_pb_d(d, params, h3, h4, hm, hv)
  if nargin < 3
    h3 = figure;
  end
  if nargin < 4
    h4 = figure;
  end
  if nargin < 5
    hm = figure;
  end
  if nargin < 6
    hv = figure;
  end
  set(h3,'defaulttextinterpreter','latex');
  set(h4,'defaulttextinterpreter','latex');
  set(hm,'defaulttextinterpreter','latex');
  set(hv,'defaulttextinterpreter','latex');
  N = [0, 1:3:50, 50];
  m3 = zeros(length(N), 1);
  v3 = zeros(length(N), 1);
  m4 = zeros(length(N), 1);
  v4 = zeros(length(N), 1);
  
  for i = 2:length(N)
    figure(h4);
    [p, b, m4(i), v4(i)] = p4b_d(d(1:N(i)), params);
    plot(b, p, 'Color', [N(i)/50, 1-N(i)/50, 0.0], 'LineWidth', 2);
    hold on;
    figure(h3);
    [p, b, m3(i), v3(i)] = p3b_d(d(1:N(i)), params);
    plot(b, p, 'Color', [N(i)/50, 1-N(i)/50, 0.0], 'LineWidth', 2);
    hold on;
  end
  
  figure(h3);
  [p, b, m3(1), v3(1)] = p_b(params);
  plot(b, p, 'Color', [0.0, 0.0, 1.0], 'LineWidth', 2);
  xlabel('b');
  ylabel('$p(b\,|\,d_1, \dots, d_N)$');
  hold off;
  figure(h4);
  [p, b, m4(1), v4(1)] = p_b(params);
  plot(b, p, 'Color', [0.0, 0.0, 1.0], 'LineWidth', 2);
  xlabel('b');
  ylabel('$p(b\,|\,d_1, \dots, d_N)$');
  hold off;
  
  figure(hm);
  plot(N, m3, '-o', 'Color', [1.0, 0.0, 0.0], 'LineWidth', 2);
  hold on;
  plot(N, m4, '-o', 'Color', [0.0, 0.0, 1.0], 'LineWidth', 2);
  legend('3-d model', '4-th model');
  hold off;
  xlabel('N');
  ylabel('$Mean\,b\,|\,d_1, \dots, d_N$');
  figure(hv);
  plot(N, v3, '-o', 'Color', [1.0, 0.0, 0.0], 'LineWidth', 2);
  hold on;
  plot(N, v4, '-o', 'Color', [0.0, 0.0, 1.0], 'LineWidth', 2);
  legend('3-d model', '4-th model');
  hold off;
  xlabel('N');
  ylabel('$Var\,b\,|\,d_1, \dots, d_N$');  
end
