from dotenv import load_dotenv
load_dotenv()  # .env 파일에서 환경 변수를 로드합니다.

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
    # 엔드포인트 경로 이름 명사 사용 및 복수형으로 변경
    return crud.create_transaction(db=db, transaction=transaction)

@app.get("/transactions/", response_model=list[schemas.Transaction])
def read_transactions(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    # 복수형 명사 사용 및 일관성 유지
    transactions = crud.get_transactions(db, skip=skip, limit=limit)
    return transactions

@app.get("/transactions/category/{category}", response_model=list[schemas.Transaction])
def read_transactions_by_category(category: str, skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    # RESTful API 설계 원칙에 따라 경로와 변수명을 명확하게 사용
    transactions = crud.get_transactions_by_category(db, category=category, skip=skip, limit=limit)
    return transactions

@app.get("/analytics/monthly-total")
def get_monthly_total(db: Session = Depends(get_db)):
    # 분석 로직 구현 주석 추가
    monthly_totals = {"January": 10000, "February": 15000, "March": 20000}
    return monthly_totals
