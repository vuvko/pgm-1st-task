% Скрипт для построения графиков p(b | a, d_1, ..., d_N) 

init3;
[~, ~, ma, ~] = p_a(params);
[p, b, mb, ~] = p_b(params);
[~, ~, md, ~] = p4_d(params);
d = m4_generate(params.N, ma, mb, params);

plot(b, p);
hold on;

for N = 3:7:50
  plot(b, p4b_ad(a, d(1:N), params));
  hold on;
end

plot(b, p4b_ad(ma, d, params));
xlabel('Параметр b');
ylabel('p(b | a, d_1, ..., d_N)');
hold off;