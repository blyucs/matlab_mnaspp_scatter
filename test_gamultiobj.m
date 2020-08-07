fun1 = @(x) -x(1)%x(1)^4-10*x(1)^2+x(1)*x(2)+x(2)^4-x(1)^2*x(2)^2;  %min f1(x1,x2)
fun2 = @(x) -x(2)%x(2)^4-x(1)^2*x(2)^2+x(1)^4+x(1)*x(2);  %min f2(x1,x2) 
fun1and2 = @(x) [fun1(x) fun2(x)];
lb = [-5 -5]; 
ub = [5 5];
options = gaoptimset('PopInitRange',[lb;ub]);
[x,fval,exitflag] = gamultiobj(fun1and2,2,[],[],[],[],lb,ub,options);
[x(:,1) fval(:,1) x(:,2) fval(:,2)]