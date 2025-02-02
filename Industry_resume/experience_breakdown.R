require(ggplot2)

# Make a dummy dataframe
dat <-
  data.frame(
    type = c(
      "4communication",
      "3data science\n&stats",
      "1biotech &\ninformatics"
    ),
    pct = c(30, 40, 30),
    y = as.factor(c(4,4,4))
  )
experience_plot <- 
  ggplot(dat, aes(x = pct, y = y, fill = type)) +
  geom_bar(width = 0.8,
           stat = "identity") +
  ylim("2", "3", "4","5","6") +
  xlim(c(-5, 105)) +
  scale_fill_manual(values = c("#666666", "#0c410c", "#1b941b")) +
  theme_void() +
  theme(legend.position = "none") +
  geom_text(
    x = c(22.5, 50, 85),
    y = c("6", "2", "6"),
    label = c(
      "communication & teaching",
      "data science & stats",
      "biotech & informatics"
    ),
    size = 5
  ) +
  geom_segment(y = 3,
               yend = 4.5,
               x = 15,
               xend = 15,
               linewidth = 0.2) +
  geom_segment(y = 3,
               yend = 1.5,
               x = 50,
               xend = 50,
               linewidth = 0.2) +
  geom_segment(y = 3,
               yend = 4.5,
               x = 80,
               xend = 80,
               linewidth = 0.2)