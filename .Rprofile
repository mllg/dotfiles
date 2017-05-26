.First = function() {
  if (requireNamespace("sensible", quietly = TRUE))
    sensible::sensible(cran = "http://bioconductor.statistik.tu-dortmund.de/cran/")
  else
    message("Please install sensible")

  options(
    BioC_mirror = "http://bioconductor.statistik.tu-dortmund.de",
    rt.maintainer = "Michel Lang <michellang@gmail.com>"
  )
}

# vim: ft=r
