libs = c("libopenblas", "libicu")

packages = character()
patterns = sprintf("^%s.* => not found$", libs)
for (lib in .libPaths()[1L]) {
  files = list.files(path = lib, pattern = "\\.so(\\.[0-9]+)*$", recursive = TRUE, 
    ignore.case = TRUE, full.names = TRUE, no.. = TRUE)
  for (file in files) {
    lines = suppressWarnings(trimws(system2("ldd", file, stdout = TRUE, stderr = TRUE)))
    for (pattern in patterns) {
      if (any(grepl(pattern, lines))) {
        parts = path_split(file)[[1L]]
        packages = c(packages, parts[length(parts) - 2L])
      }
    }
  }
}

if (length(packages))
  install.packages(unique(packages))
