############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : ....

##########################################################################
########################### Fonction utiles ##############################
##########################################################################


library(tidyverse)

#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################
#install.packages("readxl")
library("readxl")
Sites <- read_excel("Sites.xlsx")
Microorga <- read_excel("Microorganismes.xlsx")
Nematodes <- read_excel("Nematodes.xlsx")
Vers <- read_excel("Lombrics.xlsx")


##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########

left_join(Sites,Vers, by="ID")
right_join(Sites,Vers, by="ID")
inner_join(Sites,Vers, by="ID")
d<-inner_join(Sites,Microorga, by = "ID")

Sites %>% inner_join(.,Microorga,by = "ID") %>%
  inner_join(.,Nematodes,by = "ID") %>% 
  inner_join(.,Vers,by = "ID")-> total
  

view(total)
#####################################view()##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########
total %>%
  filter(SITE == "Feucherolles") %>%
  select(SITE: REPET_BLOC,ARGILE,contains("SABLE"), ends_with("MIN"),PHYTO:CARNI)->
  total_Feucherolles
view(total_Feucherolles)

##########################################################################
####################### Créer des variables ##################
##########################################################################
total_Feucherolles %>%
  mutate(Pphyto=100*(PHYTO/rowSums(across(c(PHYTO:CARNI)))))->
  total_Feucherolles_2

view(total_Feucherolles_2)
##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######
total_Feucherolles_2 %>%
  group_by(MODALITE_DESCR) %>%
  summarise(mean_pp= mean(Pphyto), sd_pp= sd(Pphyto))->total_Feucherolles_3
view(total_Feucherolles_3)
##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités


##########################################################################
######################## Pivots ##########################################
##########################################################################
aa<-pivot_longer(total_Feucherolles_2,starts_with("SABLE_"), values_to = "amount")

view(aa)



##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

