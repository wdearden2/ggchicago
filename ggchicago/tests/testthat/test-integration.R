context("test-integration.R")

test_that("theme and palette work together", {
    p <- ggplot(diamonds[diamonds$carat <= 3, ], aes(x = carat, fill = color)) +
        geom_histogram(bins = 30) +
        scale_fill_chicago() +
        labs(
            title = "Chicago theme",
            subtitle = "now with subtitles for ggplot2 >= 2.1.0"
        )

    expect_silent(p + theme_chicago())
    expect_silent(p + theme_chicago("dark"))
    expect_silent(p + theme_chicago("black"))
    expect_silent(p + theme_chicago("light"))
})
