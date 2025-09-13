Ts=0.01; % sampling time
num=2.3; % the numerator coefficients of the transfer function of a physical system
den=[0.1 1.1 1]; % the denomerator coefficients of the transfer function of a physical system
G= tf(num, den); % the transfer function
sysd = c2d(G,Ts,'zoh'); % Convert the transfer function into a discrete-time transfer function
e(1)=0; % error initialization
e(2)=0;
u(1)=0; % initialization of the input signal
u(2)=0;
y(1)=0; % initialization of the input signal
y(2)=0;
A1 = 0.001109;  % the numerator coefficients of the discrete-time transfer function 
A0 = 0.001069;
B1 = -1.895; % the denomerator coefficients of the discrete-time transfer function 
B0 = 0.8958;
a1 = 2.23; % the numerator coefficients of the PI controller
a0 = -2.2;
b1 = 1;  % the denomerator coefficients of the PI controller
b0 = -1;
N = 500; % number of samples
consigne = 1;
for k = 3:N
    y(k) = -B1*y(k-1) - B0*y(k-2) + A1*u(k-1) + A0*u(k-2); % recurrence equation
    e(k) = consigne - y(k);
    u(k) = (a1/b1)*e(k) + (a0/b1)*e(k-1) - (b0/b1)*u(k-1);
end
t = (0:N-1)*Ts;
y=y(1:N);
size(t)
size(y)
plot(t, y, 'b', 'LineWidth', 2);
xlabel('Temps (s)');
ylabel('y(t)');
title('closed-loop impulse response');
grid on;