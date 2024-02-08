from sqlalchemy import Column, Integer, Float, String, DateTime
from datetime import datetime
from .database import Base

class Transaction(Base):
    __tablename__ = "transactions"
    
    id = Column(Integer, primary_key=True, index=True)  # 고유 ID
    date = Column(DateTime, default=datetime.utcnow)  # 거래 일시
    amount = Column(Float)  # 거래 금액
    description = Column(String)  # 거래 설명
    category = Column(String)  # 거래 카테고리
