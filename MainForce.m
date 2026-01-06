clear all; close all;

%Initial Positions and Force
x = [1; -1; 2]; % forcing location
f = [2; 3; -1]; % force
y = [2; 0;  1];  %oberservation point

%Parameters
epsilon = 0.05;
mu = 1;


%Time Parameters
t=0; %Initial Time
tFinal=0.06; % Final Time
delta_t=0.01; %Time Step
N=1; %Number of Time Steps
    
format long
for i=1:N

    % Call the Reg Stokes Function to compute A
    A= RegStokes(x,y,epsilon);
   

    %Use A to compute the velcoity u
    u = 1/(8*pi*mu)*A*f;

    %Update the position with Forward Euler
    y = ForwardEuler(y,u,delta_t);


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


