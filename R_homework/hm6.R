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
