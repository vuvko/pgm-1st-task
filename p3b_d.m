% Функция возвращает распределение p(b | d_1, ..., d_n) для модели №3
% 
% Входные параметры:
%   d - значения параметра d (вектор)
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2, p3
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   b - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, b, m, v] = p3b_d(d, params)
  d = d(:);
  a_size = params.a_max - params.a_min + 1;
  a = [params.a_min:params.a_max];
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
  pc = zeros(c_size, b_size);
  Ab = binopdf(repmat(c', 1, a_size), repmat(a, c_size, 1), params.p1);
  Bb = binopdf(repmat(c', 1, b_size), repmat(b', c_size, 1), params.p2);
  for i = 1:a_size
    for j = 1:b_size
      cv = conv(Ab(:, i), Bb(:, j));
      pc(:, j) = cv(1:c_size);
    end
    p = p + prod(DCb * pc, 1)';
  end
  p = p / sum(p);
  if nargout > 2
    m = sum(p .* b);
    v = sum(p .* (b - m) .* (b - m));
  end
end