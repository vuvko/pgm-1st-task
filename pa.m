% Функция возвращает равномерное распределение на случайную величину a
% 
% Входящие параметры:
%   params - структура с полями amin, amax
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   a - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, a, m, v] = pa(params)
  length = params.amax - params.amin + 1;
  p = zeros(length, 1) + 1/length;
  a = [params.amin:params.amax]';
  if nargout > 2
    m = sum(p .* a);
    v = sum(p .* (a - m) .* (a - m));
  end
end