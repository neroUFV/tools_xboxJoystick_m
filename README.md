# tools_xboxJoystick_m

```  
Em desenvolvimento! Versão mais recente na branch firstRelease. Versão antiga / legado Dropbox na branch main.
```

% Joystick control
	% XBOX gamepad mapping:
%       [LB/LT]                                   [RB/RT]
%     . - . - . -                               - . - . - .
%   .             \ - - - - - - - - - -  - -  /            .
%  .       ^                                                .
% .       (-)                                      [4]      |
% |  <(-) [9] (+)>     <[7] (XBOX) [8]>         [3]   [2]   .
% .       (+)                             ^        [1]      |
% |        v                             (-)                .
% .       (LA)                      <(-)[10](+)>            |
% |                            (RA)      (+)                .
% .                                       v                 |
% |             - - - - - - - - - - - - - - - -             .
% .          /                                  \           |
%  \       /                                      \       /
%   \    /                                          \   /
%
%
%      ---                           ---
%    /  --  \                      / --  \
%   |  |LT|  \ _________________ /  |RT|  |
%   |  |  |                         |  |  |
%   |   --                           --   |
%   |                                     |
%    \ [5-LB] - - - - - - - - - -  [6-RB] /
%      _____/                     \______
%
%
% LA,RA = Left Axis,Right Axis
% LT,RT = Left Trigger, Right Trigger (ANALOG)
% LB,RB = Left Button, Right Button
%
% AXIS VECTOR: [XL YL (LT+/RT-) XR YR]

% ====================================================