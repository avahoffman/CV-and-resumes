require(ggplot2)

# Make a dummy dataframe
dat <-
  data.frame(
    type = c(
      "4communication",
      "3data science\n&stats",
      "2community ecology",
      "1biotech &\ninformatics"
    ),
    pct = c(10, 25, 30, 35),
    y = as.factor(c(4,4,4,4))
  )
experience_plot <- 
  ggplot(dat, aes(x = pct, y = y, fill = type)) +
  geom_bar(width = 0.8,
           stat = "identity") +
  ylim("1", "2", "3", "4","5","6") +
  xlim(c(-5, 105)) +
  scale_fill_manual(values = c("#999999", "#666666", "#0c410c", "#1b941b")) +
  theme_void() +
  theme(legend.position = "none") +
  geom_text(
    x = c(22.5, 22.5, 50, 82.5),
    y = c("6", "2", "1", "6"),
    label = c(
      "communication & teaching",
      "data science & stats",
      "community ecology",
      "biotech & informatics"
    ),
    size = 4
  ) +
  geom_segment(y = 4,
               yend = 5.5,
               x = 5,
               xend = 5,
               size = 0.2) +
  geom_segment(y = 4,
               yend = 2.5,
               x = 22.5,
               xend = 22.5,
               size = 0.2) +
  geom_segment(y = 4,
               yend = 1.5,
               x = 50,
               xend = 50,
               size = 0.2) +
  geom_segment(y = 4,
               yend = 5.5,
               x = 82.5,
               xend = 82.5,
               size = 0.2)