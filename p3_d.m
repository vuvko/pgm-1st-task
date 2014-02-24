% Функция возвращает маргинальное распределение на переменную d для модели №3.
% 
% Входные параметры:
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   d - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, d, m, v] = p3_d(params)
  d_min = 0;
  d_max = 2 * (params.a_max + params.b_max);
  d_size = d_max - d_min + 1;
  [c, c_v] = p3_c(params);
  c_size = length(c);
  d = [d_min:d_max]';
  D_r = repmat(d, 1, c_size);
  C_v_r = repmat(c_v', d_size, 1);
  C_r = repmat(c', d_size, 1);
  p = sum(binopdf(D_r - C_v_r, C_v_r, params.p3) .* C_r, 2);
  if nargout > 2
    m = sum(p .* d);
    v = sum(p .* (d - m) .* (d - m));
  end
end