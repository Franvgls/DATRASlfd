#' Includes ICESarea in an HH file with lat and long data
#'
#' Function to complete HH with ICESrect and area
#' @param survey the survey which data are going to be retrieved
#' @param years Years to be used
#' @param quarters the quarters to be used
#' @return A data.table with haul variables, ICESrect (if not present in the download) and ICESarea
#' @examples # getICESrect(icesDatras::getHHdata("SP-NORTH",2015,4),latname="haullat",longname="haullong")
#' @export
getICESarea<-function(survey,years,quarters,showWrong=F) {
  lebels=c(paste0("C",0:9),paste0("D",0:9),paste0("E",0:9),paste0("F",0:9),paste0("F",0:9),paste0("G",0:9),paste0("H",0:9))
  DB<-data.table::as.data.table(icesDatras::getDATRAS("HH",survey,years,quarters))
  #names(DB)<-tolower(names(DB))
  DB$rectlong<-cut(DB$ShootLong,breaks=seq(from=-30,to=40,by=1),labels=lebels) # ,"D9","D8"
  DB$rectlat<-cut(DB$ShootLat,breaks=seq(from=36.0,to=71,by=.5),labels=formatC(c(1:70),flag=0,width=2))
  DB$StatRecc<-paste0(DB$rectlat,DB$rectlong)
  DB$rectlat <- NULL
  DB$rectlong <- NULL
  DB$icesArea<-Area[match(DB$StatRec,Area$ICESNAME),"Area"]
  if (showWrong) {print(DB[DB$StatRec!=DB$StatRecb,c("StatRec","StatRecc")])}
  DB
  }


