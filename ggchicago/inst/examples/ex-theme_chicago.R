\dontrun{

p <- ggplot(diamonds[diamonds$carat <= 3, ], aes(x = carat, fill = color)) +
    geom_histogram(bins = 30) +
    scale_fill_chicago() +
    labs(title="Chicago theme",
         subtitle="now with subtitles for ggplot2 >= 2.1.0")
p + theme_chicago()
p + theme_chicago('dark')

p <- ggplot(mpg, aes(x = class, fill = drv)) +
    geom_bar() +
    scale_fill_chicago() +
    ggtitle("geom_bar Example")
p + theme_chicago()
p + theme_chicago('dark')

p <- ggplot(mpg, aes(displ, hwy, fill = drv, color = drv)) +
    geom_point(pch = 21, color = 'black', size = 2) +
    geom_smooth(se = FALSE) +
    scale_fill_chicago('base') +
    scale_color_chicago('base') +
    ggtitle("geom_smooth Example")
p + theme_chicago()

ggplot(mtcars, aes(x = factor(hp), fill = factor(hp))) +
    geom_bar() +
    scale_fill_chicago() +
    theme_chicago() +
    labs(title = "Palette with many colors", fill = "Color palette")

ggplot(mtcars, aes(x=wt , y=mpg, color=disp)) +
    geom_point(size=4) +
    theme_chicago() +
    scale_color_chicago('diverging', discrete = FALSE)

}
