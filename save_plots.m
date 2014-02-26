
init3;
[~, ~, ma, ~] = p_a(params);
[~, b, mb, ~] = p_b(params);
[~, ~, md, ~] = p4_d(params);
ma = round(ma);
mb = round(mb);
md = round(md);
d1 = m4_generate(params.N, ma, mb, params);
d2 = zeros(params.N, 1) + md;

h3 = figure;
h4 = figure;
hm = figure;
hv = figure;

set(h3, 'Color', 'w');
set(h4, 'Color', 'w');
set(hm, 'Color', 'w');
set(hv, 'Color', 'w');

plot_pb_d(d1, params, h3, h4, hm, hv);

figure(h3);
export_fig 'for report/p3b_d1' '-eps'
figure(h4);
export_fig 'for report/p4b_d1' '-eps'
figure(hm);
export_fig 'for report/pb_d1m' '-eps'
figure(hv);
export_fig 'for report/pb_d1v' '-eps'

plot_pb_d(d2, params, h3, h4, hm, hv);

figure(h3);
export_fig 'for report/p3b_d2' '-eps'
figure(h4);
export_fig 'for report/p4b_d2' '-eps'
figure(hm);
export_fig 'for report/pb_d2m' '-eps'
figure(hv);
export_fig 'for report/pb_d2v' '-eps'

plot_pb_ad(ma, d1, params, h3, h4, hm, hv);

figure(h3);
export_fig 'for report/p3b_ad1' '-eps'
figure(h4);
export_fig 'for report/p4b_ad1' '-eps'
figure(hm);
export_fig 'for report/pb_ad1m' '-eps'
figure(hv);
export_fig 'for report/pb_ad1v' '-eps'

plot_pb_ad(ma, d2, params, h3, h4, hm, hv);

figure(h3);
export_fig 'for report/p3b_ad2' '-eps'
figure(h4);
export_fig 'for report/p4b_ad2' '-eps'
figure(hm);
export_fig 'for report/pb_ad2m' '-eps'
figure(hv);
export_fig 'for report/pb_ad2v' '-eps'
