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
  if nargout > 2
    m = sum(p .* a);
    v = sum(p .* (a - m) .* (a - m));
  end
end