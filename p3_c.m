% Функция 
% 
% Входящие параметры:
%   params - структура с полями a_min, a_max, b_min, b_max, p1, p2
% Выходящие значения:
%   p - распределение случайной величины (вектор)
%   c - носитель (вектор)
%   m - математическое ожидание
%   v - дисперсия

function [p, c, m, v] = p3_c(params)
  a_size = params.a_max - params.a_min + 1;
  b_size = params.b_max - params.b_min + 1;
  c_min = 0;
  c_max = params.a_max + params.b_max;
  c_size = c_max - c_min + 1;
  c = [c_min:c_max]';
  p = zeros(c_size, 1);
  pa = 1/a_size;
  pb = 1/b_size;
  a = params.a_min:params.a_max;
  b = params.b_min:params.b_max;
  Ab = binopdf(repmat(c, 1, a_size), repmat(a, c_size, 1), params.p1);
  Bb = binopdf(repmat(c, 1, b_size), repmat(b, c_size, 1), params.p2);
  [a_idx, ~] = find(Ab);
  a_idx = unique(a_idx);
  [b_idx, ~] = find(Bb);
  b_idx = unique(b_idx);
  
  %for i = 1:a_size
  %  for j = 1:b_size
  %    p = p + Ab(:, i) .* Bb(:, j);
  %  end
  %end
  
  for i = 1:length(a_idx)
    for j = 1:length(b_idx)
      ii = a_idx(i) - c_min + 1;
      jj = b_idx(j) - c_min + 1;
      p(ii + jj - 1) = p(ii + jj - 1) + sum(sum(Ab(ii, :)' * Bb(jj, :)));
    end
  end
  
  p = p * pa * pb;
  m = 0;
  v = 0;
end