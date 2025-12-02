library(readxl)
patients <- read_excel("./common/Пациенты.xlsx")
str(patients)
str(patients[c("Возраст", "глюкоза")])
patients$Пол <- factor(patients$Пол,levels = c("м", "ж"))
levels(patients$Пол)
patients$возраст_группа_2 <- factor(ifelse(patients$Возраст <= 60, "Молодые", "Старшие"),
levels = c("Молодые", "Старшие"))
head(patients[c("Возраст", "возраст_группа_2")]) 
patients[patients$Возраст > 75, ]
head(patients[c("лейкоциты", "глюкоза")])
summary(patients[c("лейкоциты", "глюкоза")])
aggregate(глюкоза ~ Пол, data = patients, FUN = mean)
aggregate(лейкоциты ~ Пол + возраст_группа_2, data = patients, FUN = mean)
aggregate(глюкоза ~ Пол, data = patients, FUN = sd)
aggregate(глюкоза ~ Пол, data = patients, FUN = length)
aggregate(глюкоза ~ Пол, data = patients, FUN = mean)
boxplot(глюкоза ~ Пол, data = patients)
t.test(глюкоза ~ Пол, data = patients)
patients_task <- patients
patients_task$глюкоза[c(3, 15, 45)] <- NA
total_na <- sum(is.na(patients_task))
print(total_na)
na_rows <- which(is.na(patients_task$глюкоза))
print(na_rows)
patients_no_na <- na.omit(patients_task)
dim(patients_task); dim(patients_no_na)
patients$гемоглобин[is.na(patients$глюкоза)] <- median(patients$глюкоза, na.rm = TRUE)
mean_task <- aggregate(лейкоциты ~ Пол, data = patients_task, FUN = mean, na.rm = TRUE)
mean_no_na <- aggregate(лейкоциты ~ Пол, data = patients_no_na, FUN = mean)
print(mean_task)
print(mean_no_na)
final_result <- aggregate(гемоглобин ~ возраст_группа_2, patients_task, 
function(x) c(mean = mean(x, na.rm = TRUE), sd = sd(x, na.rm = TRUE)))
final_result <- data.frame(возрастная_группа = final_result$возраст_группа_2,
средний_гемоглобин = final_result$гемоглобин[, "mean"],
стандартное_отклонение = final_result$гемоглобин[, "sd"])
print(final_result)
write.csv(final_result, "анализ_гемоглобина.csv")

