from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, scoped_session

# 데이터베이스 URL 설정
DATABASE_URL = "sqlite:///./test.db"  # SQLite 사용
# PostgreSQL을 사용하는 경우 예시: "postgresql://user:password@localhost/dbname"

# SQLAlchemy 엔진 생성
engine = create_engine(
    DATABASE_URL, 
    connect_args={"check_same_thread": False}  # SQLite에만 필요한 옵션
)

# 세션 생성을 위한 SessionLocal 클래스
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# 스레드에 안전한 세션을 위해 scoped_session 사용
# 이는 각 요청마다 독립된 세션을 보장하며, 요청 처리 후 세션을 종료해야 합니다.
ScopedSession = scoped_session(SessionLocal)

# 모델에 대한 기본 클래스
Base = declarative_base()
