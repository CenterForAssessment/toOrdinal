`.onLoad` <-
function(libname, pkgname) {
}

`.onAttach` <-
function(libname, pkgname) {
	if (interactive()) {
		packageStartupMessage(magenta$bold('toOrdinal',paste(paste0(unlist(strsplit(as.character(packageVersion("toOrdinal")), "[.]")), c(".", "-", ".", "")), collapse=""),' (11-4-2022). For help: >help("toOrdinal") or visit https://centerforassessment.github.io/toOrdinal/'))
	}
}
