% Скрипт для генерации таблицы времени работы функций (для отчёта)

init3;
filename = 'for report/time.tex';
f = fopen(filename, 'w');

init3;

fprintf(f, '\\begin{table}[hbtp]\n');

fprintf(f, '  \\begin{tabular}{r|c|c}\n');
fprintf(f, '    Распределение & Модель 3 & Модель 4 \\\\ \\hline\n');
tic; p3_c(params);
t = toc;
fprintf(f, '    $p(c)$ & %.5f & ', t);
tic; p4_c(params);
t = toc;
fprintf(f, '%.5f \\\\ \\hline\n', t);
tic; p3_d(params);
t = toc;
fprintf(f, '    $p(d)$ & %.5f & ', t);
tic; p4_d(params);
tp4d = toc;
fprintf(f, '%.5f \\\\ \\hline\n', t);

N = 50;
fprintf(f, '    $p(b|d_1, \\dots, d_N)$ & ');
d4 = m4_generate(N, ma, mb, params);
d3 = m3_generate(N, ma, mb, params);
tic; p4b_d(d4, params);
t = toc;
fprintf(f, '%.5f & ', t);
tic; p3b_d(d3, params);
t = toc;
fprintf(f, '%.5f \\\\ \\hline\n', t);
fprintf(f, '    $p(b|a, d_1, \\dots, d_N)$ & ');
tic; p4b_ad(ma, d4, params);
t = toc;
fprintf(f, '%.5f & ', t);
tic; p3b_ad(ma, d3, params);
t = toc;
fprintf(f, '%.5f \\\\ \\hline\n', t);

fprintf(f, '  \\end{tabular}\n');
fprintf(f, '\\caption{Время работы основных функций.}\n');
fprintf(f, '\\end{table}');
