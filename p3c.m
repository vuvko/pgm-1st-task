% Функция возвращает маргинальное распределение на переменную c для модели №3.
% 
% Входные параметры:
%   params - структура с полями amin, amax, bmin, bmax, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   c - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, c, m, v] = p3c(params)
  a_size = params.amax - params.amin + 1;
  b_size = params.bmax - params.bmin + 1;
  cmin = 0;
  cmax = params.amax + params.bmax;
  c_size = cmax - cmin + 1;
  c = [cmin:cmax]';
  p = zeros(c_size, 1);
  pa = 1/a_size;
  pb = 1/b_size;
  a = params.amin:params.amax;
  b = params.bmin:params.bmax;
  Ab = binopdf(repmat(c, 1, a_size), repmat(a, c_size, 1), params.p1);
  Bb = binopdf(repmat(c, 1, b_size), repmat(b, c_size, 1), params.p2);
  
  for i = 1:a_size
    for j = 1:b_size
      cv = conv(Ab(:, i), Bb(:, j));
      p = p + cv(1:c_size);
    end
  end
  
  p = p * pa * pb;
  if nargout > 2
    m = sum(p .* c);
    v = sum(p .* (c - m) .* (c - m));
  end
end