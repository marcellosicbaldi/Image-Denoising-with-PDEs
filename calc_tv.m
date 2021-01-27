function unew = calc_tv(f)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on: [ROF92] L. Rudin, S. Osher, E. Fatemi,
% "Nonlinear Total Variation based noise removal algorithms",
% Physica D 60 259-268,1992.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Simple TV denoising  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETERS

lambda0=0.01; %0.1;
epsilon=1e-2;
maxiter=2500;
tau=3e-2; %1e-2;

uold=f;
for i=1:maxiter
    
    Gx=gradx(uold);
    Gy=grady(uold);
    
    unew = uold + tau*( div(Gx./sqrt(Gx.^2+Gy.^2+epsilon),Gy./sqrt(Gx.^2+Gy.^2+epsilon)) + lambda0*(f-uold) );
   
%     if mod(i,200)==0
%         
%     figure(100),
%     imagesc(unew), colormap(gray)
%     title(['TV denoising, i=' num2str(i)]);
%     drawnow
%     end
    uold=unew;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function u_new = calc_tikhonov(f)
% 
% lambda0=0.005 %0.1;
% epsilon=1e-2;
% maxiter=6000;
% tau=1e-2;
% 
% uold_tik=f;
% 
% for i=1:maxiter
%    
%    
%     Gx_tik=gradx(uold_tik);
%     Gy_tik=grady(uold_tik);    
%     
%     unew_tik = uold_tik + tau*( div(Gx_tik,Gy_tik) + lambda0*(f-uold_tik));
%     
%     if mod(i,200)==0
%         
%     figure(200),
%     imagesc(unew_tik), colormap(gray)
%     title(['Tikhonov denoising, i=' num2str(i)]);
%     drawnow
%     
%     end
%     
%     uold_tik=unew_tik;
%     
% end