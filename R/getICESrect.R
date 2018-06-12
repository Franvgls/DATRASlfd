#' Includes ICESrect in an HH file with lat and long data
#'
#' Function to complete HH with ICESrect and area
#' @param Survey The survey to download of getting HH data from DATRAS
#' @param years The year or years to be downloaded, only used if is.na(HHobj)
#' @param latname NA or name in lowercase of the colum that has the latitude decimal degrees data default is lat and if that's the case will found by the function, otherwise has to be specified
#' @param longname NA or name in lowercase of the colum that has the latitude decimal degrees data default is long and will be found, otherwise specify the name
#' @param inclArea if T (default) includes the ICES Area in HHobj
#' @return A data.table with HHobj variables, ICESrect and ICESarea if T
#' @examples # getICESrect(icesDatras::getHHdata("SP-NORTH",2015,4),latname="haullat",longname="haullong")
#' @export
getICESrect<-function(Survey="SP-PORC",years=c(2016:2017),quarter=3,latname=0,longname=0,inclArea=T,inclSrec=T) {
  DB<-data.table::as.data.table(icesDatras::getDATRAS("HH",Survey,years,quarter))
  #names(DB)<-tolower(names(DB))
  if (length(grep("StatRec",names(DB)))==0 | inclSrec) {
  if (latname==0) latname=grep("ShootLat",names(DB))
  if (longname==0) longname=grep("ShootLong",names(DB))
  DB$rectlong<-cut(DB$ShootLong,breaks=seq(from=-30,to=40,by=1),labels=lebels) # ,"D9","D8"
  DB$rectlat<-cut(DB$ShootLat,breaks=seq(from=36.0,to=71,by=.5),labels=formatC(c(1:70),flag=0,width=2))
  DB$StatRec<-paste0(DB$rectlat,DB$rectlong)
  DB$rectlat <- NULL
  DB$rectlong <- NULL
  }
  DB$icesSub<-Area[match(DB$StatRec,Area$ICESNAME),"Area_27"]
  DB
  }


