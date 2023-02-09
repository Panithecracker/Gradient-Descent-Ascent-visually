clear all
format long
clc
%% this project pretends to intuitively animate a ball that starting over 
%% a random point in space, at the graph of an arbitrary user defined function , 
%% keeps rolling until it gets to a local maximum.(red ball).
%% Similarly, another ball (blue) rolls ober the graph of f(x,y) until it gets to
%% a local minimum.

%% For the sick of generality and versatility for any user defined function, we will estimate the gradient by computing the partial derivatives of f numerically.

%we will store random points for each purpose(minimizing or maximizing)
l = input("Specify the length of the square over which f wants to be optimized here : ");
size = input("Insert the amount of points to animate:") ;%define the amount of sample points to animate (for both purposes: max and min)
for i=1:size
    MaxExplorersX(i) = (-1)^randi(2)*randi(l);
    MaxExplorersY(i) =(-1)^randi(2)*randi(l);
    MaxExplorersZ(i)= f(MaxExplorersX(i),MaxExplorersY(i));
    MinExplorersX(i) = (-1)^randi(2)*randi(l);
    MinExplorersY(i) = (-1)^randi(2)*randi(l);
    MinExplorersZ(i) = f(MinExplorersX(i),MinExplorersY(i));
end

%% SIMULATING GRADIENT DESCENT AND ASCENT SPECIFIED LEARNING RATE FOR MANY POINTS OVER SPECIFIED SQUARE CENTERED AT THE ORIGIN

x = linspace(-l,l,(2*l)/(0.1)+1);
y = x;
[X,Y] = meshgrid(x,y);
for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = f(X(i,j),Y(i,j));
    end
end
surf(X,Y,Z);
xlabel("x");
ylabel("y");
zlabel("z");
alpha(0.5)
% colormap jet %cool look if you want it, uncomment
shading interp;
colorbar 
%  view(2); %for bird view uncomment this 
grid on;
hold on;

%% RUNNING SIMULATIONS ....
learning_rate  = 0.15; %this is the scaling factor applied to the direction in which we take the step...we keep it constant, however, it is common to pick different ones, depending on each iteration context
h1 = scatter3(MinExplorersX,MinExplorersY,MinExplorersZ,'o',"filled");
hold on;
h2 = scatter3(MaxExplorersX,MaxExplorersY,MaxExplorersZ,'o',"filled");
hold on;
go = 1;
iters = 1;
while(go == 1)
    go = 0;
    if iters < 300
    for i=1:size
      [u,v] = Gradient_f(MaxExplorersX(i),MaxExplorersY(i));
        if ((u~=0)||(v~=0)) && (abs(MaxExplorersX(i)+learning_rate*u)<=l)&& (abs(MaxExplorersY(i)+learning_rate*v)<=l)
            go = 1; %current explorer point still moves and doesnt get out of the targeted region (square of side l)
            MaxExplorersX(i) = MaxExplorersX(i)+learning_rate*u;
            MaxExplorersY(i) = MaxExplorersY(i)+learning_rate*v;
            MaxExplorersZ(i) = f(MaxExplorersX(i),MaxExplorersY(i));
        end
      [u,v] = Gradient_f(MinExplorersX(i),MinExplorersY(i));
         if ((u~=0)||(v~=0))&&(abs(MinExplorersX(i)-learning_rate*u)<=l)&&(abs(MinExplorersY(i)-learning_rate*v)<=l)
            go = 1; %current explorer point still moves and doesnt get out of the targeted region (square of side l)
            MinExplorersX(i) = MinExplorersX(i)-learning_rate*u;
            MinExplorersY(i) = MinExplorersY(i)-learning_rate*v;
            MinExplorersZ(i) = f(MinExplorersX(i),MinExplorersY(i));
         end
    end
    set(h2,"XData",MaxExplorersX);
    set(h2,"YData",MaxExplorersY);
    set(h2,"ZData",MaxExplorersZ);
    set(h1,"XData",MinExplorersX);
    set(h1,"YData",MinExplorersY);
    set(h1,"ZData",MinExplorersZ);
    drawnow;
    if iters == 1
        for iters = 1:50
          F(iters) = getframe(gcf);
        end
    end
    F(iters) = getframe(gcf);
    iters = iters+1;
    pause(0.001);
    end
end
video = VideoWriter("GradOptimal.avi","Uncompressed AVI");
open(video);
writeVideo(video,F);
close(video);

function z = f(x,y)
%define any two variable function here ...
% z = x^2+2*x*y+3*y^2+4*x+5*y+6;
%  z = sin(x)*cos(y);
 z = (2*x^2)-(1.05*x^4)+(x^6/6)+(x*y)+(y^2);
% z = (12*cos((x^2+y^2)/4))/(3+x^2+y^2);
% z = y*sin(x)-x*cos(y);
end
function [x1,x2] = Gradient_f(x,y) %numerical computation of the gradient using h = 0.1 for the numerical partials
x1 = (f(x+0.1,y)-f(x,y))/(0.1);
x2 = (f(x,y+0.1)-f(x,y))/(0.1);
end
function [x, y] = Most_Away(vector) % this function returns for a vector of plane coordinates, (x,y), stored as [x1,y1,x2,y2,... xn,yn] the index of the xcoordinate of the vector whose length is the longest.
  u = [vector(1), vector(2)];
  for i=2:(size(vector,2)/2)
      v = [vector(i) ,vector(((size(vector,2))/(2))+i)];
      if norm(v) > norm(u)
        u = v;  
      end
  end
  x = u(1);
  y = u(2);
end