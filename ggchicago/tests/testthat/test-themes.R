context("test-themes.R")

p <- ggplot(mpg, aes(displ, hwy, color = drv)) +
    geom_point()

test_that("themes work", {
    expect_silent(p + theme_chicago())
    expect_silent(p + theme_chicago('dark'))
})

test_that("Error for invalid style", {
    expect_error(p + theme_chicago('red'))
})
