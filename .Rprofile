.First = function() {
    ### set locales
    Sys.setlocale("LC_MESSAGES", "en_US.UTF-8")
    Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
    cores = as.integer(Sys.getenv("NCPUS", parallel::detectCores()))

    options(
        menu.graphics = FALSE,
        repos = c(CRAN = "http://bioconductor.statistik.tu-dortmund.de/cran/"),
        BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de",
        browserNLdisabled = TRUE,
        rt.maintainer = "Michel Lang <michellang@gmail.com>",
        mc.cores = cores,
        Ncpus = cores,
        deparse.max.lines = 2
    )

    lib = Sys.getenv("R_LIBS_USER")
    if (nzchar(lib)) {
        if (!file.exists(lib)) {
            message("Creating empty user lib directory ", lib)
            dir.create(lib, recursive = TRUE)
        }
    } else {
        message("No user lib")
    }

    options(devtools.revdep.libpath = "~/revdep-lib")
    if (file.exists("~/.R/local"))
        source("~/.R/local")
}

if(interactive()) {
    suppressMessages(require("microbenchmark"))

    requireNamespace("utils")
    utils::rc.settings(ipck = TRUE)
    message("R history enabled")
    try(utils::loadhistory("~/.Rhistory"))
    .Last <<- function() try(utils::savehistory("~/.Rhistory"))
}

# vim: ft=r
