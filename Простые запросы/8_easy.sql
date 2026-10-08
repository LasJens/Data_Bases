-- Выбираем 5 самолетов с наибольшей вместимостью
SELECT * FROM Aircraft
ORDER BY capacity DESC
LIMIT 5;