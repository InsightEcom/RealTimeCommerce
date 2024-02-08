from pydantic import BaseModel
from typing import Optional
from datetime import datetime

# 거래 생성 요청 스키마
class TransactionCreate(BaseModel):
    date: datetime
    amount: float
    description: Optional[str] = None

# 거래 읽기 응답 스키마
class Transaction(BaseModel):
    id: int
    date: datetime
    amount: float
    description: Optional[str] = None

    class Config:
        orm_mode = True
