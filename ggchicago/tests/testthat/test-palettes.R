context("test-palettes.R")

p1 <- ggplot(mpg, aes(displ, hwy, color = drv)) +
    geom_point() +
    geom_smooth(se = FALSE) +
    labs(title = "Palette with many colors", fill = "Color palette")

p2 <- ggplot(mtcars, aes(x = factor(hp), fill = factor(hp))) +
    geom_bar() +
    labs(title = "Palette with many colors", fill = "Color palette")

p3 <- ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
    geom_point(size = 4)

p4 <- ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_raster(aes(fill = density))

test_that("palettes work silently", {
    expect_silent(p1 + scale_color_chicago())
    expect_silent(p2 + scale_fill_chicago())
    expect_silent(p3 + scale_color_chicago(discrete = FALSE))
    expect_silent(p4 + scale_fill_chicago(discrete = FALSE))
})

test_that("warning for wrong palette", {
    expect_silent(chicago_pal())
    expect_silent(chicago_pal("sequential"))
    expect_silent(chicago_pal("diverging"))
    expect_warning(chicago_pal("a"), "does not exist")
    expect_warning(scale_color_chicago("a"), "does not exist")
})

test_that("no error for mismatch of discrete and continuous (weird ggplot2 behavior)", {
    expect_silent(p1 + scale_color_chicago(discrete = FALSE))
    expect_silent(p2 + scale_color_chicago(discrete = FALSE))
    expect_silent(p3 + scale_color_chicago())
    expect_silent(p4 + scale_fill_chicago())
})
