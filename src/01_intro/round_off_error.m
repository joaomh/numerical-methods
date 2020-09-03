% The same example used in round_off_error.ipynb
% We'll study the effects of accumulation of roundoof error
n = 8;
x = linspace(-1,1,8);
y0 = 0;
y = y_func(y0, n);

% The value of 'y' goes to infinity
figure(1), clf
plot(x,y,'linew', 3)
title('The values of y goes to infinity')
%% The dangers of higher order polynomial interpolation

x = linspace(-1,1,10);
y = 1 ./( 1 + 25*x.^2);

xx = linspace(-1,1,100);
p = polyfit(x,y,4);
y4 = polyval(p,xx);

yr = 1./(1 + 25*xx.^2);

figure(2), clf
plot(x,y,'bo'), hold on
plot(xx,y4, 'linew', 3)
plot(xx,yr,'--')
legend('','Polynomial fit','Runge function')
% The polynomial does a poor job of following Runge’s function

%% Continuing with the analysis,
% the 20th-order polynomial can be generated and plotted
x = linspace(-1,1,10);
y = 1 ./( 1 + 25*x.^2);

xx = linspace(-1,1,100);
p = polyfit(x,y,20);
y4 = polyval(p,xx);

yr = 1./(1 + 25*xx.^2);

figure(3), clf
plot(x,y,'bo'), hold on
plot(xx,y4, 'linew', 3)
plot(xx,yr,'--')
legend('','Polynomial fit','Runge function')
% The polynomial does a poor job of following Runge’s function
%% using maclaurin to calculate 'e'
[e, a, inte] = maclaurin(1,1e-6,100);
e = vpa(e);
error = e - vpa(exp(1));
disp('The error is:');
disp(error);

disp("The epsilon funciton build in matlab is: " + eps)
%% Using limit to calculate 'e'
% lim->oo(1 + 1/n)^n = e = 2.7182...
euler = @(n) (1 + 1./n).^n;
euler(1000)
euler(10e16)

% when n becames bigger than 10^15 our function stop to increase and start
% to oscillating
x = linspace(1,1e16,1000);
y = euler(x);
y2 = exp(1);
plot(x,y)
set(gca, 'XScale', 'log')
hold on
xlim = get( gca, 'Xlim' );
plot( xlim, [y2 y2] )
title("euler function in lin-log scale")
legend("f(n) ","Real Value of Euler Number")


%% Functions used in this code
% Function y used to calculate te integral in the first example
function y_sol = y_func(y0,n)
y_sol = zeros(1,n);
y_sol(1,1) = y0;
for i = 2:n
    y_sol(1,i) = 1/n - 5*y_sol(1,i-1);
end
end

function [fx, ea, iter] = maclaurin(x, esp, max_int)
%     Maclaurin series of exponential function
%     input:
%     x = value at which series evaluated
%     esp = stopping criterion (default = 0.0001)
%     max_int = maximum iterations (default = 50)
%     output:
%     fx = estimated value
%     ea = approximate relative error (%)
%     iter = number of iterations
iter = 1;
sol = 1;
ea = 100;
while sol
    solold = sol;
    sol = sol + x^iter / factorial(iter);
    iter = iter + 1;
    if sol ~= 0
        ea = abs((sol - solold)/sol)*100;
        if ea <= esp && iter>= max_int
            break
            
        end
    end
    fx = sol;
end
end

