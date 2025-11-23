Data Joins Project
Проект для объединения данных метаданных образцов и результатов масс-спектрометрии.

1. Подготовка данных
Поместите в input/:

sample_metadata.csv
mass_spec_results.csv

2. Запуск через Docker
docker build -t my-joins-app .
docker run -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output my-joins-app

3. Результаты
В output/ создадутся:
inner_join.csv - общие записи
left_join.csv - все метаданные
right_join.csv - все масс-спектрометрии
outer_join.csv - все записи

Формат данных
sample_metadata.csv:
sample_id,patient_id,disease,age,gender

mass_spec_results.csv:
sample_id,protein,intensity,p_value

Логирование
Контейнер логирует каждую операцию в консоль.