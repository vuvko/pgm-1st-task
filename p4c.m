% Функция 
% 
% Входящие параметры:
%   params - структура с полями amin, amax, bmin, bmax, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   c - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, c, m, v] = p4c(params)
  a_size = params.amax - params.amin + 1;
  b_size = params.bmax - params.bmin + 1;
  cmin = 0;
  cmax = params.amax + params.bmax;
  c_size = cmax - cmin + 1;
  c = [cmin:cmax]';
  p = zeros(c_size, 1);
  lambda = repmat([params.amin:params.amax]', 1, b_size) * params.p1 + ...
      repmat([params.bmin:params.bmax], a_size, 1) * params.p2;
  pa = 1/a_size;
  pb = 1/b_size;
  fact = 1;
  t = exp(-lambda);
  for i = 1:3*max(max(lambda))+1
    p(i) = pa * pb * sum(sum(t)) / fact;
    fact = fact * i;
    t = t .* lambda;
  end
  if nargout > 2
    m = sum(p .* c);
    v = sum(p .* (c - m) .* (c - m));
  end
end