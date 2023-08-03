# D58leuFR
args = commandArgs(trailingOnly=TRUE)

library(SPARK)
loc_path <- sprintf("../../output/locations/%s.csv", args[1])

cal_sparkX <- function(in_path, out_path) {
    df <- t(subset(read.csv(in_path), select = -c(X)))
    loc = read.csv(loc_path)
    rownames(loc) <- colnames(df)
    sp_res <- sparkx(df, loc, numCores=10, option='mixture')
    write.csv(sp_res$res_mtest, out_path)
}

# in_prefix <- "../../output/melanomaext_singlecell_"
in_prefix <- sprintf("../../output/%s_%s_", args[1], args[1])

# methods <- c("transImpute", "transImpSpa", "transImpCls", "transImpClsSpa", "spaGE", "stPlus", "Tangram", "truth")
methods <- c('truth', 'stPlus', 'spaGE', 'Tangram', 'TransImpLR', 'TransImpSpa', 'TransImpCls', 'TransImpClsSpa')
for (mt in methods){
    print(mt)
    in_path <- paste0(in_prefix, mt, '.csv')
    set.seed(42)
    out_path <- paste0(sprintf("../../output/sparkx_%s_", args[1]), mt, ".csv")
    cal_sparkX(in_path, out_path)
}