#' Includes ICESrect in an HH file with lat and long data
#'
#' Function to complete HH with ICESrect and area
#' @param HHobj A data.frame or data.table with lat long data but not icesRect if NA it takes HH data from DATRAS
#' @param Survey The survey to download of getting HH data from DATRAS
#' @param years The year or years to be downloaded, only used if is.na(HHobj)
#' @param latname name of the colum that has the latitude decimal degrees data default is lat and if that's the case will found by the function, otherwise has to be specified
#' @param longname name of the colum that has the latitude decimal degrees data default is long and will be found, otherwise specify the name
#' @param inclArea if T (default) includes the ICES Area in HHobj
#' @return A data.table with HHobj variables, ICESrect and ICESarea if T
#' @examples # getICESrect(icesDatras::getHHdata("SP-NORTH",2015,4),latname="haullat",longname="haullong")
#' @export
getICESrect<-function(HHobj=NA,Survey="SP-PORC",years=c(2011:2017),quarter=3,latname=0,longname=0,inclArea=T) {
  lebels=c(paste0("C",0:9),paste0("D",0:9),paste0("E",0:9),paste0("F",0:9),paste0("F",0:9),paste0("G",0:9),paste0("H",0:9))
  if (is.na(HHobj)) DB<-data.table::as.data.table(icesDatras::getDATRAS("HH",Survey,years,quarter))
  else DB<-HHobj
  names(DB)<-tolower(names(DB))
  if (grep("statrec",names(DAT))==0) {
  if (latname==0) latname=grep("shootlat",names(DB))
  if (longname==0) longname=grep("shootlong",names(DB))
  DB$rectlong<-cut(DB[,longname],breaks=seq(from=-30,to=40,by=1),labels=lebels) # ,"D9","D8"
  DB$rectlat<-cut(DB[,latname],breaks=seq(from=36.0,to=71,by=.5),labels=formatC(c(1:70),flag=0,width=2))
  DB$statrec<-paste0(DB$rectlat,DB$rectlong)
  }
  DB$icesSub<-Area[match(DB[,"statrec"],Area$ICESNAME),"Area_27"]
  DB
  }


