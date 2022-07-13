clc
clear

% 드론 객체 선언
droneObj = ryze('Tello');

% 이륙
takeoff(droneObj);
pause(3);

% 왼쪽으로 이동(roll)
moveleft(droneObj,3);
pause(3);

% 회전(yaw)
turn(droneObj,deg2rad(45));
pause(3);

% 직진(pitch)
moveforward(droneObj,3*sqrt(2));
pause(3);

% 회전(yaw)
turn(droneObj,deg2rad(-45));
pause(3);

% 후진(pitch)
moveback(droneObj,3);
pause(3);

% 착륙
land(droneObj);





