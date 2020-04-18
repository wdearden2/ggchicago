#' @importFrom extrafont font_import loadfonts
.onLoad <- function(libname, pkgname) {
    suppressMessages(
        suppressWarnings({
            extrafont::font_import(
                file.path(system.file(package = 'ggchicago'), 'fonts')
                , prompt = FALSE
            )
        })
    )
}
