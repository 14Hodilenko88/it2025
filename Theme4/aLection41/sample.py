from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List

app = FastAPI()

# Модель користувача
class User(BaseModel):
    id: int
    name: str
    email: str

# Тимчасова база даних (список)
users_db = []

# Отримати список усіх користувачів
@app.get("/users", response_model=List[User])
def get_users():
    return users_db

# Отримати користувача за ID
@app.get("/users/{user_id}", response_model=User)
def get_user(user_id: int):
    for user in users_db:
        if user.id == user_id:
            return user
    raise HTTPException(status_code=404, detail="User not found")

# Додати нового користувача
@app.post("/users", response_model=User)
def create_user(user: User):
    users_db.append(user)
    return user

# Видалити користувача
@app.delete("/users/{user_id}")
def delete_user(user_id: int):
    global users_db
    users_db = [user for user in users_db if user.id != user_id]
    return {"message": "User deleted"}
