ggplot(plots)+
  geom_point(mapping=aes(x=lon, y=lat, color=bighornDataNS$TRI)) +
  scale_color_viridis_b(option="turbo")+
  labs(x = "Longitude", y ="Latitude",
       title ="Topographic Roughness Index", color ="Roughness Index") +
  theme(plot.title = element_text(hjust = 0.5))


histogram(bighornData$TRI,
          main="Histogram for Topographic Roughness Index Across Plots", 
          xlab="Topographic Roughness", 
          border="white", 
          col="#013220")
#hist(bighornDataNS$DEM)


###########################
histogram(bighornDataNS$DEM,
          main="Histogram for Elevation Across Plots", 
          xlab="Elevation in Meters", 
          ylab= "Percent of Total Plots",
          border="white", 
          col = "#182837")

###########################
histogram(Merged_With_TreeHeightsandAge$Max_Tree_Height,
          main="Histogram for Maximum Tree Heights Across Plots", 
          xlab="Height in Meters", 
          border="white", 
          col = "#182837")

ggplot(data= Merged_With_TreeHeightsandAge, mapping=aes(x=Plot_Number, y=Max_Tree_Height, fill=Max_Tree_Height))+
  geom_bar(stat = "identity")+
  scale_fill_viridis_c(option="verdis")+
  labs(x = "Plot Number", y = "Maximum Tree Height in Meters", fill= "Tree Height in Meters", title ="Maximum Tree Height Across Plots")
spatial_div


###########################
histogram(bighornDataNS$Average_DBH,
          main="Histogram for Average Diameter at Breast Height Across Plots", 
          xlab="Diameter at Breast Height in Centimeters", 
          border="white", 
          col = "#182837")
        
###########################

histogram(bighornDataNS$Stand_Density,
          main="Stand Density Across Plots", 
          xlab="Number of Trees Per Plot", 
          border="white", 
          col = "#182837")


###########################
histogram(bighornDataNS$div,
          main="Diversity Across Plots", 
          xlab="Shannon Diversity", 
          border="white", 
          col = "#182837")


spatial_div<-ggplot(data= diversity, mapping=aes(x=Plot_Number, y=div, fill=div))+
  geom_bar(stat = "identity")+
  scale_fill_viridis_c(option="turbo")+
  labs(x = "Plot Number", y = "Diversity", title ="Species Diversity Across Plots")
spatial_div

###########################
histogram(bighornDataNS$slope,
          main="Slope Across Plots", 
          xlab="Slope Across Plots in Degrees", 
          ylab= "Percent of Total Plots",
          border="white", 
          col = "#182837")

###########################
histogram(bighornDataNS$lulc_reduced,
          main="Forest Type Across Plots", 
          xlab="Forest Type", 
          border="white", 
          col = "#182837")

###########################
histogram(bighornDataNS$Leaf_Angle_mean,
          main="Leaf Angle Across Plots", 
          xlab="Leaf Angle in Degrees", 
          border="white", 
          col = "#182837")

###########################
histogram(bighornDataNS$Gap_Fraction_mean,
          main="Gap Fraction Across Plots", 
          xlab="Gap Fraction", 
          border="white", 
          col = "#182837")

# lulc %>%
#   dplyr::select(lulc=V1, LULC_Name =ECOLSYS_LU...2)
# lulc_colors=data.frame(class=levels(lulc)[[1]]$class)
# 
# lulc_colors$col=c("#EBA998","#FFFB00", "#4080BF", "#989F60", "#AF5063", "#3200FF", "#A289A8", "#BE20DF", "#971452", "#6250AF" ,  "#8EB880", "#624074", "#A0B232", "#B232A0", "#FF00E8","#F1197C", "#7C2B4B", "#7C2B72", "#A0D092", "#D095DE", "#70808F", "#10D4EF", "#AF50A7", "#EF103D","#4F30CF", "#FFC300", "#BCFF00", "#00BBFF", "#2080DF", "#DF8E20", "#9A8A86", "#CF3050", "#708F75", "#8F708D", "#95BCDE",  "#8F8F70", "#FFCD00", "#EB98E1", "#543E6C", "#DFBA20", "#FF9300", "#00FF43", "#B25932", "#B2327F", "#543B1B", "#1B543B", "#1B3D54", "#805C73", "#B62B85", "#F119B2", "#F18E19", "#591AAF", "#E0FF00", "#E0FF90")
# 
# lulc_reduced_plot<-rasterVis::gplot(bighornDataNS$lulc_reduced)+
#   geom_raster(aes(fill=as.factor(value)))+
#   scale_fill_manual(labels=lulc_colors$class,
#                     values=lulc_colors$col,
#                     name="Landcover Type")+
#   coord_equal()+
#   theme(legend.position = "bottom", legend.key.size=unit(.5, "line"), legend.text=element_text(size=8))+
#   guides(fill=guide_legend(ncol=3,byrow=TRUE))
# 



lulcplot