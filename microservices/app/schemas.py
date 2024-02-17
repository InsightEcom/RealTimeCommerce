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
        orm_mode = True

# 사용자 생성을 위한 기본 스키마
class UserCreate(BaseModel):
    username: str
    email: str
    password: str

# 사용자 생성 후 응답을 위한 스키마
class UserCreateResponse(BaseModel):
    id: int
    username: str
    email: str

    class Config:
        orm_mode = True
