
library(olsrr)
library(dplyr)

data_all <- preprocess_data_with_response(data, orderFactors = TRUE)

# M <- lm(
#   SalePriceLog ~ 
#     Fireplaces +
#     GarageArea_LOG +
#     KitchenQual_Num +
#     LotArea_LOG +
#     OverallCond +
#     OverallQual +
#     TotalAreaSF_SQ +
#     TotalBsmt_SQ +
#     TotalBaths +
#     FirstFloor_SQ +
#     WoodDeckSF +
#     YearBuilt +
#     YearRemodAdd +
#     QualityTotalSF:NeighborhoodClass_Num +
#     QualityTotalSF_LOG:NeighborhoodClass_Num +
#     BsmtFinSF1:NeighborhoodClass_Num +
#     TotalAreaSF_LOG_SQ:NeighborhoodClass_Num ,
#   
#   data = data_all
# )



M <- lm(SalePriceLog ~ ., data = data_all %>% select(-SalePrice))

r0 <- ols_step_forward_aic(M)

# r1 <- ols_step_both_aic(M)
# r2 <- ols_step_both_bic(M)
# r3 <- ols_step_both_adjr2(M)