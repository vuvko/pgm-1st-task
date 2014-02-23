% Функция возвращает равномерное распределение на случайную величину b
% 
% Входящие параметры:
%   params - структура с полями b_min, b_max
% Выходящие значения:
%   b - носитель (вектор)
%   p - распределение случайной величины (вектор)
%   m - математическое ожидание
%   d - дисперсия

function [b, p, m, d] = p_b(params)
  length = params.b_max - params.b_min + 1;
  p = zeros(length, 1) + 1/length;
  b = [params.b_min:params.b_max]';
  m = 1/lenght;
  d = 0;
end