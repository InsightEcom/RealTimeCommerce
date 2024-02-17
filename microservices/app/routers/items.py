from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from .. import crud, models, schemas, database

router = APIRouter()

@router.post("/items/", response_model=schemas.Transaction)
def create_item(item: schemas.TransactionCreate, db: Session = Depends(database.get_db)):
    # 아이템(여기서는 Transaction으로 가정) 생성 엔드포인트
    return crud.create_transaction(db=db, transaction=item)

@router.get("/items/", response_model=list[schemas.Transaction])
def read_items(skip: int = 0, limit: int = 100, db: Session = Depends(database.get_db)):
    # 모든 아이템 조회 엔드포인트, 페이지네이션 가능
    items = crud.get_transactions(db, skip=skip, limit=limit)
    return items
