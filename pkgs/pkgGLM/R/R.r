#' Simple package to build a GML classifier for the Bank sales data.
#'
#' @return Saved model file
#' @export fn_glm
#'
#' @examples fn_glm()
fn_glm <- function(){

  data <- myUtils::load_data_raw()
  train_data <- data[[1]]
  test_data <- data[[2]]

  # Build a GLM classification model
  features <- names(train_data)[!names(train_data) %in% "y"]

  features.form <- paste(features, collapse = '+')
  model <- glm(as.formula(paste( 'y ~',features.form, collapse = ' ')), data = train_data ,family = binomial())

  # Save the model to the project data folder
  path_vector <- strsplit(getwd(),split='/')
  pos <- match('BankSales',path_vector[[1]])
  proj_home <- paste(path_vector[[1]][1:pos],collapse = '/')

  model_file = paste(proj_home,'/pkgs/pkgGLM/data/model_glm.rds',sep='')
  saveRDS(model, file = model_file)

}
