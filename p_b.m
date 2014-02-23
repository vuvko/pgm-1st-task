% Функция возвращает равномерное распределение на случайную величину b
% 
% Входящие параметры:
%   params - структура с полями b_min, b_max
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   b - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, b, m, v] = p_b(params)
  length = params.b_max - params.b_min + 1;
  p = zeros(length, 1) + 1/length;
  b = [params.b_min:params.b_max]';
  m = 1/length;
  v = 0;
end