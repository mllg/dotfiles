.First = function() {
  repos = getOption("repos")
  repos[["CRAN"]] = "https://bioconductor.statistik.tu-dortmund.de/cran/"
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
    pkgs = c("data.table", "devtools")
    for (pkg in pkgs) {
      if (suppressPackageStartupMessages(!require(pkg, character.only = TRUE, quietly = TRUE)))
        message(sprintf("Package '%s' not installed", pkg))
    }

    hist = normalizePath(Sys.getenv("R_HISTFILE", "~/.Rhistory"), mustWork = FALSE)
    if (!dir.exists(dirname(hist)))
      dir.create(dirname(hist), recursive = TRUE)

    ok = try(utils::loadhistory(hist))
    if (inherits(ok, "try-error")) {
      message("History could not be loaded: ", hist)
    } else {
      message("Loaded history: ", hist)
      .Last <<- function() try(utils::savehistory(hist))
    }

    utils::rc.settings(ipck = TRUE)

    ee = new.env()
    ee$os = function(x) pryr::object_size(x)

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
