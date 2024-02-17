from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from ..crud import create_user, get_user  # Assumed CRUD operations
from ..database import get_db
from ..schemas import UserCreate, User  # Assumed User schemas

router = APIRouter()

@router.post("/users/", response_model=User)
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    # 사용자 생성
    db_user = create_user(db=db, user=user)
    if db_user:
        return db_user
    raise HTTPException(status_code=400, detail="User could not be created.")

@router.get("/users/{user_id}", response_model=User)
def read_user(user_id: int, db: Session = Depends(get_db)):
    # 특정 사용자 조회
    db_user = get_user(db, user_id=user_id)
    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user
