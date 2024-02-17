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


## Python 구조
```bash
microservices/
│
├── app/                    # 애플리케이션 코드를 포함하는 메인 디렉토리
│   ├── __init__.py         # Python 패키지 초기화 파일
│   ├── main.py             # FastAPI 애플리케이션 인스턴스와 라우팅을 포함하는 파일
│   ├── dependencies.py     # 종속성을 관리하는 파일 (예: 데이터베이스 세션)
│   ├── models.py           # 데이터베이스 모델(Schema)을 정의하는 파일
│   ├── schemas.py          # Pydantic 모델을 정의하는 파일 (요청 및 응답 스키마)
│   ├── crud.py             # 데이터베이스 CRUD 연산을 위한 함수를 정의하는 파일
│   ├── database.py         # 데이터베이스 세션 및 엔진 설정을 포함하는 파일
│   └── routers/            # 각각의 엔드포인트 그룹을 위한 라우터 모듈을 포함하는 디렉토리
│       ├── __init__.py
│       ├── items.py
│       └── users.py
│
├── alembic/                # 데이터베이스 마이그레이션을 위한 Alembic 구성과 마이그레이션 파일
│   └── ...
│
├── tests/                  # 테스트 코드를 포함하는 디렉토리
│   ├── __init__.py
│   ├── test_main.py
│   └── ...
│
├── requirements.txt        # 프로젝트 종속성 목록
├── .env                    # 환경 변수 설정 파일
├── dockerfile              # Docker Build
└── README.md               # 프로젝트 설명 및 사용 방법을 기술하는 파일

```

## DockerFile
```bash
RealTimeCommerce/microservices
# Docker Build
$ docker build -t "프로젝트 명" .

# Docker Image 확인
$ docker images

# Docker Cantainer 실행
$ docker run -d --name 컨테이너명 -p 8000:8000 "프로젝트 명"

$ Docker Image 삭제
$ docker rmi "이미지 코드"
# 또는
$ docker rmi "프로젝트 명:태그" # 태그를 지정하지 않으면 기본적으로 latest가 사용됩니다.
```

## Python 종속성 pip 설치
```bash
# Python 가상 환경 생성 (선택사항)
$ python -m venv venv

# 가상 환경 활성화 (선택사항)
# Windows
$ venv\Scripts\activate

# macOS/Linux (선택사항)
$ source venv/bin/activate

# 의존성 설치
$ pip install --upgrade pip
$ pip install -r requirements.txt
```

## FastAPI 실행
```bash
C:\RealTimeCommerce\microservices

$ uvicorn app.main:app --reload
```

