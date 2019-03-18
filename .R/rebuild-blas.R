library(fs)

packages = character()

for (lib in .libPaths()[1L]) {
  files = dir_ls(path = lib, glob = "*.so", recursive = TRUE)
  for (file in files) {
    lines = trimws(system2("ldd", file, stdout = TRUE, stderr = TRUE))
    if (any(grepl("^libopenblas.* => not found", lines))) {
      parts = path_split(file)[[1L]]
      packages = c(packages, parts[length(parts) - 2L])
    }
  }
}

if (length(packages))
  install.packages(unique(packages))
