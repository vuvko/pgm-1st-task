% Функция 
% 
% Входящие параметры:
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   c - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, c, m, v] = p3_c(params)
  a_size = params.a_max - params.a_min + 1;
  b_size = params.b_max - params.b_min + 1;
  c_min = 0;
  c_max = params.a_max + params.b_max;
  c_size = c_max - c_min + 1;
  c = [c_min:c_max]';
  p = zeros(c_size, 1);
  pa = 1/a_size;
  pb = 1/b_size;
  a = params.a_min:params.a_max;
  b = params.b_min:params.b_max;
  Ab = binopdf(repmat(a, a_size, 1), ...
      repmat(a', 1, a_size), params.p1);
  Bb = binopdf(repmat(b, b_size, 1), ...
      repmat(b', 1, b_size), params.p2);
  m = 0;
  v = 0;
end