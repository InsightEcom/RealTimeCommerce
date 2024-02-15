from dotenv import load_dotenv
load_dotenv()  # 이 코드가 .env 파일에서 환경 변수를 로드합니다.

from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from . import crud, models, schemas, database

app = FastAPI()

# 데이터베이스 세션 의존성
def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return {
        "message": "RealTimeCommerce API에 오신 것을 환영합니다!",
        "description": "이 API는 전자상거래 거래 데이터를 실시간으로 처리하고 분석합니다.",
        "instructions": "엔드포인트를 사용하여 거래 데이터와 상호작용하고 비즈니스 성능 지표를 추적하세요."
    }

@app.post("/transactions/", response_model=schemas.Transaction)
def create_transaction(transaction: schemas.TransactionCreate, db: Session = Depends(get_db)):
    return crud.create_transaction(db=db, transaction=transaction)

@app.get("/transactions/", response_model=list[schemas.Transaction])
def read_transactions(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    transactions = crud.get_transactions(db, skip=skip, limit=limit)
    return transactions

@app.get("/transactions/category/{category}", response_model=list[schemas.Transaction])
def read_transactions_by_category(category: str, skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    transactions = crud.get_transactions_by_category(db, category=category, skip=skip, limit=limit)
    return transactions

@app.get("/analytics/monthly-total")
def get_monthly_total(db: Session = Depends(get_db)):
    # 분석 로직 구현
    # 예시: 각 월별 거래 총액을 계산
    # 실제 구현 시 데이터베이스에서 월별 총액을 집계하는 쿼리를 작성해야 합니다.
    # 여기서는 반환 값이 가상의 데이터라고 가정합니다.
    monthly_totals = {"January": 10000, "February": 15000, "March": 20000}
    return monthly_totals
