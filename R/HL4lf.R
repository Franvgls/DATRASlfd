#' Prepares HL data from DATRAS to plot lfd (per ices area)
#'
#' Function to complete HL with HH information to have it ready to plot the lfd
#' @param Esp The species selected to be downloaded if NA takes all the species
#' @param Espf The format of the Esp Code, can be FAO,Aph,Sci,
#' @param Survey The survey to download of getting HL and HL data from DATRAS
#' @param years The year or years to be downloaded
#' @param towdur 60 effort considered, by default weight trawling time to 60 min
#' @return A data.table with HL variables weighted to get lfds per towdur and including information on ICESrect and ICESarea if T
#' @examples # HLflf(Esp="MEG",Espf="FAO",Survey="SP-PORC",years=c(2011:2017),quarter=3,towdur=60)
#' @export
HL4lf<-function(Esp="MEG",Espf="FAO",Survey="SP-PORC",years=c(2011:2017),quarter=3,towdur=60) {
  HLDB<-data.table::as.data.table(icesDatras::getDATRAS("HL",Survey,years,quarter))
  HHDB<-getICESrect(Survey = Survey,years = years,quarter=quarter,inclArea = T)
  if (!is.na(Esp)) {
    HLDB<-switch(Espf,
               "FAO" = subset(HLDB,Valid_Aphia==speciesAB$aphia[speciesAB$X3A_CODE==Esp & !is.na(speciesAB$X3A_CODE)]),
               "sci" = subset(HLDB,Valid_Aphia==speciesAB$aphia[speciesAB$Species==Esp & !is.na(speciesAB$Species)]))
  }
  if (any(HLDB$LngtCode==".")) {
    HLDB$LngtClass[HLDB$LngtCode=="."]<-trunc(HLDB[HLDB$LngtCode==".",]$LngtClass/10,0)
    HLDB$LngtCode[HLDB$LngtCode=="."]<-"1"
    }
  HLDB$HaulVal<-HHDB$HaulVal[match(HLDB$StNo,HHDB$StNo)]
  HLDB$HaulDur<-HHDB$HaulDur[match(HLDB$StNo,HHDB$StNo)]
  datexch<-HLDB[HLDB$HaulVal=="V",]
  datexch$CPUE_number_per_hour <- (datexch$HLNoAtLngt* datexch$SubFactor)* towdur/datexch$HaulDur
  HHL<-merge(datexch,HHDB[,c("Survey","StNo","HaulNo","icesSub","StatRec","Year")],by=c("Survey","Year","HaulNo"))
  HHL
  }
