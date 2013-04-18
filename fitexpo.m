
function [NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(X,Y,DelY)

%--------------------------------------------------------------------
% fitpoly function       LSQ Exponential fitting.
%                      fit exponential function of the form:
%                      Y = A * exp(b*X) + 1;
%                      to set of N data points. Return the parameters,
%                      the errors on the parameters,
%                      the \chi^2, and the covariance matrix.
% Input  : - Column vector of the independent variable.
%          - Column Vector of the dependent variable.
%          - Vector of the std error in the dependent variable.
%            If only one value is given, the points
%            are taken to be with equal weight. and Std error
%            equal to the value given.
% Output : - Fitted parameters [A,b]
%          - Fitted errors in the parameters [DA,Db]
%          - The covariance matrix.
%          - Chi2 of the fit.
%          - Degrees of freedom.
%          - The Y axis residuals vector.
%--------------------------------------------------------------------
MaxNIter = 5;
Deg  = 2; % degree of freedom is the number of values in the final calculation of a statistic that are free to vary

NewY = log(Y); 

N_X  = length(X);
N_Y  = length(Y);
N_DY = length(DelY); % standard deviation of y-data
if (N_X~=N_Y),
   error('X and Y must have the same length');
end
if (N_X~=N_DY),
   if (N_DY==1), % one standard deviation is given for all y-data points
      % take equal weights
      if (DelY<=0),
         error('DelY must be positive');
      else
         DelY = DelY.*ones(N_X,1); % this value is set to be a matrix as long as x-data
      end
   else
      error('Y and DelY must have the same length');
   end
end

residu = zeros(size(DelY)); % preallocation of residuals. 

Iter = 0;

while (Iter<MaxNIter && (max(abs(residu)>DelY | Iter==0))), % while residues are bigger than standard deviation
   Iter = Iter + 1;

   % degree of freedom
   Freedom = N_X - (Deg + 1); % sta je ovo!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
   % building the H matrix
   H = zeros(N_X,Deg);        % preallocation of H matrix to have size of x-data by degrees of freedom
   H(:,1) = ones(N_X,1);      % initiation parameter set
   for Ind=2:1:Deg,           % loop for calculation of all other H values. steps of one, maximum deg.of freed.
      H(:,Ind) = X.^(Ind-1);  % H is X to the power of degrees of freedom minus one. 
   end
   
   % building the Covariance matrix
   V = diag(DelY.^2); % gets the diagonal of the standard deviation matrix squared. 
%   V
   % Old - Memory consuming
   Cov     = inv(H'*inv(V)*H);  
% covariance is the inverse of H matrix fliped, times inverse of diagonal times H. ie. identity matrix of H times %inverse of diagonal matrix! kako zasto di kuda jebem vam majku fasisticku
 
% first parameter estimation:

  Par     = Cov*H'*inv(V)*NewY; % multiplication by NewY = log(Y) = log(A)+ b*X
  Par_Err = sqrt(diag(Cov));

   NewPar        = zeros(2,1); % allocation for three values for output
   NewPar_Err    = zeros(2,1);

 %  NewPar(3)     = sqrt(-1./(2.*Par(3)));
 %  NewPar(2)     = NewPar(3).^2.*Par(2);
 %  NewPar(1)     = exp(Par(1) + 0.5.*NewPar(2).^2./(NewPar(3).^2));

NewPar(2) = Par(2);

NewPar(1) = exp(Par(1) + NewPar(2));


%    NewPar_Err(3) = (0.5./sqrt(2)).*Par_Err(3).*abs(Par(3)).^(-1.5);
% 
%    NewPar_Err(2) = sqrt((2.*NewPar(3).*Par(2).*NewPar_Err(3)).^2 + (NewPar(3).^2.*Par_Err(2)).^2);
% 
%    NewPar_Err(1) = sqrt((NewPar(1).*Par_Err(1)).^2 + ...,
%                         (NewPar(1).*NewPar(2).^2.*NewPar(3).^(-3).*NewPar_Err(3)).^2 + ...,
%                         (NewPar(1).*NewPar(2).*NewPar_Err(2)./(NewPar(3).^2)).^2);

   %'Number of degree of freedom :', Freedom
   residu = NewY - H*Par;
   Chi2  = sum((residu./DelY).^2);

   %Chi2/Freedom
   %sqrt(2/Freedom)
end
