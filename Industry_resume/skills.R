library(ggplot2)

skills <- c(
  "R",
  "python",
  "git",
  "SQL",
  "PySpark",
  "bash",
  "Tableau",
  "Alteryx",
  "Markdown",
  "LaTeX",
  "WDL",
  "SAS",
  "HTML"
)

dat <-
  data.frame(
    skill = factor(skills, levels = rev(skills)),
    rating = c(90, 70, 75, 40, 40, 50, 20, 20, 55, 50, 15, 10, 30),
    type = c("L", "L", "L", "L", "L", "L", "S", "S", "L", "L", "L", "S", "L")
  )

skills_plot <-
  ggplot(dat) +
  geom_segment(
    aes(
      color = type,
      xend = rating,
      y = forcats::fct_reorder(skill, rating),
      yend = skill
    ),
    x = 0,
    linewidth = 3
  ) +
  xlim(c(0, 100)) +
  geom_point(
    aes(x = rating, y = skill, color = type),
    size = 4,
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
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks = element_blank(),
    legend.position = "none",
    panel.background = element_rect(fill = "white"),
    axis.text.y = element_text(size = 18, color = "black"),
    axis.text.x = element_blank()
  )

skills_plot
