
EF=INS1.EF;
SCR= INS1.SCR;
EF= nominal(EF);
SCR= nominal(SCR);
subplot(1,3,1);
hist(INS1.EF(SCR=='0'), 5);
legend('EF')
xlabel('Clase 0');
subplot(1,3,2);
hist(INS1.EF(SCR=='1'), 5);
legend('EF')
xlabel('Clase 1');
subplot(1,3,3);
hist(INS1.EF(SCR=='2'), 5);
legend('EF')
xlabel('Clase 2');
subplot(1,3,1);
hist(INS1.EF(SCR=='3'), 5);
legend('EF')
xlabel('Clase 3');
subplot(1,3,2);
hist(INS1.EF(SCR=='4'), 5);
legend('EF')
xlabel('Clase 4');

ClassSCR = 1 + (INS1.EF <50);
INS1.ClassSCR= ordinal(SCR,{'Menores a 50', 'Mayores a 50'});

