#'@title What the function does (title at top of function help)
#'
#'@description A description of the function
#'Runs as shiny app
#'
#'@usage 
#'Define the parameters within the arguments
#'run_my_app(app_name,...)
#'
#'@param app_name Character string for a directory in this package
#'@param ... Additional options passed to shinyAppDir
#'
#'@return A printed shiny app
#'
#'@importFrom shiny shinyAppDir
#'@import dplyr
#'
#'@examples
#'\dontrun{ run_my_app('myfirstapp')}
#'

run_my_app <- function(app_name,...){
  
  app_dir <- system.file('apps',app_name,package='Boots')
  
  shiny::shinyAppDir(appDir=app_dir, options=list(...))
}

