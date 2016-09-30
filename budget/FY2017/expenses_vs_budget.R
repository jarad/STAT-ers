library(dplyr)

budget   = readr::read_csv("budget.csv")
expenses = readr::read_csv("expenses.csv") %>%
	group_by(category) %>%
	summarize(cost = sum(cost))

d = expenses %>%
	full_join(budget, by="category")

total = d %>%
	mutate(total = pmax(cost, budget, na.rm=TRUE))
	summarize(cost = sum(cost, na.rm=TRUE),
						budget = sum(budget, na.rm=TRUE),
						total = sum(total))