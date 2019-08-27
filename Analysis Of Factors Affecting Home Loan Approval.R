getwd()
setwd("C:/Users/Priyanka/Desktop/priR")
frog<-read.csv("C:/Users/Priyanka/Desktop/dataproject.csv",header = T)
frog
dim(frog)
ncol(frog)
View(frog)
head(frog)
anyDuplicated(frog)
colnames(frog)
frog[!complete.cases(frog),]
frog[is.na(frog)] <- 0
frog[!complete.cases(frog),]
sapply(frog,class)
#Q1.Find Sex Ratio for each Country, State, Districts(ie for all rows ), 
#+ append it as a new column in data frame(frog)
frog$SexRatio<-frog$Population_Males/frog$Population_Females
colnames(frog)
#Q2. Find the set of data frame for which Sex Ratio is below 1?
frogrural.sub <- subset(frog, SexRatio < 1)
frogrural.sub
View(frogrural.sub)
summary(frog)
state.sub <- subset(frog, India_State_District =="STATE")
View(state.sub)
library(ggplot2)
library(ggthemes)

#Q3
ggplot(aes(x=reorder(Name,-SexRatio),y=SexRatio) ,data=state.sub)+ 
  geom_bar(stat="identity",width = 0.5,aes(fill=Name),colour="black")+
  ggtitle('SexRatio')+
  geom_text(aes(label=SexRatio,vjust=-0.1))+
  xlab('States')+
  ylab("SexRatio")+
  theme(plot.title = element_text(size = 12),
        axis.title = element_text(size = 12,face="bold"))

#Q4
ggplot(aes(x=reorder(Name,-No.of.Households),y=(No.of.Households)/1000),data=state.sub)+ 
  geom_bar(stat="identity",width = 0.5,aes(fill=Name),colour="black")+
  ggtitle('Household per State')+
  geom_text(aes(label=No.of.Households,vjust=-0.1))+
  xlab('State Names')+
  ylab("Household No.(/1000)")+
  theme(plot.title = element_text(size = 12),
        axis.title = element_text(size = 12,face="bold"))

Q5
ggplot(aes(x=reorder(Name,-AreaSQKM),y=(AreaSQKM)/1000),data=state.sub)+ 
  geom_bar(stat="identity",width = 0.5,aes(fill=Name),colour="black")+
  ggtitle('Area per square km by State')+
  geom_text(aes(label=Population_Males,vjust=-0.1))+
  xlab('State Names')+
  ylab("AreaSQKM(/1000)")+
  theme(plot.title = element_text(size = 12),
        axis.title = element_text(size = 12,face="bold"))













#Converting non-factors to factors for plotting

frog$State._Code=factor(frog$State._Code)      
frog$District_Code=factor(frog$District_Code)  
frog$InhabitedVillages=factor(frog$InhabitedVillages)
frog$UninhabitedVillages= factor(frog$UninhabitedVillages)        
frog$No.of.Towns= factor(frog$No.of.Towns)
frog$No.of.Households= factor(frog$No.of.Households)    
frog$Total_Population= factor(frog$Total_Population)   
frog$Population_Males=factor(frog$Population_Males)
frog$Population_Females= factor(frog$Population_Females)
frog$AreaSQKM= factor(frog$AreaSQKM)
frog$PopulationPSQKM= factor(frog$PopulationPSQKM)       
