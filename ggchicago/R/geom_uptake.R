
# most of the code is from ggtech https://github.com/ricardo-bion/ggtech
#' @importFrom grDevices as.raster
#' @importFrom grid rasterGrob
chicagoGrob <- function(x, y, size = size
                       , logo_path = file.path(find.package("ggchicago")
                                               , "caret_black.png"))
{
    img <- grDevices::as.raster(png::readPNG(logo_path))

    grid::rasterGrob(
        x = x
        , y = y
        , image = img
        , default.units = "native"
        , height = size
        , width = size
    )
}



GeomChicago <-
    ggplot2::ggproto(
        "GeomChicago"
        , ggplot2::Geom
        , draw_panel =
        function(data, panel_scales, coord, na.rm = FALSE)
        {
            coords <- coord$transform(data, panel_scales)
            ggplot2:::ggname(
                "geom_chicago"
                , chicagoGrob(coords$x, coords$y, coords$size)
            )
        }
        , non_missing_aes = "size"
        , required_aes = c("x", "y")
        , default_aes = ggplot2::aes(size = 0.2)
    )


#' Chicago geom
#'
#' @inheritParams ggplot2::geom_point
#' @examples
#'
#' \dontrun{
#'
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'    geom_chicago(size = 0.04) +
#'    theme_chicago() +
#'    ggtitle("Chicago geom")
#' }
#'
#' @export
geom_chicago <- function(mapping = NULL, data = NULL, stat = "identity"
                        , position = "identity", na.rm = FALSE
                        , show.legend = NA, inherit.aes = TRUE, ...)
{
    ggplot2::layer(
        data = data
        , mapping = mapping
        , stat = stat
        , geom = GeomChicago
        , position = position
        , show.legend = show.legend
        , inherit.aes = inherit.aes
        , params = list(
          na.rm = na.rm
          , ...
        )
    )
}
