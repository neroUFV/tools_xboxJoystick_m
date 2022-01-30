%% Experiment requires !Robots/robots_ardrone_m 
% Connects to robot and enables VTOL via joystick commands.
% Adapted code from robots_ardrone_m/Examples/Demo_ArDroneConnecting.m

% !WARNING: turn ArDrone ON and connect this machine to it's Wi-Fi.

%% cleanup
clearvars;close all;clc;

%% startup
% Instatiate and connect to joystick and robot
J = JoyControl;
J.mConnect;

figure(1)
drawnow

A = ArDrone;
A.rConnect;

% Set up B digital button for emergency break
DESIRED = 2; 
state = 1;

% Experiment variables
X = []; 
tmax = 30;   % experiment time in seconds

%% run 
A.rTakeOff
pause(3) % take flight and hover for 3secs.

t = tic;
tc = tic;

while toc(t) < tmax

    % EMERGENCY LOOP-BREAKER 
    J.mRead; % Update joystick data
    if (J.pDigital(DESIRED) == state)
        disp('EMERGENCY BREAK SUCCESSFUL!')
        break
        % stop experiment if DESIRED button is pressed.
    end

    % COMMAND LOOP
    if toc(tc) > 1/30
        tc = tic;

        % Update flight data
        A.rGetStatusRawData

        if sum(A.pCom.cRawData) > 1
   
            Y = [A.pCom.cRawData toc(t)];
            X = [X; Y];  % TODO transformar em matriz prealocada!
            
            try
                delete(h1,h2,h3)
            end
            
            subplot(3,1,1),h1 = plot(X(:,end),X(:,2:4)); axis([0 tmax -45 45])
            subplot(3,1,2),h2 = plot(X(:,end),X(:,5)); axis([0 tmax 0 3])
            subplot(3,1,3),h3 = plot(X(:,end),X(:,8)); axis([0 tmax -0.5 0.5])
            drawnow
            
        end
    end


end

% Land and close connection
A.rLand
A.rDisconnect

