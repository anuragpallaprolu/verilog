function alpha = simulation_euler_flow(l,L,lambda_max)
%--------------------------------------------------------------------------
[nbr A lambdass Nss Pss] = ODE_rhs(l,L,lambda_max); %#ok<NASGU>
%--------------------------------------------------------------------------
%initialling data randomely
alpha0 = zeros(1,nbr);
alpha0(1:3) = 2.5*rand(1,3);
%--------------------------------------------------------------------------
%viscosity and viscosity matrix
nu = 0.03;
D = nu*diag(lambdass);
rel_time1 = 0;
%--------------------------------------------------------------------------
disp('Solving now ODE...')
disp('0%------20%-------40%-------60%-------80%------100%')
%--------------------------------------------------------------------------
Tmax = 100;
Time = linspace(0,Tmax,900);
[T, alpha] = ode113(@right_hand_side,Time,alpha0);
%==========================================================================
rel_time1 = 0;
%--------------------------------------------------------------------------
    function dy = right_hand_side(t,y) %#ok<INUSL>
        %==================================================================
        % display remaining time
        rel_time = floor((t/Tmax)*50);
        string = repmat('|',1,rel_time-rel_time1);
        rel_time1 = max(rel_time,rel_time1);
        fprintf(1,string)
        %==================================================================
        dy = zeros(nbr,1);
        for k=1:nbr;
            dy(k) = -0.3*y.'*A{k}*y;
        end
        dy = dy-nu*D*y; %adding viscosity (remove this line for Euler flow)
    end
%==========================================================================
%saving the data
save('data_euler_flow','nbr','l','L','T','lambda_max',...
    'alpha0','alpha','lambdass','Nss','Pss')
%==========================================================================
fprintf('\n\n')
disp('Solution saved in file: data_euler_flow.mat')
disp('Use function graph_flow_euler.m to make a video')
end

