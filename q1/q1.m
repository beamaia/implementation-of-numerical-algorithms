load matrizes/bcsstk01.mat;
bcsstk01 = Problem.A;

load matrizes/plat362.mat;
plat362 = Problem.A;

load matrizes/bcsstk15.mat;
bcsstk15 = Problem.A;

###########  questão 2.a  ###########

size_bcsstk01 = rows(bcsstk01)
eNorm_bcsstk01 = norm(bcsstk01, 2)
numCond_bcsstk01 = cond(bcsstk01)
printf("\n")

size_plat362 = rows(plat362)
eNorm_plat362 = norm(plat362, 2)
numCond_plat362 = cond(plat362)
printf("\n")

size_bcsstk15 = rows(bcsstk15)
eNorm_bcsstk15 = norm(bcsstk15, 2)
numCond_bcsstk15 = cond(bcsstk15)
printf("\n")

###########  questão 2.b  ###########
[L,U,P,Q] = lu(bcsstk01);

# spy(bcsstk01)
# spy(L)
# spy(U)
nnzL_bcsstk01 = nnz(L)
nnzU_bcsstk01 = nnz(U)
nnz_bcsstk01 = nnz(bcsstk01)
printf("A matriz U apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", rows(U),rows(U)^2, nnzU_bcsstk01, nnzU_bcsstk01/rows(U)^2*100)
printf("A matriz L apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", rows(L),rows(L)^2, nnzL_bcsstk01, nnzL_bcsstk01/rows(L)^2*100)
printf("A matriz bcsstk01 apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", size_bcsstk01,size_bcsstk01^2, nnz_bcsstk01, nnz_bcsstk01/size_bcsstk01^2*100)
printf("\n")

[L,U,P,Q] = lu(plat362);
# spy(plat362)
# spy(L)
# spy(U)
nnzL_plat362 = nnz(L)
nnzU_plat362 = nnz(U)
nnz_plat362 = nnz(plat362)
printf("A matriz U apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", rows(U),rows(U)^2, nnzU_plat362, nnzU_plat362/rows(U)^2*100)
printf("A matriz L apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", rows(L),rows(L)^2, nnzL_plat362, nnzL_plat362/rows(L)^2*100)
printf("A matriz plat362 apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", size_plat362,size_plat362^2, nnz_plat362, nnz_plat362/size_plat362^2*100)
printf("\n")

[L,U,P,Q] = lu(bcsstk15);
# spy(bcsstk15)
# spy(L)
# spy(U)
nnzL_bcsstk15 = nnz(L)
nnzU_bcsstk15 = nnz(U)
nnz_bcsstk15 = nnz(bcsstk15)
printf("A matriz U apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", rows(U),rows(U)^2, nnzU_bcsstk15, nnzU_bcsstk15/rows(U)^2*100)
printf("A matriz L apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", rows(L),rows(L)^2, nnzL_bcsstk15, nnzL_bcsstk15/rows(L)^2*100)
printf("A matriz bcsstk15 apresenta %d linhas/colunas, %d posições e %d valores nulos. %.2f %% dos valores são nulos.\n", size_bcsstk15,size_bcsstk15^2, nnz_bcsstk15, nnz_bcsstk15/size_bcsstk15^2*100)
printf("\n")


###########  questão 2.c  ###########
taxaP_bcsstk01 = 100 - (nnz_bcsstk01 / (nnzL_bcsstk01 + nnzU_bcsstk01)) * 100
printf("\n")

taxaP_plat362 = 100 - (nnz_plat362 / (nnzL_plat362 + nnzU_plat362)) * 100
printf("\n")

taxaP_bcsstk15 = 100 - (nnz_bcsstk15 / (nnzL_bcsstk15 + nnzU_bcsstk15)) * 100
printf("\n")

###########  questão 2.d  ###########
b_bcsstk01 = bcsstk01 * ones(size_bcsstk01, 1);
x_bcsstk01 = bcsstk01 \ b_bcsstk01;
errNorm_bcsstk01 = norm(ones(size_bcsstk01, 1) - x_bcsstk01, inf)
resNorm_bcsstk01 = norm(b_bcsstk01 - bcsstk01 * x_bcsstk01, inf)
printf("\n")

b_plat362 = plat362 * ones(size_plat362, 1);
x_plat362 = plat362 \ b_plat362;
errNorm_plat362 = norm(ones(size_plat362, 1) - x_plat362, inf)
resNorm_plat362 = norm(b_plat362 - plat362 * x_plat362, inf)
printf("\n")

b_bcsstk15 = bcsstk15 * ones(size_bcsstk15, 1);
x_bcsstk15 = bcsstk15 \ b_bcsstk15;
errNorm_bcsstk15 = norm(ones(size_bcsstk15, 1) - x_bcsstk15, inf)
resNorm_bcsstk15 = norm(b_bcsstk15 - bcsstk15 * x_bcsstk15, inf)
printf("\n")