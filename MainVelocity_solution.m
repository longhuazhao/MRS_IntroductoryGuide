clear all; close all;

%Parameters
epsilon = 0.05;
mu = 1;

%Initial Positions and Force
x = [-3; 2; 1]; % forcing location
%f = [       ]; % force is unknow for this exercise
u = [1; -0.5; -1]; % prescribed velocity created by the force

% this observation is for exercise 4 (d)-(e) choose 
 y = [1; -2; 3];  %oberservation point is the same location to find the force 


%Time Parameters
t=0; %Initial Time
tFinal = 0.01; % Final Time
delta_t = 0.01; %Time Step
N=6; %Number of Time Steps

%format long
for i=1:N

    % for exercise 3 you need make sure the force and observation location
    % are both x
    % Call the Reg Stokes Function to compute A
    A= RegStokes( x, x,epsilon);
    
    %solve f: u=1/(8*pi*mu)*A *f 
    f=  (1/(8*pi*mu)*A)\u
  
    
    %uncomment this to continue the loop for exercise 4 
    %break
    

    % Call the Reg Stokes Function to compute A
    A= RegStokes(x,y,epsilon);

    %Use A to compute the velcoity u
    u = 1/(8*pi*mu)*A*f;


    %Update the position with Forward Euler
    y = ForwardEuler(y,u,delta_t);
    i
    y
    %Update the time
    t = i*delta_t;

    %Visualize the results
    if mod(t,.01)==0

        fg1=figure(1);

        plot3(y(1),y(2),y(3),'b.','MarkerSize',20)

        title(strcat("t=",num2str(t)))

        xlim([1.9,2.1])
        ylim([-.1,.2])
        zlim([0.9,1.1])

        xlabel('x')
        ylabel('y')
        zlabel('z')

        pause(.01)

    end

end


