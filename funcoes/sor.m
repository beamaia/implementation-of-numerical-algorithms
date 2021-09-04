function [x,iter,res,diag_nula] = sor(A,b,tol,nmaxiter,w)
%
% Entrada: 
%   A,b = matriz, vetor independente
%   tol = tolerancia
%   nmaxiter = numero maximo de iteracoes
%   w = parametro SOR (w=1 Gauss-Seidel)
% Saida:
%   x = vetor solucao
%   iter = numero de iteracoes
%   res = vetor com norma do maximo do residuo
%   diag_nula = 1 (diagonal principal com elemento nulo)
%
     small = 1.e-16;
     diag_nula = 0;
     [n,n]=size(A);
     iter = 0;
     res(1) = 0.;
     err = tol+1.;  
     norm_res = err;
     x0 = zeros(n,1);
     x = x0;
     while (norm_res > tol)&&(iter < nmaxiter)
        for i=1:n
          soma = 0.0;
          for j = 1:(i-1)
            soma = soma + A(i,j)*x(j);
          endfor
          for j = (i+1):n
            soma = soma + A(i,j)*x0(j);
          endfor
          if( abs(A(i,i)) < small)
            i = n + 1;
            diag_nula = 1;
          else 
	    x(i) = w*(b(i) - soma)/A(i,i) + (1.-w)*x0(i);
          endif
        endfor
        if( diag_nula == 1 ) 
        iter = nmaxiter + 1;
        else
          iter = iter + 1;
          norm_res  = norm((b-A*x),inf); 
          res(iter) = norm_res;   
          err = norm(x - x0,inf);
          x0 = x;	 
        endif   
     endwhile;
endfunction;
            
     

           
