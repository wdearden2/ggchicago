#' @importFrom jsonlite read_json
get_colors_list <- function() {
    colors_path <- system.file("chicago-colors.json", package = "ggchicago")
    colors_list <- jsonlite::read_json(colors_path)
}

#' Functions for accessing colors and color palettes
#' 
#' @rdname get_colors
#' @param colors Color names to grab
#' @examples
#' get_colors(c('rusty-red', 'atomic-green'))
#' @export
get_colors <- function(colors) {
    colors_list <- get_colors_list()

    unlist(colors_list[['ds-color-palette']][colors])
}

#' @rdname get_colors
#' @examples
#' get_available_colors()
#' @export
get_available_colors <- function() {
    colors_list <- get_colors_list()

    names(colors_list$`ds-color-palette`)
}

#' @param palette Color palette name
#' @rdname get_colors
#' @examples
#' get_palette('brand')
#' @export
get_palette <- function(palette) {
    colors_list <- get_colors_list()
    color_definitions <- unlist(colors_list[["ds-color-palette"]])
    color_definitions[unlist(colors_list[["ds-color-groups"]][palette])]
}
 
#' @rdname get_colors
#' @examples
#' get_available_palettes()
#' @export
get_available_palettes <- function() {
    colors_list <- get_colors_list()

    names(colors_list$`ds-color-groups`)
}