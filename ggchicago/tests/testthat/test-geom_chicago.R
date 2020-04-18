context("test-palettes.R")

test_that("geom_chicago works silently", {
    expect_silent({
        ggplot(mtcars, aes(x = wt, y = mpg)) +
            geom_chicago(size = 0.04) +
            theme_chicago() +
            ggtitle("Chicago geom")
    })
})
