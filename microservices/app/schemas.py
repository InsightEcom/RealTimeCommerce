from pydantic import BaseModel
from datetime import datetime

class TransactionBase(BaseModel):
    amount: float  # 거래 금액
    description: str  # 거래 설명
    category: str  # 거래 카테고리

class TransactionCreate(TransactionBase):
    pass

class Transaction(TransactionBase):
    id: int  # 고유 ID
    date: datetime  # 거래 일시

    class Config:
        from_attributes = True