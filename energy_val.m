function res = energy_val(m1,m2,Mass1,Mass2)
m1y = Mass1(:,2);
m1speed = sqrt((Mass1(:,3)^2) + (Mass1(:,4)^2));
m2y = Mass2(:,2);
m2speed = sqrt((Mass2(:,3)^2) + (Mass2(:,4)^2));

KE1 = .5*m1*(m1speed^2);
PE1 = m1*9.81*m1y;
KE2 = .5*m2*(m2speed^2);
PE2 = m2*9.81*m2y;

KEtotal = KE1 + KE2;
PEtotal = PE1 + PE2;

ME = KEtotal + PEtotal;


end
