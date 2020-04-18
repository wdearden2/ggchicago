#' Chicago themes for ggplot2 plots
#'
#' @import ggplot2
#' @param style string indicating the color theme you want to use. Must be one of 'white', 'light', 'dark', 'black', 'stark', 'design'
#' @param font character string indicating which font you want. "Arial" is automatically imported with the package.
#' @inheritParams theme_minimal base_size
#' @export
#' @example inst/examples/ex-theme_chicago.R
theme_chicago <- function(style = 'white', font = NULL, base_size = 12) {
    switch(
        style
        , white = .theme_chicago_helper(font_family = font, base_size = base_size)
        , light = .theme_chicago_helper(
            font_family = font
            , colour_background = get_colors("snow-white")
            , colour_title = get_colors("lead-grey")
            , colour_text = get_colors("lead-grey")
            , colour_axis = get_colors("brand-cool-grey")
            , colour_grid = get_colors("brand-grey")
            , base_size = base_size
        )
        , dark = .theme_chicago_helper(
            font_family = font
            , colour_background = get_colors("smoke-grey")
            , colour_title = "white"
            , colour_text = "white"
            , colour_axis = get_colors("brand-grey")
            , colour_grid = get_colors("brand-cool-grey")
            , base_size = base_size
        )
        , black = .theme_chicago_helper(
            font_family = font
            , colour_background = "black"
            , colour_title = "white"
            , colour_text = get_colors("brand-grey")
            , colour_axis = get_colors("brand-grey")
            , colour_grid = get_colors("brand-cool-grey")
            , base_size = base_size
        )
        , stark = .theme_chicago_helper(
            font_family = font
            , colour_background = "white"
            , colour_title = "black"
            , colour_axis = "black"
            , grid_lines = FALSE
            , base_size = base_size
        )
        , design = .theme_chicago_helper(
            font_family = 'Roboto'
            , colour_background = get_colors('design-blue')
            , grid_horizontal_major = TRUE
            , grid_horizontal_minor = FALSE
            , grid_vertical = FALSE
            , colour_grid = get_colors('design-dark-blue')
            , colour_title = 'white'
            , colour_text_minor = get_colors('design-light-grey')
            , colour_axis = 'black'
            , base_size = base_size
        )
        , stop('Unkown theme')
    )
}

.theme_chicago_helper <- function(
    font_family = NULL
    , face_title = 'bold'
    , colour_background = 'white'
    , base_size = 12
    , colour_title = get_colors('lead-grey')
    , colour_text = colour_title
    , colour_text_major = colour_text
    , colour_text_minor = colour_text
    , colour_axis = get_colors("brand-cool-grey")
    , colour_grid = get_colors('brand-grey')
    , grid_lines = TRUE
    , grid_vertical = grid_lines
    , grid_horizontal = grid_lines
    , grid_vertical_major = grid_vertical
    , grid_horizontal_major = grid_vertical
    , grid_vertical_minor = grid_vertical
    , grid_horizontal_minor = grid_horizontal
) {
    theme_minimal() +
        theme(text = element_text(size = base_size, family = font_family)
              , legend.title =
                  element_text(
                      size = base_size
                      , family = font_family
                      , colour = colour_text_major
                  )
              , plot.title =
                  element_text(
                      size = 17/12*base_size
                      , colour = colour_title
                      , family = font_family
                      , face = face_title
                  )
              , plot.subtitle =
                  element_text(
                      size = base_size
                      , colour = colour_title
                      , family = font_family
                      , face = face_title
                  )
              , axis.text.x = element_text(color = colour_text_minor)
              , axis.text.y = element_text(color = colour_text_minor)
              , axis.title.x =
                  element_text(color = colour_text_major, vjust = 0)
              , axis.title.y =
                  element_text(color = colour_text_major, vjust = 1.25)
              , plot.background =
                  element_rect(fill = colour_background
                               , colour = colour_background)
              , panel.grid.major.x = `if`(
                  grid_vertical_major
                  , element_line(colour_grid, size = 0.3)
                  , element_blank()
              )
              , panel.grid.major.y = `if`(
                  grid_horizontal_major
                  , element_line(colour_grid, size = 0.3)
                  , element_blank()
              )
              , panel.grid.minor.x = `if`(
                  grid_vertical_minor
                  , element_line(colour_grid, size = 0.15)
                  , element_blank()
              )
              , panel.grid.minor.y = `if`(
                  grid_horizontal_minor
                  , element_line(colour_grid, size = 0.15)
                  , element_blank()
              )
              , panel.border = element_blank()
              , axis.line.x = element_line(color = colour_axis, size = 0.5)
              , axis.line.y = element_line(color = colour_axis, size = 0.5)
              , line = element_line(color = colour_text_major)
              , rect = element_rect(color = colour_text_major)
              , axis.ticks.x = element_line(color = colour_axis)
              , axis.ticks.y = element_line(color = colour_axis)
              , legend.text = element_text(family = font_family, colour = colour_text_major)
              , strip.background = element_rect(fill = colour_grid, color = NA)
              , strip.text = element_text(color = colour_text_major)
        )
}
