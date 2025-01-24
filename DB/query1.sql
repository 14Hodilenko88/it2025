-- Active: 1702282272087@@127.0.0.1@5432@it2025practice13
-- Створення таблиці
CREATE TABLE personal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    rank VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL
);

-- Вставка даних
INSERT INTO personal (name, surname, rank, position)
VALUES
('Ivan', 'Petrenko', 'Captain', 'Platoon Commander'),
('Olena', 'Kovalenko', 'Lieutenant', 'Communications Officer'),
('Andrii', 'Shevchenko', 'Major', 'Battalion Commander'),
('Oksana', 'Ivchenko', 'Sergeant', 'Logistics Specialist'),
('Mykola', 'Bondarenko', 'Colonel', 'Regimental Commander');

-- Перевірка даних
SELECT * FROM personal;
