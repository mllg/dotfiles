### set locales
tmp = list()
tmp$lc_messages = Sys.setlocale("LC_MESSAGES", "en_US.UTF-8")
tmp$lc_ctype = Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
tmp$cores = as.integer(Sys.getenv("NCPUS", 1L))

options(
  menu.graphics = FALSE,
  repos = c(CRAN = "http://cloud.r-project.org/"),
  BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de",
  browserNLdisabled = TRUE,
  rt.maintainer = "Michel Lang <michellang@gmail.com>",
  mc.cores = tmp$cores,
  Ncpus = tmp$cores
)

tmp$lib = Sys.getenv("R_LIBS_USER")
if (tmp$lib != "") {
  if (!file.exists(tmp$lib)) {
    message("Creating empty user lib directory ", tmp$lib)
    dir.create(tmp$lib, recursive=TRUE, mode="755")
  }
} else {
  message("No user lib")
}

if(interactive()) {
  requireNamespace("utils")
  library("setwidth")

  utils::rc.settings(ipck = TRUE)
  message("R history enabled")
  try(utils::loadhistory("~/.Rhistory"))
  .Last <<- function() try(utils::savehistory("~/.Rhistory"))
}

rm(tmp)

# options(pager = "Rpager", editor = "Reditor", menu.graphics = FALSE)
options(devtools.revdep.libpath = "~/revdep-lib")
if (file.exists("~/.R/local"))
  source("~/.R/local")

# vim: ft=r
