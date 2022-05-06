#showing distribution of y variables 

Y_var<-c("PAR_Average_mean"  ,
"Canopy_Density_mean",
"Leaf_Angle_mean"    ,
 "Gap_Fraction_sd"    ,    
 "PAR_Average_sd",
 "Canopy_Density_sd", 
 "Leaf_Angle_sd"    ,
 "Average_DBH"       , 
 "DBH_Sd"         ,
 "Stand_Density"   ,   
"div",
"Gap_Fraction_mean" ,
"PAR_LAI_mean",
"PAR_LAI_sd")


temp_bh<-pivot_longer(bighornData %>% as.data.frame() %>% dplyr::select(-geometry),
                      cols = Y_var,names_to = "y_var",values_to = "Val")

ggplot(data=temp_bh,aes(x=#logit
                          (Val)))+
  geom_density()+
  facet_wrap(~y_var,scales = "free")

# this is what hte link fucntion does= it apploies the log to the  prediction results so that the outcome is in the right format 
#transforms the predictors so that the observaations come out in the right distribution (Vs transformign the observation )


Yt_var<-c("Sd_Tree_Height",
          "Max_Tree_Height",
          "Min_Tree_Height" ,   
          "Average_Stand_Age")

temp_bht<-pivot_longer(bighornDataTreeHeightsAndAge %>% as.data.frame() %>% dplyr::select(-geometry),
                      cols = Yt_var,names_to = "y_var",values_to = "Val")

ggplot(data=temp_bht,aes(x=(Val)))+
  geom_density()+
  facet_wrap(~y_var,scales = "free")

##################################################################################

MV_Gap_Predict <-data.frame(real=NA,pred=NA)
for(i in 1:nrow(bighornData)){
  MV_Gap_Predict[i,] <- data.frame(
    real=bighornData %>% as.data.frame() %>% dplyr::select(-geometry) %>% .[i,"Gap_Fraction_sd"],
    pred=predict(object=MVGapFraction_sd_10m, newdata= bighornData %>% as.data.frame() %>% dplyr::select(-geometry) %>% .[i,c("DEM")],
                 type="response")[1]
  )
}

LmGap_Predict <-data.frame()
for(i in 1:nrow(bighornData)){
  LmGap_Predict[i,] <- data.frame(
    real=bighornData %>% as.data.frame() %>% dplyr::select(-geometry) %>% .[i,"Gap_Fraction_sd"],
    pred=predict(object=GapFraction_sd_10m, newdata=bighornData %>% as.data.frame() %>% dplyr::select(-geometry) %>% .[i,c("TRI", "tpi1000m","lulc_reduced")],
                 type="response")[1]
  )
}


ggplot(data=MV_Gap_Predict)+
  geom_point(aes(x=real,y=pred))+
  geom_smooth(aes(x=real,y=real,color="1:1"),method="lm")+
  geom_smooth(aes(x=real,y=pred,color="fit"),method="lm")

ggplot(data=LmGap_Predict)+
  geom_point(aes(x=real,y=pred))+
  geom_smooth(aes(x=real,y=real,color="1:1"),method="lm")+
  geom_smooth(aes(x=real,y=pred,color="fit"),method="lm")