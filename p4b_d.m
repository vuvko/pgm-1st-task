% Функция возвращает распределение p(b | d_1, ..., d_n) для модели №4
% 
% Входные параметры:
%   d - значения параметра d (вектор)
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2, p3
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   b - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, b, m, v] = p4b_d(d, params)
  d = d(:);
  a_size = params.a_max - params.a_min + 1;
  a = [params.a_min:params.a_max]';
  b_size = params.b_max - params.b_min + 1;
  b = [params.b_min:params.b_max];
  c_min = 0;
  c_max = params.a_max + params.b_max;
  c_size = c_max - c_min + 1;
  n = length(d);
  c = c_min:c_max;
  DCb = binopdf(repmat(d, 1, c_size) - repmat(c, n, 1), ...
      repmat(c, n, 1), params.p3);
  CBp = repmat(c', 1, b_size);
  p = zeros(b_size, 1);
  lambda = repmat(a, 1, b_size) * params.p1 + ...
      repmat(b, a_size, 1) * params.p2;
  el = exp(-lambda);
  pc = zeros(c_size, b_size);
  mc = round(3 * max(max(lambda)) + 1);
  fc = repmat(factorial(c(1:mc))', 1, b_size);
  for i = 1:a_size
    lc = repmat(lambda(i, :), mc, 1) .^ repmat(c(1:mc)', 1, b_size);
    pc(1:mc, :) = repmat(el(i, :), mc, 1) .* lc ./ fc;
    p = p + prod(DCb * pc)';
  end
  p = p / sum(p);
  if nargout > 2
    m = sum(p .* b);
    v = sum(p .* (b - m) .* (b - m));
  end
end