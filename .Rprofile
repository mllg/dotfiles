.First = function() {
  repos = getOption("repos")
  repos[["CRAN"]] = "https://bioconductor.statistik.tu-dortmund.de/cran/"
  Sys.setenv(TZ = "Europe/Berlin")
  cores = as.integer(Sys.getenv("NCPUS", parallel::detectCores()))

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
    # BioC_mirror = "https://bioconductor.statistik.tu-dortmund.de",
    rt.maintainer = "Michel Lang <michellang@gmail.com>",
    help_type = "html",
    usethis.full_name = "Michel Lang"
  )


  if (Sys.info()[["sysname"]] == "Darwin") {
      options(install.packages.check.source = "no", pkgType = "binary")
  } else {
      Sys.setenv(LANGUAGE = "en")
      Sys.setlocale("LC_ALL", "en_US.UTF-8")
      # Fix for wrong DPI if second monitor is connected
      # setHook(packageEvent("grDevices", "onLoad"),
      #        function(...) grDevices::quartz.options(dpi = 96))
  }

  user.lib = Sys.getenv("R_LIBS_USER")
  if (!dir.exists(user.lib)) {
    message("Creating empty user library ", user.lib)
    dir.create(user.lib, recursive = TRUE)
  }

  if (interactive()) {
    pkgs = c("data.table")
    for (pkg in pkgs) {
      if (length(find.package(pkg, quiet = TRUE)))
        library(pkg, character.only = TRUE)
    }

    hist = normalizePath("~/.Rhistory", mustWork = FALSE)
    if (!dir.exists(dirname(hist)))
      dir.create(dirname(hist), recursive = TRUE)

    ok = try(utils::loadhistory(hist))
    if (inherits(ok, "try-error")) {
      message("History could not be loaded: ", hist)
    } else {
      message("Loaded history: ", hist)
      assign(".Last", function() try(utils::savehistory(hist)), envir = .GlobalEnv)
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
      requireNamespace("withr")

      withr::local_options(list(datatable.verbose = FALSE))
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

    ee$pkgdeps = function(pkg) {
      requireNamespace("pkgdepends")
      x = pkgdepends::new_pkg_deps(pkg)
      x$solve()
      x$draw()
    }

    ee$on_change = function(path, fun) {
        path = normalizePath(path)
        before = fileSnapshot(path)
        fun(path, rownames(before$info))
        repeat {
            Sys.sleep(1)
            changed = changedFiles(before, after)$changes
        after = fileSnapshot(path)
            files = rownames(changed)[apply(changed, 1, any)]
            fun(path, files)
            before = after
        }
    }

    # ee$build_vignettes = function() {
    #     requireNamespace("rprojroot")
    #     root = rprojroot::find_root(rprojroot::is_r_package)
    #     on_change(file.path(root, "vignettes"), function(path, files) if (length(files)) pkgdown::build_articles(root, lazy = TRUE, preview = FALSE))
    # }

    ee$revert_to_cran = function() {
      inst = unname(installed.packages()[, "Package"])
      avail = unname(available.packages()[, "Package"])

      remotes = sapply(inst, function(pkg) {
        desc = tryCatch(utils::packageDescription(pkg),
          error = function(e) NA,
          warning = function(e) NA
        )

        if (identical(desc, NA) || is.null(desc$RemoteType)) {
          return("cran")
        }

        desc$RemoteType
        })

      remotes = names(remotes[remotes != "cran"])
      remotes = intersect(remotes, avail)
      message(sprintf("Installing %i packages: %s", length(remotes), paste0(remotes, collapse = ", ")))
      install.packages(remotes)
    }

    attach(ee, warn.conflicts = FALSE)
  }

  if (requireNamespace("rlang", quietly = TRUE)) {
      options(error = rlang::entrace, rlang_backtrace_on_error = "branch")
  }

  fns = c("~/.R/local", "~/.Rprofile.local")
  lapply(fns[file.exists(fns)], sys.source, envir = .GlobalEnv)
}

# vim: ft=r
