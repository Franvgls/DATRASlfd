#' ICES Standard Rectangles and ICES Areas relationship
#'
#' ICEs rectangles provide a grid (StatRecs) used since early 1970's to document data
#' between latitudes 36ºN and 85º30N and longitudes between 44ºW and 68.30'E.
#' Latitudinal rows have an interval of 30' (half degree) are numbered (two dígits)
#' from 01 to 99 starting from 36º00'N northwards up to 85º30' N.
#' Longitude columns with 1º intervals are coded with an alphanumeric system starting with
#' A0 on the west oeste (44º00 W') up to M8 on the east (68º30E), note letter I is excluded.
#' Rectangles are nominated by the combination of rows and columns, southwesternmost corner
#' of the griod is 01B1. Detailed information on ICES rectangles can be found on the web
#' (http://www.ices.dk/marine-data/maps/Pages/ICES-statistical-rectangles.aspx)
#' This data set come from the ICES GIS and contains two variables
#'
#' @format. A data frame with 6256 obs. of 2 variables:
#' \itemize{
#'   \item ICESNAME: Name of the ICES rectangle
#'   \item Area_27: ICES area the rectangle belongs to
#' }
"Area"
