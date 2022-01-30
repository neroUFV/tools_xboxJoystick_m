%% Experiment requires !Robots/robots_ardrone_m 
% Connects to robot and enables VTOL via joystick commands.

%% cleanup
clearvars;close all;clc;

%% startup
J = JoyControl;
J.mConnect;

A = ArDrone;