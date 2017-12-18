.First = function() {
  repos = getOption("repos")
  repos[["CRAN"]] = "https://bioconductor.statistik.tu-dortmund.de/cran/"
  Sys.setenv(TZ = "Europe/Berlin")
  cores = Sys.getenv("NCPUS", parallel::detectCores())
  user.lib = Sys.getenv("R_LIBS_USER")

  options(
    menu.graphics = FALSE,
    useFancyQuotes = FALSE,
    mc.cores = cores,
    Ncpus = cores,
    mlrng.debug = TRUE,
    setWidthOnResize = TRUE,
    max.print = 10000,
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
    ee$info = function(x) {
      requireNamespace("crayon", quietly = TRUE)
      header = crayon::combine_styles(crayon::bold, crayon::green)
      cat(header("Internal:"), "\n", sep = "")
      .Internal(inspect(x))
      if (!is.function(x)) {
        m = methods(class = class(x))
        tab = attr(m, "info")
        if (nrow(tab) > 0L) {
          cat("\n", header(paste0("Generics for `", class(x), "`:")), "\n", sep = "")
          cat(paste(tab$generic, collapse = ", "), "\n")
        }
      }
      cat("\n", header("Structure:"), "\n", sep = "")
      str(x)

      cat("\n", header("Size:"), "\n", sep = "")
      print(object.size(x), units = "auto")

      invisible(x)
    }

    ee$mb = function(...) {
      requireNamespace("microbenchmark")
      microbenchmark::microbenchmark(...)
    }

    ee$private = function(x) {
      requireNamespace("R6")
      if (!R6::is.R6(x))
        stop(paste(deparse(substitute(x)), "is not an R6 class"))
      x$.__enclos_env__[["private"]]
    }

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
