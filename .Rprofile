.First = function() {
  repos = getOption("repos")
  repos[["CRAN"]] = "https://bioconductor.statistik.tu-dortmund.de/cran/"
  Sys.setenv(TZ = "Europe/Berlin")
  cores = Sys.getenv("NCPUS", parallel::detectCores())

  options(
    menu.graphics = FALSE,
    useFancyQuotes = FALSE,
    mc.cores = cores,
    Ncpus = cores,
    setWidthOnResize = TRUE,
    max.print = 10000,
    repos = repos,
    datatable.print.class = TRUE,
    datatable.print.keys = TRUE,
    BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de",
    rt.maintainer = "Michel Lang <michellang@gmail.com>"
  )

  Sys.setenv(LANGUAGE = "en")
  Sys.setlocale("LC_ALL", "en_US.UTF-8")

  if (Sys.info()[["sysname"]] == "Darwin") {
    # Fix for wrong DPI if second monitor is connected
    setHook(packageEvent("grDevices", "onLoad"),
      function(...) grDevices::quartz.options(dpi = 96))
  }

  v = paste(getRversion()[1L, 1:2], collapse = ".")
  user.lib = normalizePath(file.path("~", ".R", "library", v), mustWork = FALSE)
  if (!dir.exists(user.lib)) {
    message("Creating empty user library ", user.lib)
    dir.create(user.lib, recursive = TRUE)
  }
  .libPaths(user.lib)

  if (interactive()) {
    pkgs = c("data.table", "devtools", "gtfo")
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
    ee$inspect = function(x) {
      requireNamespace("crayon", quietly = TRUE)
      header = crayon::combine_styles(crayon::bold, crayon::green)
      cat(header("Internal:"), "\n", sep = "")
      .Internal(inspect(x))
      if (!is.function(x)) {
        classes = class(x)
        for (cl in classes) {
          m = methods(class = cl)
          tab = attr(m, "info")
          if (nrow(tab) > 0L) {
            cat("\n", header(paste0("Generics for `", cl, "`:")), "\n", sep = "")
            cat(paste(tab$generic, collapse = ", "), "\n")
          }
        }
      }
      cat("\n", header("Structure:"), "\n", sep = "")
      str(x)

      cat("\n", header("Size:"), "\n", sep = "")
      print(object.size(x), units = "auto")

      invisible(x)
    }

    ee$bm = function(..., plot = FALSE) {
      requireNamespace("bench")
      bm = bench::mark(...)
      if (plot)
          print(ggplot2::autoplot(bm))
      return(bm)
    }

    ee$private = function(x) {
      requireNamespace("R6")
      if (!R6::is.R6(x))
        stop(paste(deparse(substitute(x)), "is not an R6 class"))
      x$.__enclos_env__[["private"]]
    }

    ee$pkgdeps = function(repo, suggests = FALSE) {
      requireNamespace("pkgdepends")
      config = list()
      if (isTRUE(suggests))
        config$dependencies = TRUE
      r = pkgdepends::remotes$new(repo, config, lib = tempfile())
      r$solve()
      r$draw_tree()
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
