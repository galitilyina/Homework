# Anti Join R Docker Example

Этот проект показывает, как выполнить три типа anti join с помощью `dplyr` внутри Docker-контейнера.


# 1.Сборка Docker-образа

```bash
docker build -t anti-join .
docker build --no-cache -t hemog:1.0 . - принудительно образ БЕЗ кеша
  # 2. Запуск контейнера
Папка data будет использоваться для входных и выходных CSV.

docker run --rm -v $(pwd)/data:/app/data anti-join

docker run --rm -v $(pwd)/data:/app/data hemog:1.0

После запуска в папке data появятся файлы:

left.csv

right.csv

anti_left.csv

anti_right.csv

anti_outer.csv

#  3. Что делает скрипт

Скрипт:

создает две тестовые таблицы (left.csv и right.csv)

выполняет:

anti left join

anti right join

anti outer join (объединение первых двух)

сохраняет результат в data/

При запуске также выводится версия установленной библиотеки dplyr.