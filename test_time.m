% Тестирование на скорость выполнения функций, использующихся
% для выполнения задачи (вариант 3).

init3;

% p(a) и p(b) в обеих моделях одинаковы
fprintf(1, 'Common:\n');
tic; [~, ~, ma, ~] = pa(params);
tpa = toc;
tic; [~, ~, mb, ~] = pb(params);
tpb = toc;

fprintf(1, 'p(a) --- %.5f\np(b) --- %.5f\n\n', tpa, tpb);

% Модель 3
fprintf(1, 'Model 3:\n');
tic; p3c(params);
tp3c = toc;
fprintf(1, 'p3(c) --- %.5f\n', tp3c);
tic; p3d(params);
tp3d = toc;
fprintf(1, 'p3(d) --- %.5f\n', tp3d);
fprintf(1, 'Generating:\n');
for N = 3:7:50
  tic; d = m3_generate(N, ma, mb, params);
  td = toc;
  tic; p3b_d(d, params);
  tbd = toc;
  tic; p3b_ad(ma, d, params);
  tbad = toc;
  fprintf(1, 'N = %3d | gen --- %.2f | p(b|d_1,...,d_n) --- %.2f | p(b|a,d_1,...,d_n) --- %.2f\n', N, td, tbd, tbad);
end

% Модель 4
fprintf(1, 'Model 4:\n');
tic; p4c(params);
tp4c = toc;
fprintf(1, 'p4(c) --- %.5f\n', tp4c);
tic; p4d(params);
tp4d = toc;
fprintf(1, 'p4(d) --- %.5f\n', tp4d);
fprintf(1, 'Generating:\n');
for N = 3:7:50
  tic; d = m4_generate(N, ma, mb, params);
  td = toc;
  tic; p4b_d(d, params);
  tbd = toc;
  tic; p4b_ad(ma, d, params);
  tbad = toc;
  fprintf(1, 'N = %3d | gen --- %.2f | p(b|d_1,...,d_n) --- %.2f | p(b|a,d_1,...,d_n) --- %.2f\n', N, td, tbd, tbad);
end
