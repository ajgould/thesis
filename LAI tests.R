LAItest<-regsubsets(PAR_LAI_mean~DEM+Stand_Density,data=bighornData,
                                           intercept=TRUE,method="exhaustive", nvmax =10, nbest =  3,)
LAItesting<-LAItest %>% 
  broom::tidy() 
view(LAItesting)


PARLAIglm<-lm(PAR_LAI_mean~ DEM+Stand_Density,
                         family=gaussian(link="log"),
                         data=bighornData)
summary(PARLAIglm)
AIC(mvPAR_Average_sd10m)
BIC(mvPAR_Average_sd10m) 