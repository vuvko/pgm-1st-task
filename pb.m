% Функция возвращает равномерное распределение на случайную величину b
% 
% Входящие параметры:
%   params - структура с полями bmin, bmax
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   b - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, b, m, v] = pb(params)
  length = params.bmax - params.bmin + 1;
  p = zeros(length, 1) + 1/length;
  b = [params.bmin:params.bmax]';
  if nargout > 2
    m = sum(p .* b);
    v = sum(p .* (b - m) .* (b - m));
  end
end