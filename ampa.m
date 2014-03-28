% simulation of an AMPA state-diagram.

% state vector
% [c0 c1 d1 c2  d2 o]
% c0: closed, unbound
% c1: closed, 1 Glu bound
% c2: closed, 2 Glu bound
% d1,d2 : densitized
% o: open state
s0=[1 0 0 0 0 0]'; % initial occupancy
m=zeros(6,6);

rb	= 13e6;
ru1	= 5.9; %from Destexhe, very slow..
ru2 = 8.6e4; %from Destexhe

%ru1	= 5.9e3; %from NeuronC (roughly)
%ru2 = 8.6e3; %from NeuronC
rd	= 900;
rr 	= 64;
ro  = 2.7e3;
rc	= 200;

T=1; % transmitter concentration in M

% transition matrix in 1/s .m_ij indicates transition from j to i.
m(1,1)= -rb*T;
m(1,2)= ru1;

m(2,1) = rb*T;
m(2,2) = -ru1-rd-rb*T;
m(2,3) = rr;
m(2,4) = ru2;

m(3,2) = rd;
m(3,3) = -rr;

m(4,2) = rb*T;
m(4,4) = -ru2-rd-ro; 
m(4,5) = rr;
m(4,6) = rc;

m(5,4) = rd;
m(5,5) = -rr;

m(6,4) = ro;
m(6,6) = -rc;

dt = 1e-6; % in s

ntime=floor(10e-3/dt);
s=zeros(6,ntime); 
s(:,1)=s0;
for itime = 1:ntime
	time = dt*itime;
	
	T=0.001*((time > 0.003 && time < 0.004)+(time > 0.023 && time < 0.024));
	 % 1mM pulse of Glu between 3 and 4ms
	
	% update the transmitter dependent transitions
	m(1,1)= -rb*T;
	m(2,1) = rb*T;
	m(2,2) = -ru1-rd-rb*T;
	m(4,2) = rb*T;
	
	s(:,itime+1) = max(s(:,itime)+dt*m*s(:,itime),0);
end

colours = ['r', 'g', 'b', 'k', 'c', 'm']
hold off
for i=1:6
plot(s(i,:), colours(i));
hold on
end

	
