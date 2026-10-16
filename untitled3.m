
s = tf('s')
G = 1 / ((s+1)*(0.5*s+1))

t = linspace(0, 6, 1000)

%step(G, t)
c1 = -10
Gc1 = (-s+c1) / (c1*(s+1)*(0.5*s+1))
%step(Gc1, t)
c2 = -0.25
Gc2 = (-s+c2) / (c2*(s+1)*(0.5*s+1))
%step(Gc2, t)
c3 = -0.1
Gc3 = (-s+c3) / (c3*(s+1)*(0.5*s+1))
%step(Gc3, t)
c4 = 0.1
Gc4 = (-s+c4) / (c4*(s+1)*(0.5*s+1))
%step(Gc4, t)
c5 = 0.25
Gc5 = (-s+c5) / (c5*(s+1)*(0.5*s+1))
%step(Gc5, t)
c6 = 10
Gc6 = (-s+c6) / (c6*(s+1)*(0.5*s+1))
%step(Gc6, t)

step(G, Gc1, Gc2, Gc3, Gc4, Gc5, Gc6, t); grid on
legend('G', 'Gc1', 'Gc2', 'Gc3', 'Gc4', 'Gc5', 'Gc6')
grid off
sys = {G, Gc1, Gc2, Gc3, Gc4, Gc5, Gc6};
for k = 1:numel(sys)
    info(k) = stepinfo(sys{k});
end
struct2table(info)





opts = bodeoptions;
opts.Grid = 'on';
opts.PhaseMatching = 'on';
opts.PhaseMatchingFreq = 0.0001;
opts.PhaseMatchingvalue = 0;
bode(G, Gc1, Gc2, Gc3, Gc4, Gc5, Gc6, opts); grid on
legend('G', 'Gc1', 'Gc2', 'Gc3', 'Gc4', 'Gc5', 'Gc6')
grid off
