-- Створення таблиці для кадрових позицій
CREATE TABLE Position (
    id_position SERIAL PRIMARY KEY,        -- Унікальний ідентифікатор посади
    name VARCHAR(255) NOT NULL,            -- Назва посади
    department VARCHAR(255) NOT NULL,      -- Відділ
    description TEXT                       -- Опис посади
);

-- Створення таблиці для особового складу
CREATE TABLE Employee (
    id_employee SERIAL PRIMARY KEY,        -- Унікальний ідентифікатор співробітника
    first_name VARCHAR(100) NOT NULL,      -- Ім'я співробітника
    last_name VARCHAR(100) NOT NULL,       -- Прізвище співробітника
    birth_date DATE NOT NULL,              -- Дата народження
    hire_date DATE NOT NULL,               -- Дата прийому на роботу
    id_position INT,                       -- Зовнішній ключ для кадрової позиції
    CONSTRAINT fk_position
        FOREIGN KEY (id_position)         -- Зв'язок із таблицею Position
        REFERENCES Position(id_position)  -- Вказує на id_position у таблиці Position
        ON DELETE SET NULL                 -- Якщо позиція буде видалена, то в полі id_position стане NULL
);

-- Створення таблиці для навчання
CREATE TABLE Training (
    id_training SERIAL PRIMARY KEY,        -- Унікальний ідентифікатор навчання
    training_name VARCHAR(255) NOT NULL,    -- Назва навчання
    training_date DATE NOT NULL,           -- Дата проведення навчання
    duration INT NOT NULL                  -- Тривалість навчання в днях
);

-- Створення допоміжної таблиці для зв'язку між співробітниками та навчанням
CREATE TABLE Employee_Training (
    id_employee INT,                       -- Зовнішній ключ для співробітника
    id_training INT,                       -- Зовнішній ключ для навчання
    PRIMARY KEY (id_employee, id_training), -- Первинний ключ складається з обох зовнішніх ключів
    CONSTRAINT fk_employee
        FOREIGN KEY (id_employee)         -- Зв'язок із таблицею Employee
        REFERENCES Employee(id_employee)  -- Вказує на id_employee у таблиці Employee
        ON DELETE CASCADE,                -- Якщо співробітник видаляється, то його записи в цій таблиці також видаляються
    CONSTRAINT fk_training
        FOREIGN KEY (id_training)         -- Зв'язок із таблицею Training
        REFERENCES Training(id_training)  -- Вказує на id_training у таблиці Training
        ON DELETE CASCADE                 -- Якщо навчання видаляється, то записи співробітників про це навчання також видаляються
);

-- Додаємо тестові записи для кадрових позицій
INSERT INTO Position (name, department, description)
VALUES 
    ('Software Engineer', 'IT Department', 'Responsible for software development'),
    ('HR Manager', 'Human Resources', 'Manages HR processes'),
    ('Sales Representative', 'Sales', 'Handles customer sales and relations');

-- Додаємо тестових співробітників
INSERT INTO Employee (first_name, last_name, birth_date, hire_date, id_position)
VALUES 
    ('John', 'Doe', '1990-05-15', '2020-01-10', 1),  -- Посада: Software Engineer
    ('Alice', 'Johnson', '1985-03-22', '2018-06-25', 2),  -- Посада: HR Manager
    ('Bob', 'Smith', '1992-07-30', '2022-04-20', 3);  -- Посада: Sales Representative

-- Додаємо тестові записи для тренінгів
INSERT INTO Training (training_name, training_date, duration)
VALUES 
    ('Java Programming', '2025-03-01', 5),  -- Навчання з програмування
    ('HR Best Practices', '2025-04-10', 3),  -- Тренінг для HR-менеджерів
    ('Sales Techniques', '2025-05-15', 2);  -- Навчання для співробітників відділу продажів

-- Додаємо співробітників, які проходять тренінги
INSERT INTO Employee_Training (id_employee, id_training)
VALUES 
    (1, 1),  -- John Doe проходить тренінг Java Programming
    (2, 2),  -- Alice Johnson проходить тренінг HR Best Practices
    (3, 3);  -- Bob Smith проходить тренінг Sales Techniques

-- Перевірка співробітників та їхніх посад
SELECT e.first_name, e.last_name, p.name AS position
FROM Employee e
JOIN Position p ON e.id_position = p.id_position;

-- Перевірка співробітників і тренінгів, які вони проходять
SELECT e.first_name, e.last_name, t.training_name, t.training_date
FROM Employee e
JOIN Employee_Training et ON e.id_employee = et.id_employee
JOIN Training t ON et.id_training = t.id_training;

-- Перевірка посади та навчання конкретного співробітника (John Doe)
SELECT e.first_name, e.last_name, p.name AS position, t.training_name, t.training_date
FROM Employee e
JOIN Position p ON e.id_position = p.id_position
JOIN Employee_Training et ON e.id_employee = et.id_employee
JOIN Training t ON et.id_training = t.id_training
WHERE e.first_name = 'John' AND e.last_name = 'Doe';
