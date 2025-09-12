% vse kroznice narisane
hold on
axis equal
%aproksimacija(pi,1,linspace(0,1,50),'blue')
%aproksimacija(pi,2,linspace(0,1,25),'red')
aproksimacija(pi,3,linspace(0,1,25),'blue')
%enotska kroznica
t2=linspace(0,pi);
hold on
plot(cos(t2),sin(t2),'k-','LineWidth',1)

hold off
