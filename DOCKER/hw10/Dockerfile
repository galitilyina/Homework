FROM r-base:latest

# Устанавливаем dplyr при сборке
RUN R -e "install.packages('dplyr', repos='https://cloud.r-project.org')"

# Копируем скрипт внутрь контейнера
COPY anti_join_script.R /app/anti_join_script.R

# Рабочая директория
WORKDIR /app

# При запуске: проверить dplyr и выполнить скрипт
CMD ["Rscript", "anti_join_script.R"]
