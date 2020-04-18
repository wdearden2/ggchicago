context("test-data.R")

test_that("get_colors works correctly", {
    expect_equal(length(get_colors(c("rusty-red", "atomic-green"))), 2)
    expect_equal(length(get_colors(c("rusty-red", "green"))), 1)
})

test_that("get_available_colors works correctly", {
    expect_equal(class(get_available_colors()), "character")
})

test_that("get_palette works correctly", {
    expect_equal(length(get_palette("brand")), 8)
    expect_equal(length(get_palette("brad")), 0)
})

test_that("get_available_palettes works correctly", {
    expect_equal(class(get_available_palettes()), "character")
})
