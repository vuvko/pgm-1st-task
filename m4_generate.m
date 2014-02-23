function d = m4_generate(N, a, b, params)
  c = poissrnd(a * params.p1 + b * params.p2, N, 1);
  d = c + binornd(c, params.p3);
end