@startuml
' Таблиця для кадрових позицій
entity "Position" as p {
    +id_position : INT
    name        : VARCHAR
    department  : VARCHAR
    description : TEXT
}

' Таблиця для особового складу
entity "Employee" as e {
    +id_employee : INT
    first_name   : VARCHAR
    last_name    : VARCHAR
    birth_date   : DATE
    hire_date    : DATE
}

' Таблиця для навчання
entity "Training" as t {
    +id_training : INT
    training_name : VARCHAR
    training_date : DATE
    duration      : INT
}

' Зв'язок між співробітниками та кадровими позиціями
e -- p : "has position"

' Зв'язок між співробітниками та навчанням
entity "Employee_Training" as et {
    +id_employee : INT
    +id_training : INT
}

' Зв'язок між Employee_Training і таблицями Employee та Training
et -- e : "attends"
et -- t : "includes"
@enduml