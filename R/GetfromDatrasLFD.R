#
#
#  library(icesDatras)
#  library(NeAtlIBTS)
#  HH=data.table(getDATRAS("HH","SP-PORC",2011:2017,3))
#  HL=data.table(getDATRAS("HL","SP-PORC",2011:2017,3))
#  HH=rbind(HH,data.table(getDATRAS("HH","SP-NORTH",2011:2017,4)))
#  HL=rbind(HL,data.table(getDATRAS("HL","SP-NORTH",2011:2017,4)))
#  HH=rbind(HH,data.table(getDATRAS("HH","IE-IGFS",2011:2017,4)))
#  HLi=data.table(getDATRAS("HL","IE-IGFS",2016,4))
#  nrow(HLi)
#  HLi=rbind(HLi,data.table(getDATRAS("HL","SP-PORC",2016,3)))
#
# HL<-getDATRAS("HL","SP-PORC",2016,3)
# HL<-rbind(HL,getDATRAS("HL","IE-IGFS",2016,4))
# HL<-HL[HL$Valid_Aphia=="127146",]
# nHL<-setdiff(colnames(HL), "LngtClass")
# HLb<-HL[HL$LngtCode==".",.(LngtClass=trunc(LngtClass/10,0),LngtCode="1"),by=nHL]
#
#
#   HL$HaulVal<-HH$HaulVal[match(HL$StNo,HH$StNo)]
#  HL$HaulDur<-HH$HaulDur[match(HL$StNo,HH$StNo)]
#  HL[HL$LngtCode==".",.(LngtClass=trunc(LngtClass/10,0),LngtCode="1"),by=nHL]  <-trunc(HL[LngtCode==".","LngtClass"]/10,0)
#  datexch17<-HL[HL$HaulVal=="V",]
# # #datexch17$Species <- species[match(datexch17[,"Valid_Aphia"],species$WoRMScode),"Code"]
# # #datexch17$Species<-as.factor(as.character(datexch17$Species))
# # #datexch17$SizeRange <- species[match(datexch17[,"Valid_Aphia"],species$WoRMScode),"LengthSplit"]
# # datexch17$CPUE_number_per_hour <- (datexch17$HLNoAtLngt* datexch17$SubFactor)* 60/datexch17$HaulDur   # *datexch17$TotalNo
# # datexch17<-datexch17[,.(NoMeas=sum(CPUE_number_per_hour)),by=.(Year,Survey,Ship,HaulNo,LngtClass)]
# # ggplot(data=datexch17,
# #        aes(x=LngtClass,y=NoMeas,color=Survey)) +
# #   ggtitle("Hake") +
# #   labs(y="% Number",x="Size (cm)",color="Survey") +
# #   facet_grid(~Year,scales="fixed") +
# #   geom_bar(stat="identity") + fill
# #   dumb<-dumb[,c("lance","esp","sexo","cate","NoMeas")]
# #
# # dumbtot<-aggregate(CPUE_number_per_hour~Year+Survey+Ship+HaulNo,dumb,sum)
# # colnames(dumbtot)[match("CPUE_number_per_hour",colnames(dumbtot))]<-c("Total")
# # if (is.na(species[match(i,species$Code),"LengthSplit"])) dattot<-data.frame(dumbtot[,1:4],SpeciesCode=i,Small=NA,Large=NA,Total=dumbtot[,5])
# # if (!is.na(species[match(i,species$Code),"LengthSplit"])) {
# #   dumbsm<-dumb[dumb$LngtClas<species[match(i,species$Code),"LengthSplit"]*10,]
# #   if (nrow(dumbsm)>0) {dumbsm<-aggregate(CPUE_number_per_hour~Year+Survey+Ship+HaulNo,dumbsm,sum)
# #   colnames(dumbsm)[match("CPUE_number_per_hour",colnames(dumbsm))]<-c("Small")
# #   }
# #   else dumbsm<-data.frame(Year=2017,Survey="IE-IGFS",Ship="CEXP",HaulNo=levels(as.factor(dumb$HaulNo)),Small=0) ; dumbsm$HaulNo<-as.character(dumbsm$HaulNo)
# #   dumblg<-dumb[dumb$LngtClas>=species[match(i,species$Code),"LengthSplit"]*10,]
# #   if (nrow(dumblg)>0) {dumblg<-aggregate(CPUE_number_per_hour~Year+Survey+Ship+HaulNo,dumblg,sum,na.rm=T)
# #   colnames(dumblg)[match("CPUE_number_per_hour",colnames(dumblg))]<-c("Large")
# #   }
# #   else dumblg<-data.frame(Year=2017,Survey="IE-IGFS",Ship="CEXP",HaulNo=levels(as.factor(dumb$HaulNo)),Large=0); dumblg$HaulNo<-as.character(dumblg$HaulNo)
# #   datsize<-merge(dumbsm,dumblg,all.x=T,all.y=T)
# #   dattot<-merge(datsize,dumbtot,all.x=T,all.y=T)
# #   dattot<-data.frame(dattot[,1:4],SpeciesCode=i,dattot[5:7])
# # } else dattot<-data.frame(dumbtot[,1:4],SpeciesCode=i,Small=NA,Large=NA,Total=dumbtot[,5])
# # #ifelse (is.na(species[match(i,species$Code),"LengthSplit"])) dattot<-data.frame(dumbtot[,1:6],Small=0,Large=0,dumbtot[,7])
# # dataIBTS.IGFS17<-dattot
# # for (i in levels(as.factor(as.character(species$Code)))[2:29]) {
# #   dumb<-datexch17[datexch17$Species==i,]
# #   if (nrow(dumb)==0)  next
# #   dumbtot<-aggregate(CPUE_number_per_hour~Year+Survey+Ship+HaulNo,dumb,sum)
# #   colnames(dumbtot)[match("CPUE_number_per_hour",colnames(dumbtot))]<-c("Total")
# #   if (is.na(species[match(i,species$Code),"LengthSplit"])) dattot<-data.frame(dumbtot[,1:4],SpeciesCode=i,Small=NA,Large=NA,Total=dumbtot[,5])
# #   else {
# #     dumbsm<-dumb[dumb$LngtClas<species[match(i,species$Code),"LengthSplit"]*10,]
# #     if (nrow(dumbsm)>0) {dumbsm<-aggregate(CPUE_number_per_hour~Year+Survey+Ship+HaulNo,dumbsm,sum)
# #     colnames(dumbsm)[match("CPUE_number_per_hour",colnames(dumbsm))]<-c("Small")
# #     }
# #     else dumbsm<-data.frame(Year=2017,Survey="IE-IGFS",
# #                             Ship="CEXP",HaulNo=levels(as.factor(dumb$HaulNo)),Small=0); dumbsm$HaulNo<-as.character(dumbsm$HaulNo)
# #                             dumblg<-dumb[dumb$LngtClas>=species[match(i,species$Code),"LengthSplit"]*10,]
# #                             if (nrow(dumblg)>0) {dumblg<-aggregate(CPUE_number_per_hour~Year+Survey+Ship+HaulNo,dumblg,sum,na.rm=T)
# #                             colnames(dumblg)[match("CPUE_number_per_hour",colnames(dumblg))]<-c("Large")
# #                             }
# #                             else dumblg<-data.frame(Year=2017,Survey="IE-IGFS",Ship="CEXP",
# #                                                     HaulNo=levels(as.factor(dumb$HaulNo)),Large=0); dumblg$HaulNo<-as.character(dumblg$HaulNo)
# #                             datsize<-merge(dumbsm,dumblg,all.x=T,all.y=T)
# #                             dattot<-merge(datsize,dumbtot,all.x=T,all.y=T)
# #                             dattot<-data.frame(dattot[,1:4],SpeciesCode=i,dattot[5:7])
# #   }
# #   dataIBTS.IGFS17<-rbind(dataIBTS.IGFS17,dattot)
# # }
# # dataIBTS.IGFS17<-merge(dataIBTS.IGFS17,HH[,c("HaulNo","ShootLat","ShootLong")],by="HaulNo")
# #
# # dataIBTS.IGFS17$Common_Name <- species[match(dataIBTS.IGFS17[,"SpeciesCode"],species$Code),"Common"]
# # dataIBTS.IGFS17$Length_Split <- species[match(dataIBTS.IGFS17[,"SpeciesCode"],species$Code),"LengthSplit"]
# # dataIBTS.IGFS17$time <- NA
# # dataIBTS.IGFS17<-dataIBTS.IGFS17[,c(3,10:9,13,2,1,4,5,11:12,8,6:7)]
# # dataIBTS.IGFS17
# # #write.csv(dataIBTS.IGFS17,"IBTSdataIGFS17_stot.csv",row.names=F)
# # #NeAtlIBTS::IBTSNeAtl_map(leg=F,dens=0,out="def")
# # #points(ShootLat~ShootLong,dataIBTS.IGFS17,cex=sqrt(dataIBTS.IGFS17[,"Total"]/(1)),subset=SpeciesCode=="COD",pch=21,bg=1,lwd=.5)
# #
# #
# # ScoWC.HH<-getDATRAS("HH","SCOWCGFS",c(2016,2017),4)
# # ScoWC.HL<-getDATRAS("HL","SCOWCGFS",c(2016,2017),4)
# #
# #
# # ScoRoc.HH<-getDATRAS("HH","SCOROC",c(2017),4)
# # NIGFS.HH<-getDATRAS("HH","NIGFS",c(2016,2017),4)
# # FRCGFS.HH<-getDATRAS("HH","FR-CGFS",c(2016,2017),4)
# # Porc.HH<-getDATRAS("HH","SP-PORC",c(2016,2017),3)
# # Evhoe.HH<-getDATRAS("HH","EVHOE",c(2016,2017),4)
# # North.HH<-getDATRAS("HH","SP-NORTH",c(2016,2017),4)
# # ARSA.HH<-getDATRAS("HH","SP-ARSA",c(2016:2017),4)
# # PTIBTS.HH<-getDATRAS("HH","PT-IBTS",c(2016:2017),4)
# # ScoWC.HL<-getDATRAS("HL","SCOWCGFS",c(2016,2017),4)
# # ScoRoc.HL<-getDATRAS("HL","SCOROC",c(2017),4)
# # NIGFS.HL<-getDATRAS("HL","NIGFS",c(2016,2017),4)
# # FRCGFS.HL<-getDATRAS("HL","FR-CGFS",c(2016,2017),4)
# # Porc.HL<-getDATRAS("HL","SP-PORC",c(2016,2017),3)
# # Evhoe.HL<-getDATRAS("HL","EVHOE",c(2016,2017),4)
# # North.HL<-getDATRAS("HL","SP-NORTH",c(2016,2017),4)
# # ARSA.HL<-getDATRAS("HL","SP-ARSA",c(2016:2017),4)
# #
#
#
# HHTT <- read.csv(url("https://datras.ices.dk/WebServices/DATRASWebService.asmx/getHHdata?survey=SP-PORC&year=2016&quarter=3")
# )
