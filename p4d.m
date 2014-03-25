% Функция возвращает маргинальное распределение на переменную d для модели №4.
% 
% Входные параметры:
%   params - структура с полями amin, amax, bmin, bmax, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   d - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, d, m, v] = p4d(params)
  dmin = 0;
  dmax = 2 * (params.amax + params.bmax);
  d_size = dmax - dmin + 1;
  [c, c_v] = p4c(params);
  c_size = length(c);
  d = [dmin:dmax]';
  D_r = repmat(d, 1, c_size);
  C_v_r = repmat(c_v', d_size, 1);
  C_r = repmat(c', d_size, 1);
  p = sum(binopdf(D_r - C_v_r, C_v_r, params.p3) .* C_r, 2);
  if nargout > 2
    m = sum(p .* d);
    v = sum(p .* (d - m) .* (d - m));
  end
end