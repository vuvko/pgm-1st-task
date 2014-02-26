% Функция возвращает распределение p(b | a, d_1, ..., d_n) для модели №4
% 
% Входные параметры:
%   a - значение параметра a
%   d - значения параметра d (вектор)
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2, p3
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   b - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, b, m, v] = p4b_ad(a, d, params)
  d = d(:);
  b_size = params.b_max - params.b_min + 1;
  b = [params.b_min:params.b_max]';
  c_min = 0;
  c_max = params.a_max + params.b_max;
  c_size = c_max - c_min + 1;
  n = length(d);
  c = c_min:c_max;
  DCb = binopdf(repmat(d, 1, c_size) - repmat(c, n, 1), ...
      repmat(c, n, 1), params.p3);
  CBp = repmat(c', 1, b_size);
  p = zeros(b_size, 1);
  lambda = a * params.p1 + b' * params.p2;
  pc = poisspdf(CBp, repmat(lambda, c_size, 1));
  p = prod(DCb * pc, 1)';
  p = p / sum(p);
  if nargout > 2
    m = sum(p .* b);
    v = sum(p .* (b - m) .* (b - m));
  end
end