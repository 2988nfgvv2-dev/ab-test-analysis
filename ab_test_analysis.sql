-- Создание таблицы пользователей
CREATE TABLE ab_test (
    user_id INTEGER,
    test_group TEXT,
    purchase INTEGER
);

-- Добавление данных
INSERT INTO ab_test VALUES
(1, 'A', 1),
(2, 'A', 0),
(3, 'A', 1),
(4, 'A', 0),
(5, 'A', 1),
(6, 'B', 1),
(7, 'B', 1),
(8, 'B', 1),
(9, 'B', 0),
(10, 'B', 1);

-- Все данные
SELECT * FROM ab_test;

-- Количество пользователей по группам
SELECT test_group,
COUNT(*) AS users_count
FROM ab_test
GROUP BY test_group;

-- Количество покупок
SELECT test_group,
SUM(purchase) AS purchases
FROM ab_test
GROUP BY test_group;

-- Конверсия по группам
SELECT test_group,
ROUND(AVG(purchase) * 100, 2) AS conversion_rate
FROM ab_test
GROUP BY test_group;

-- Победитель теста
SELECT test_group,
ROUND(AVG(purchase) * 100, 2) AS conversion_rate
FROM ab_test
GROUP BY test_group
ORDER BY conversion_rate DESC;
