
#' Chicago color palettes
#'
#' Color palettes drawn from Chicago's branding guidelines
#'
#' @family chicago colors
#' @param palette Chicago color palette. One of 'brand', 'base', 'diverging', 'sequential'
#' @param discrete Whether you want a discrete palette or not
#' @importFrom grDevices colorRampPalette
#' @importFrom scales gradient_n_pal
#' @examples
#' scales::show_col(chicago_pal()(7))
#' scales::show_col(chicago_pal('diverging')(7))
#' scales::show_col(chicago_pal(discrete = FALSE)(0.1*0:10))
#' scales::show_col(chicago_pal('diverging', discrete = FALSE)(0.1*0:10))
#' @export
chicago_pal <- function(palette = "brand", discrete = TRUE) {
    if (discrete) {
        switch(
            palette
            , brand = function(n) {
                if (n <= 8) {
                    colors <- get_palette('brand')
                    unname(colors[seq_len(n)])
                } else {
                    ramped_palette <- c(
                        "brand-purple", "ultra-blue", "brand-green"
                        , "brand-yellow", "brand-brightorange", "brand-red"
                    )
                    ramped_palette <- unname(get_palette('brand')[ramped_palette])
                    grDevices::colorRampPalette(ramped_palette)(n)
                }
            }
            , base = function(n) {
                if (n <= 5) {
                    color_names  <- c(
                        "dusty-blue", "frosty-green", "clementine-orange"
                        , "yolk-yellow", "rusty-red"
                    )
                    colors <- get_palette('base')[color_names]
                    unname(colors[seq_len(n)])
                } else {
                    ramped_palette <- unname(get_palette('brand'))
                    grDevices::colorRampPalette(ramped_palette)(n)
                }
            }
            , sequential = grDevices::colorRampPalette(get_palette('sequential'))
            , diverging = grDevices::colorRampPalette(get_palette('diverging'))
            , {
                warning(paste0("Palette '", palette, "' does not exist. Defaulting to 'brand'"))
                chicago_pal('brand', discrete = TRUE)
            }
        )
    } else {
        switch(
            palette
            , brand = function(x) {
                ramped_palette <-
                    c("brand-purple", "ultra-blue", "brand-green"
                    , "brand-yellow", "brand-brightorange", "brand-red")
                ramped_palette <- unname(get_palette('brand')[ramped_palette])
                scales::gradient_n_pal(ramped_palette)(x)
            }
            , base = scales::gradient_n_pal(get_palette('base'))
            , sequential = scales::gradient_n_pal(get_palette('sequential'))
            , diverging = scales::gradient_n_pal(get_palette('diverging'))
            , {
                warning(paste0("Palette '", palette, "' does not exist. Defaulting to 'sequential'"))
                chicago_pal('sequential', discrete = FALSE)
            }
        )
    }
}

#' Chicago color scales
#'
#' Color scales using Chicago branding colors. See Chicago
#' branding guide for examples and colors.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @family color chicago
#' @inheritParams chicago_pal
#' @rdname scale_chicago
#' @seealso \code{\link{theme_chicago}} for examples.
#' @export
scale_color_chicago <- function(palette = 'brand', discrete = TRUE, ...) {
    if (discrete) {
        discrete_scale("colour", "chicago", chicago_pal(palette, discrete = TRUE), ...)
    } else {
        continuous_scale(
            "colour", "chicago"
            , chicago_pal(palette, discrete = FALSE)
            , guide = "colourbar"
            , ...
        )
    }
}

#' @rdname scale_chicago
#' @export
scale_colour_chicago <- scale_color_chicago

#' @rdname scale_chicago
#' @export
scale_fill_chicago <- function(palette = 'brand', discrete = TRUE, ...) {
    if (discrete) {
        discrete_scale("fill", "chicago", chicago_pal(palette, discrete = TRUE), ...)
    } else {
        continuous_scale(
            "fill", "chicago"
            , chicago_pal(palette, discrete = FALSE)
            , guide = "colourbar"
            , ...
        )
    }
}
