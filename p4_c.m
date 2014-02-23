% Функция 
% 
% Входящие параметры:
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   c - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, c, m, v] = p4_c(params)
  a_size = params.a_max - params.a_min + 1;
  b_size = params.b_max - params.b_min + 1;
  c_min = 0;
  c_max = params.a_max + params.b_max;
  c_size = c_max - c_min + 1;
  c = [c_min:c_max]';
  p = zeros(c_size, 1);
  lambda = repmat([params.a_min:params.a_max]', 1, b_size) * params.p1 + ...
      repmat([params.b_min:params.b_max], a_size, 1) * params.p2;
  pa = 1/a_size;
  pb = 1/b_size;
  fact = 1;
  t = exp(-lambda);
  for i = 1:3*max(max(lambda))+1
    p(i) = pa * pb * sum(sum(t)) / fact;
    fact = fact * i;
    t = t .* lambda;
  end
  m = 0;
  v = 0;
end