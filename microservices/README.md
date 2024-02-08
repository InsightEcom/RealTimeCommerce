2024-02-08 Fast API 진행 상황

거래 데이터 모델 (models.py)

이 코드는 거래 데이터를 위한 데이터베이스 모델을 정의합니다. 
SQLAlchemy ORM을 사용하여 각 필드(고유 ID, 거래 일시, 금액, 설명, 카테고리)를 데이터베이스 컬럼으로 매핑합니다.

거래 데이터 스키마 (schemas.py)

이 코드는 API 요청과 응답에서 사용될 거래 데이터 스키마를 정의합니다. Pydantic 라이브러리를 사용하여 데이터 유효성 검사와 직렬화를 자동화합니다. 
TransactionCreate는 거래 생성 시 사용되며, Transaction은 거래 데이터 조회 시 사용됩니다.

데이터베이스 연결 (database.py)

이 코드는 SQLAlchemy를 통해 데이터베이스 엔진과 세션을 설정합니다. 여기서는 SQLite 데이터베이스를 예로 사용했습니다. 
SessionLocal은 데이터베이스 작업을 위한 세션 팩토리를 생성합니다.

CRUD 작업 (crud.py)
이 코드는 거래 데이터에 대한 CRUD(Create, Read, Update, Delete) 작업을 수행하는 함수를 정의합니다. 
여기서는 생성(create_transaction)과 조회(get_transactions) 함수만 예로 들었습니다.

메인 애플리케이션 (main.py)
이 코드는 FastAPI를 사용하여 애플리케이션의 메인 라우트와 엔드포인트를 정의합니다. 
거래 데이터를 생성하고 조회하기 위한 엔드포인트(/transactions/)가 포함되어 있습니다. 
get_db 의존성은 각 요청에 대해 데이터베이스 세션을 생성하고 요청 처리 후 세션을 닫습니다.