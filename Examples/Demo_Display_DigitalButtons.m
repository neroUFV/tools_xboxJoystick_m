%% Simple JoyControl button mapping demo
% Display button clicks until desired button is pressed.

% Digital clicks are read as a 10-element boolean-valued vector:
% [ A B X Y LB RB BACK START LEFT-ANALOG-CLICK RIGHT-ANALOG-CLICK]
  

%% cleanup
clearvars;close all;clc;

%% startup
J = JoyControl;
J.mConnect;  % creates joystick object and connect

DESIRED = 9; % LEFT-ANALOG digital button 
state = 1;   % pressed state
% expects button LEFT-ANALOG to be clicked to exit
% !CHECK JoyControl.m or Readme.md for the button mapping.
  
%% run
FLAG = true;
while FLAG

    J.mRead     % update state vector pDigital
    pause(0.05) % 50ms pause
    clc
    
    disp('Pressed:') % display clicks
    disp(J.pDigital)

    % break loop if desired button was pressed
    if (J.pDigital(DESIRED) == state)

        FLAG = false;
    end
    
    
end

