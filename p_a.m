% Функция возвращает равномерное распределение на случайную величину a
% 
% Входящие параметры:
%   params - структура с полями a_min, a_max
% Выходящие значения:
%   a - носитель (вектор)
%   p - распределение случайной величины (вектор)
%   m - математическое ожидание
%   d - дисперсия

function [a, p, m, d] = p_a(params)
  length = params.a_max - params.a_min + 1;
  p = zeros(length, 1) + 1/length;
  a = [params.a_min:params.a_max]';
  m = 1/length;
  d = 0;
end