% Функция возвращает равномерное распределение на случайную величину a
% 
% Входящие параметры:
%   params - структура с полями a_min, a_max
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   a - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, a, m, v] = p_a(params)
  length = params.a_max - params.a_min + 1;
  p = zeros(length, 1) + 1/length;
  a = [params.a_min:params.a_max]';
  m = 1/length;
  v = 0;
end