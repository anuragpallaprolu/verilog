% IF neurons, multiple
close all

ncells =50;
vrest=-70;

vreset = -70;
vthr= -50;
taum = 50;

sd =	140; % noise, indep per neurons
sdcommon= 50; % noise, common to all cells, can be seen as part of stimulus.
dt =0.1;
endtime=1*1e3; % in ms
nsteps =endtime/dt;
spikes = zeros(1,nsteps);
finst= zeros(ncells,nsteps);
vmem = vrest*ones(ncells,nsteps);

isi=[];
vmem(:,1) = vrest';
lastspiketime=zeros(1,ncells);

for itime= 2: nsteps
    istim =20;
    if (itime > nsteps /2)
        istim = 40;
    end
	istim= istim +sdcommon*randn;
	stimhist(itime)= istim;
    i = ones(1,ncells)*istim + sd*randn(1,ncells);
    vmem(:,itime) = vmem(:,itime-1)+ dt /taum*(-(vmem(:,itime-1)-vrest') +i' );

    sp=find(vmem(:,itime)> vthr);
      %      finst(sp,itime)= 1e3*10/(itime-lastspiketime(sp)'); ???
    spikes(sp,itime)=1;
    vmem(sp,itime) = vreset;
       % isi = [isi itime-lastspiketime(sp)];
    lastspiketime(sp) = itime;
end

mean(sum(spikes'))/endtime*1e3 % firing rate in Hz


for ic=1: ncells
    sp=find(spikes(ic,:));
    spy=ic+0*sp;
    plot(sp,spy,'.')
    xlabel("Time(ms)")
    ylabel("Neuron index")
    hold on
end
% filter the stimulus current.
N=40;
stimhist = filter(ones(1,N)/N, 1, stimhist);
plot((stimhist)/10-10,'r;stimulus')


%sound (spikes(1,:), 10000);
%plot (finst(1,:))
%figure
%plot (finst(2,:))

