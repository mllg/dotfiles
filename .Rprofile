.First = function() {
  repos = getOption("repos")
  repos[["CRAN"]] = "http://bioconductor.statistik.tu-dortmund.de/cran/"
  cores = Sys.getenv("NCPUS", parallel::detectCores())
  user.lib = Sys.getenv("R_LIBS_USER")

  options(
    menu.graphics = FALSE,
    useFancyQuotes = FALSE,
    mc.cores = cores,
    Ncpus = cores,
    # max.print = 10000,
    repos = repos,
    datatable.print.class = TRUE,
    BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de",
    rt.maintainer = "Michel Lang <michellang@gmail.com>"
  )

  Sys.setenv(LANGUAGE = "en")
  Sys.setlocale("LC_ALL", "en_US.UTF-8")

  if (nzchar(user.lib)) {
    user.lib = normalizePath(user.lib, mustWork = FALSE)
    if (!dir.exists(user.lib)) {
      message("Creating empty user library ", user.lib)
      dir.create(user.lib, recursive = TRUE)
      .libPaths(user.lib)
    }
  }

  if (interactive()) {
    pkgs = "data.table"
    for (pkg in pkgs) {
      if (suppressPackageStartupMessages(!require("data.table", character.only = TRUE, quietly = TRUE)))
        message(sprintf("Package '%s' not installed", pkg))
    }

    hist = Sys.getenv("R_HISTFILE", "~/.Rhistory")
    if (!dir.exists(dirname(hist)))
      dir.create(dirname(hist), recursive = TRUE)
    ok = try(utils::loadhistory(hist))
    if (!inherits(ok, "try-error"))
      .Last <- function() try(utils::savehistory(Sys.getenv("R_HISTFILE", "~/.Rhistory")))

    utils::rc.settings(ipck = TRUE)

    ee = new.env()
    if ("data.table" %in% loadedNamespaces()) {
      ee$print.data.frame = function(x, ...) {
        data.table:::print.data.table(x)
      }
    }
    attach(ee, warn.conflicts = FALSE)
  }

  fns = c("~/.R/local", "~/.Rprofile.local")
  lapply(fns[file.exists(fns)], sys.source, envir = .GlobalEnv)
}

# vim: ft=r
