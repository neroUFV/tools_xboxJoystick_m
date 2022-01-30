%% Simple JoyControl button mapping demo
% Display button clicks until desired button is pressed.

% Analog clicks are read as a 5-element real-valued vector in [-1,1]:
% [ RIGHT-ANALOG RIGHT-ANALOG   TRIGGERS    LEFT-ANALOG  LEFT-ANALOG  ]
% [  left/right     up/down    left/right    left/right     up/down   ]   

%% cleanup
clearvars;close all;clc;

%% startup
J = JoyControl;
J.mConnect;  % creates joystick object and connect

DESIRED = 5; % left analog
state = -1;  % up motion
% expects UP to be pressed on the left analog buttong to exit
% !CHECK JoyControl.m or Readme.md for the button mapping.
  
%% run
FLAG = true;
while FLAG

    J.mRead     % update state vector pAnalog
    pause(0.05) % 50ms pause
    clc
    
    disp('Pressed:') % display clicks
    disp(J.pAnalog)

    % break loop if desired button was pressed
    if (J.pAnalog(DESIRED) == state)

        FLAG = false;
    end
    
    
end

disp('Disconnecting from joystick.')
