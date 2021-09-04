load matrizes/bcsstk01.mat;
bcsstk01 = Problem.A;

load matrizes/plat362.mat;
plat362 = Problem.A;

load matrizes/bcsstk15.mat;
bcsstk15 = Problem.A;

###########  questão 2.a  ###########

size_bcsstk01 = length(bcsstk01)
eNorm_bcsstk01 = norm(bcsstk01, 2)
numCond_bcsstk01 = cond(bcsstk01)
printf("\n")

size_plat362 = length(plat362)
eNorm_plat362 = norm(plat362, 2)
numCond_plat362 = cond(plat362)
printf("\n")

size_bcsstk15 = length(bcsstk15)
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
printf("\n")

[L,U,P,Q] = lu(plat362);
# spy(plat362)
# spy(L)
# spy(U)
nnzL_plat362 = nnz(L)
nnzU_plat362 = nnz(U)
nnz_plat362 = nnz(plat362)
printf("\n")

[L,U,P,Q] = lu(bcsstk15);
# spy(bcsstk15)
# spy(L)
# spy(U)
nnzL_bcsstk15 = nnz(L)
nnzU_bcsstk15 = nnz(U)
nnz_bcsstk15 = nnz(bcsstk15)
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