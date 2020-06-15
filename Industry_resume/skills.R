library(ggplot2)
dat <-
  data.frame(
    skill = c(
      "12R",
      "11python",
      "10SQL",
      "09Pyspark",
      "08git",
      "07bash",
      "06Tableau",
      "05Alteryx",
      "04Markdown",
      "03Latex",
      "02SAS",
      "01HTML"
    ),
    rating = c(90, 75, 50, 40, 50, 40, 35, 35, 40, 50, 25, 5),
    type = c("L", "L", "L", "L", "L", "L", "S", "S", "L", "L", "S", "L")
  )

skills_plot <-
  ggplot(dat) +
  geom_segment(aes(
    color = type,
    xend = rating,
    y = skill,
    yend = skill
  ),
  x = 0,
  size = 2) +
  xlim(c(0, 100)) +
  geom_point(
    aes(x = rating, y = skill, color = type),
    size = 2,
    shape = 21,
    stroke = 3,
    fill = "white"
  ) +
  scale_color_manual(
    values = c("#999999", "#666666"),
    labels = c("language", "software")
  ) +
  scale_x_continuous(
    breaks = c(16.65, 50, 83.35),
    labels = c("novice", "skilled", "expert")
  ) +
  scale_y_discrete(
    labels = c(
      "HTML",
      "SAS",
      "LaTeX",
      "Markdown",
      "Alteryx",
      "Tableau",
      "bash",
      "git",
      "PySpark",
      "SQL",
      "python",
      "R"
    )
  ) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks = element_blank(),
    legend.position = "none",
    panel.background = element_rect(fill = "white"),
    axis.text.y = element_text(size = 10, color = "black"),
    axis.text.x = element_blank()
  )

skills_plot