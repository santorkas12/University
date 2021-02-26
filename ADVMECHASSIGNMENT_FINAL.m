%Phase 1 Calculation

V=[0:1:50 51 51.19]';

for i=1:53
    x(i,1)=(V(i,1))^(2);
    y(i,1)=((49344)/(314511-(20.27*(V(i,1))^(2))));
end

plot(x,y,'b') %PLOT OF PHASE 1

for i=1:52
    dist0=0
    distx(i,1)=((y(i+1,1)+y(i,1))/(2))*(x(i+1,1)-x(i,1));
end

PHASE1=sum(distx(:,1));


%Phase 1 Distance = 450.32m 




%PHASE 2 
%Assuming rotation of 5deg/s and n=1.44



%t=0-1.0s
V21=[51.19 52 53 53.91]';

for i=1:4
    x21(i,1)=(V21(i,1))^(2);
    y21(i,1)=((49344)/(314511-(33.12*(V21(i,1))^(2))));
end
  
plot(x21,y21,'b-');

for i=1:3  
    distx21(i,1)=((y21(i+1,1)+y21(i,1))/(2))*(x21(i+1,1)-x21(i,1));
end

L21=16.87*(V21(4,1))^(2);

PHASE21=sum(distx21);

%Phase 2: 64.27m OVERESTIMATE


%t=1.0-2.0s

V22=[53.91 54 55 56 56.09]';

for i=1:5
    x22(i,1)=(V22(i,1))^(2);
    y22(i,1)=((49344)/(314511-(53.18*(V22(i,1))^(2))));
end

plot(x22,y22,'b-');

for i=1:4
        distx22(i,1)=((y22(i+1,1)+y22(i,1))/(2))*(x22(i+1,1)-x22(i,1));
end

PHASE22=sum(distx22); %77.10m

L22=21.48*(V22(5,1))^(2);

%PHASE22 DISTANCE = 77.10m


%At t=2-3s

V23=[56.09 57 57.46]';

for i=1:3
    x23(i,1)=(V23(i,1))^(2);
    y23(i,1)=((49344)/(314511-(53.18*(V23(i,1))^(2))));
end

plot(x23,y23);

for i=1:2
        distx23(i,1)=((y23(i+1,1)+y23(i,1))/(2))*(x23(i+1,1)-x23(i,1));
end

PHASE23=sum(distx23);

L23=26.09*(V23(3,1))^(2); %=86140>>Lcritical. Can interpolate linearly to
%achieve the exact required value.

%t=2-2.214

V23new=[56.09 56.38]';

for i=1:2
    x23new(i,1)=(V23new(i,1))^(2);
    y23new(i,1)=((49344)/(314511-(53.18*(V23new(i,1))^(2))));
end

plot(x23new,y23new);

for i=1
        distx23new(i,1)=((y23(i+1,1)+y23(i,1))/(2))*(x23(i+1,1)-x23(i,1));
end

PHASE23new=sum(distx23new) %Distance is now 35.61m

%Total takeoff distance
TOTALTAKEOFFDISTANCE=PHASE1+PHASE21+PHASE22+PHASE23new; %625.86m


%DURING PHASE 3 CALCULATIONS - BECAUSE THE REQUIRED ANGLE OF ATTACK AT
%ROTATION END IS TOO HIGH, THE HORIZONTAL DISTANCE TRAVELLED TO ACHIEVE
%THIS IS TOO BIG.

%ALSO THE VERTICAL DISTANCE HAS ALREADY EXCEEDED THE REFERENCE DISTANCE WE
%ARE MEASURING AGAINST, MAKING OUR CALCULATIONS INCOMPLETE AND UNREALISTIC.
%TO MITIGATE THIS, WE REDUCE THE DISTANCE OF ROTATION BY REDUCING THE STALL
%ANGLE OF ATTACK FROM 15DEG TO 10DEG. THIS STEEPENS THE CL/A SLOPE, AND
%WILL PROVIDE THE REQUIRED LIFT AT A LOWER ANGLE OF ATTACK, WHICH FOR THE
%SAME RATE OF ROTATION WILL BE ACHIEVED QUICKER, RESULTING IN A SHORTER
%DISTANCE AND ALLOWING TO COMPLETE THE CALCULATION.




%CALCULATION FOR STALL AoA=10 DEGREES PHASE2

V21=[51.19 52 53 53.91]';

for i=1:4
    x21(i,1)=(V21(i,1))^(2);
    y21(i,1)=((49344)/(314511-(43.1*(V21(i,1))^(2))));
end
  
plot(x21,y21,'b-');

for i=1:3  
    distx21(i,1)=((y21(i+1,1)+y21(i,1))/(2))*(x21(i+1,1)-x21(i,1));
end

PHASE21=sum(distx21);

L21=19.17*(V21(4,1))^(2);

%T=1.0-2.0S

%V22=[53.91 54 55 55.79]';

%L22=26.14*(V22(4,1))^(2);%LIFT FORCE=81.36kN THEREFORE NEED TO INTERPOLATE

%INTERPOLATING GIVES ANGLE REQUIRED=7.86 DEGREES AND TIME OF ROTATION
%0.572SECONDS

%t=1.0-1.572

V22=[53.91 54 54.99]';

for i=1:3
    x22(i,1)=(V22(i,1))^(2);
    y22(i,1)=((49344)/(314511-(43.1*(V22(i,1))^(2))));
end
  
plot(x22,y22,'b-');

for i=1:2
    distx22(i,1)=((y22(i+1,1)+y22(i,1))/(2))*(x22(i+1,1)-x22(i,1));
end

PHASE22=sum(distx22);

TAKEOFFDISTANCE=PHASE1+PHASE21+PHASE22+95.98+26.96;