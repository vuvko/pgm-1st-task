% Скрипт для вывода моментов маргинальных распределений

init3;
[~, ~, ma, va] = p_a(params);
[~, ~, mb, vb] = p_b(params);
[~, ~, m3c, v3c] = p3_c(params);
[~, ~, m3d, v3d] = p3_d(params);
[~, ~, m4c, v4c] = p3_c(params);
[~, ~, m4d, v4d] = p3_d(params);

filename = 'for report/moments.tex';
f = fopen(filename, 'w');

fprintf(f, '\\begin{table}[hbtp]\n');
fprintf(f, '  \\centering');
fprintf(f, '  \\begin{tabular}{r|c|c}\n');
fprintf(f, '    Распределение & Модель 3 & Модель 4\\\\ \\hline\n');
fprintf(f, '    $p(a)$ & %.3f & %.3f \\\\ \\hline\n', ma, ma);
fprintf(f, '    $p(b)$ & %.3f & %.3f \\\\ \\hline\n', mb, mb);
fprintf(f, '    $p(c)$ & %.3f & %.3f \\\\ \\hline\n', m3c, m4c);
fprintf(f, '    $p(d)$ & %.3f & %.3f \\\\ \\hline\n', m3d, m4d);
fprintf(f, '  \\end{tabular}\n');
fprintf(f, '  \\caption{Математическое ожидание распределений.}\n');
fprintf(f, '\\end{table}\n');

fprintf(f, '\\begin{table}[hbtp]\n');
fprintf(f, '  \\centering');
fprintf(f, '  \\begin{tabular}{r|c|c}\n');
fprintf(f, '    Распределение & Модель 3 & Модель 4\\\\ \\hline\n');
fprintf(f, '    $p(a)$ & %.3f & %.3f \\\\ \\hline\n', va, va);
fprintf(f, '    $p(b)$ & %.3f & %.3f \\\\ \\hline\n', vb, vb);
fprintf(f, '    $p(c)$ & %.3f & %.3f \\\\ \\hline\n', v3c, v4c);
fprintf(f, '    $p(d)$ & %.3f & %.3f \\\\ \\hline\n', v3d, v4d);
fprintf(f, '  \\end{tabular}\n');
fprintf(f, '  \\caption{Дисперсия распределений.}\n');
fprintf(f, '\\end{table}\n');
