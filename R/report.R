#' Generate sample analysis report.
#'
#' @param input_directory Location of input files
#' @param results_directory Location of simulation results
#' @param output_file Name of the output file to generate
#' @param focus_scenario_ids IDs of scenarios of special interest
#' @param ... Any other parameters to pass straight to \code{rmarkdown::render}
#' @return Default return values of the \code{rmarkdown::render} function.
#' @export
generate_report <- function(input_directory = "~/data",
                            results_directory = "~/results",
                            output_file = "risk_report.html",
                            focus_scenario_ids = c(51, 12), ...) {
  if (!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Install the rmarkdown package to generate reports.")
  }
  rmarkdown::render(system.file("rmd", "analyze_risk.Rmd", package = "evaluator"),
                    output_file = output_file,
                    params = list(input_directory = input_directory,
                                  results_directory = results_directory,
                                  focus_scenario_ids = focus_scenario_ids), ...)
}

#' Launch the Scenario Explorer web application.
#'
#' @param input_directory Location of input files
#' @param results_directory Location of simulation results
#' @import dplyr
#' @import ggplot2
#' @return Invisible NULL
#' @export
explore_scenarios <- function(input_directory = "data",
                              results_directory = "results") {
  if (!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Install the rmarkdown package to generate reports.")
  }
  if (!requireNamespace("shiny", quietly = TRUE)) {
    stop("shiny is required to run the Scenario Explorer.")
  }
  if (!requireNamespace("DT", quietly = TRUE)) {
    stop("DT is required to run the Scenario Explorer.")
  }
  if (!requireNamespace("modeest", quietly = TRUE)) {
    stop("modeest is required to run the Scenario Explorer.")
  }
  if (!requireNamespace("flexdashboard", quietly = TRUE)) {
    stop("flexdashboard is required to run the Scenario Explorer.")
  }
  rmarkdown::run(system.file("rmd", "explore_scenarios.Rmd", package = "evaluator"),
                 #dir = file.path(basename(system.file("rmd", "explore_scenarios.Rmd", package = "evaluator")), ".."),
                 render_args = list(
                   params = list(input_directory = input_directory,
                               results_directory = results_directory)))
  invisible(NULL)
}

#' Launch OpenFAIR demonstration web application.
#'
#' @return Invisible NULL
#' @export
openfair_example <- function() {
  if (!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Install the rmarkdown package to generate reports.")
  }
  if (!requireNamespace("shiny", quietly = TRUE)) {
    stop("shiny is required to run the OpenFAIR demonstration application.")
  }
  rmarkdown::run(system.file("rmd", "openfair_example.Rmd",
                             package = "evaluator"))
  invisible(NULL)
}

#' Launch a single page summary risk dashboard.
#'
#' @param input_directory Location of input files
#' @param results_directory Location of simulation results
#' @param ... Any other parameters to pass straight to \code{rmarkdown::render}
#' @return Default return values of the \code{rmarkdown::render} function.
#' @export
risk_dashboard <- function(input_directory = "~/data",
                           results_directory = "~/results", ...) {
  if (!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Install the rmarkdown package to generate reports.")
  }
  if (!requireNamespace("flexdashboard", quietly = TRUE)) {
    stop("flexdashboard is required to generate the risk dashboard")
  }
  if (!requireNamespace("forcats", quietly = TRUE)) {
    stop("forcats is required to generate the risk dashboard")
  }
  rmarkdown::render(system.file("rmd", "risk_dashboard.Rmd", package = "evaluator"),
                    output_dir = getwd(),
                    params = list(input_directory = input_directory,
                                  results_directory = results_directory), ...)
}
