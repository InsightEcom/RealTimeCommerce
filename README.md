# Real Time Commerce(RTC) AWS Cloud 기반 실시간 e-커머스 분석 대시보드

## Project Overview
**Real Time Commerce(RTC)** 는 실시간으로 e-커머스 거래 데이터를 처리하고 분석하여, 비즈니스 성능 지표를 추적하는 클라우드 기반 마이크로서비스 애플리케이션입니다. 

- **클라우드 인프라:** AWS를 사용하여 EC2 인스턴스, VPC, Subnets, Security Groups 등의 리소스를 구성하고, Terraform을 사용하여 인프라를 코드로 관리합니다.
- **마이크로서비스 아키텍처:** Python과 FastAPI로 구성된 마이크로서비스를 Docker 컨테이너로 배포하고, Kubernetes를 사용하여 오케스트레이션합니다.
- **모니터링 및 로깅:** Prometheus로 애플리케이션 및 인프라의 성능 모니터링을 구축하고, Grafana로 시각화하여 대시보드를 제공합니다.
- **CI/CD 파이프라인:** Jenkins를 활용하여 코드 변경 시 자동으로 빌드 및 배포되는 지속적 통합 및 배포 파이프라인을 구성합니다.

이 프로젝트는 **클라우드 리소스 관리**, **마이크로서비스 아키텍처 설계**, **DevOps** 및 **MLOps** 관행 적용 등 다양한 기술 영역을 포괄합니다.

또한, **데이터 처리 및 분석**, **실시간 모니터링**, **대시보드 제공**을 통해 비즈니스 가치를 창출하는 것을 목표로 합니다.


## Project Architecture Overview
1. **인프라 계층(AWS + Terraform)**
   - **EC2(Elastic Compute Cloud):** 애플리케이션 서버 또는 CI/CD 파이프라인을 위한 Jenkins 호스팅과 같은 작업에 사용될 수 있습니다.
   - **Virtual Private Cloud(VPC):** 프로젝트 리소스를 호스팅하여 보안과 격리를 보장하는 사설 네트워크입니다.
   - **AWS CloudWatch:** CloudWatch는 AWS 리소스 및 애플리케이션 모니터링에 필수적이며, 로그, 메트릭, 이벤트를 집계하여 종합적인 데이터 시각화를 제공합니다. 
   - **Elastic Kubernetes Service(EKS):** 컨테이너화된 애플리케이션을 실행하고 확장하기 위한 관리형 Kubernetes 서비스입니다.
   - **Relational Database Service(RDS) for MySQL:** 스토리지 요구 사항을 충족하는 관리형 관계형 데이터베이스 서비스입니다.
   - **Elastic Container Registry(ECR):** 컨테이너 이미지를 저장하고 관리하는 Docker 컨테이너 레지스트리입니다.
   - **Identity and Access Management(IAM):** AWS 서비스에 안전하게 액세스하기 위한 역할과 정책을 설정합니다.
   - **Elastic Load Balancer(ELB):** 수신 애플리케이션 트래픽을 여러 가용 영역의 EC2 인스턴스와 같은 여러 대상에 분산합니다.
  
3. **애플리케이션 계층(Python, FastAPI, Docker)**
   - **마이크로서비스:** 효율적이고 확장 가능한 웹 API를 위해 Python 및 FastAPI를 사용하여 마이크로서비스 집합
                       *(예: 사용자 관리, 제품 카탈로그, 주문 처리, 재고 관리)* 으로 비즈니스 로직을 구현합니다.
   - **컨테이너화:** 일관된 배포와 확장성을 위해 각 마이크로서비스를 Docker 컨테이너에 패키징합니다.

4. **CI/CD Pipeline(Jenkins)**
   - **소스 코드 관리:** 버전 제어를 위해 GitHub를 사용합니다.
   - **빌드 자동화:** 소스 코드에서 Docker 이미지를 빌드하도록 Jenkins 파이프라인을 설정합니다.
   - **지속적 배포:** 성공적인 빌드 및 테스트 시 Kubernetes 클러스터에 이미지 배포를 자동화합니다.
  
5. **모니터링 및 데이터 시각화(Prometheus, Grafana)**
   - **Prometheus:** 인프라와 애플리케이션 수준 모두에서 모니터링을 구현합니다. 마이크로서비스에서 측정항목을 스크랩하도록 Prometheus를 구성합니다.
   - **Grafana:** Prometheus의 측정항목을 시각화하려면 Grafana를 사용하세요. 전자상거래 측정항목에 대한 실시간 분석을 위한 대시보드를 설정하세요.

6. **네트워킹 및 보안**
   - **API 게이트웨이:** API 게이트웨이를 활용하여 API 트래픽을 관리, 보호, 모니터링합니다.
   - **보안 그룹:** AWS에서 보안 그룹을 정의하여 리소스에 대한 액세스를 제어합니다.

  
## 프로젝트 목표
1. 고성능 실시간 데이터 처리 및 분석 마이크로서비스 아키텍처 구축
2. AWS 클라우드 서비스를 활용한 확장 가능하고 유지보수가 쉬운 인프라 구성
3. 사용자 친화적인 분석 대시보드를 통한 비즈니스 인사이트 제공
4. 데이터 보호 및 클라우드 보안 최적화

## Steps for Implementation
1. **Terraform을 사용한 인프라 설정:**
   - Terraform을 사용하여 AWS 인프라를 코드로 정의합니다. 기본 단계로 EC2, Cloud Watch, VPC, EKS, RDS, ECR, IAM 역할 및 ELB를 프로비저닝합니다.
2. **마이크로서비스 개발:**
   - Python 및 FastAPI를 사용하여 각 마이크로서비스를 개발합니다. 손쉬운 유지 관리 및 확장성을 위해 깔끔한 모듈식 코드에 중점을 둡니다.
3. **컨테이너 및 레지스트리:**
   - 마이크로서비스를 컨테이너화하고 안전한 저장을 위해 이미지를 AWS ECR에 푸시합니다.
4. **CI/CD 파이프라인 구성:**
   - 자동화된 테스트, 빌드 및 Kubernetes 클러스터에 대한 Docker 이미지 배포를 위해 Jenkins 파이프라인을 구성합니다.
5. **모니터링 설정:**
   - Kubernetes 클러스터 내에 Prometheus를 배포하고 메트릭을 수집하도록 구성합니다. 대시보드 시각화를 위해 Grafana를 설정합니다.
6. **보안 및 네트워킹:**
   - 서비스 간 안전하고 효율적인 통신을 보장하기 위해 API 게이트웨이, 보안 그룹 및 필요한 경우 서비스 메시를 구성합니다.
  

## 기술 스텍
1. **클라우드 플랫폼:** Amazon Web Service
2. **인프라 코드 관리(IaC):** Terraform
3. **프로그래밍 언어:** Python
4. **웹 프레임워크:** FastAPI
5. **컨테이너화:** Docker
6. **컨테이너 오케스트레이션:** Kubernetes
7. **데이터베이스:** Amazon RDS (MySQL)
8. **모니터링:** Prometheus
9. **데이터 시각화:** Grafana
10. **CI/CD:** Jenkins

## 주요 기능
1. **데이터 수집 및 처리:** 실시간 거래 데이터 수집 및 처리를 통해, 실시간 분석을 가능하게 합니다.
2. **마이크로서비스 아키텍처:** 사용자 관리, 제품 카탈로그, 주문 처리, 재고 관리 등의 기능을 독립적인 서비스로 구현합니다.
3. **데이터 분석 및 시각화:** Grafana를 사용하여 수집된 데이터를 기반으로 한 인사이트를 시각적으로 제공합니다.
4. **보안 및 데이터 보호:** AWS 보안 그룹 및 VPC를 활용하여 데이터와 애플리케이션의 보안을 강화합니다.
5. **자동화된 CI/CD 파이프라인:** Jenkins를 사용하여 코드 변경 사항을 자동으로 빌드, 테스트 및 배포합니다.

## 프로젝트 구조
```bash
/project-root
    /microservices   # 마이크로서비스 코드
    /terraform       # Terraform을 이용한 인프라 코드
    /docker          # Dockerfile 및 컨테이너 관련 설정
    /kubernetes      # Kubernetes 디플로이먼트 및 서비스 구성 파일
    /grafana         # Grafana 대시보드 구성
    /prometheus      # Prometheus 모니터링 설정
    /jenkins         # Jenkins CI/CD 파이프라인 구성

```

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
└── README.md               # 프로젝트 설명 및 사용 방법을 기술하는 파일

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

uvicorn app.main:app --reload
```

## Terraform 설치 및 사용법

### 이 저장소를 클론합니다.
   ```bash
   git clone https://github.com/InsightEcom/RealTimeCommerce.git
   cd RealTimeCommerce
   ```

### Version
  ```bash
  Terraform > v1.7.1
  aws-cli > 2.15.14
  ```

### AWS Configuration
  ``` bash
  // AWS Access Key, Secret Key 구성
  aws configure
  
  // 설정 AWS IAM 액세스 key
  AWS Access Key ID [None] :
  AWS Secret Access Key [None] :
  Default region name [None] : ap-northeast-2(서울)
  Default output format [None] : json
  
  // 등록 확인
  aws configure list
  
  // 여러 AWS 계정과 아이디로 운용할 경우
  aws configure --profile [원하는 이름]
  ```

### Terraform install (Ubuntu)
  ``` bash
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform

  $ terraform version
  ```
### Terraform install (Windows)
  ``` bash
  https://developer.hashicorp.com/terraform/install?product_intent=terraform
  다운로드 후 시스템 환경 변수 등록.

  >> terraform version
  ```

### Terraform Apply(실행)
  ``` bash
  // AWS 서비스 실행
  >> terraform init

  >> terraform apply 또는 terraform apply --auto-approve
  ****--auto-approve 옵션 넣을 시 "Enter a value: yes" 없이 다이렉트로 진행****

  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
  
    Enter a value: yes
  
  aws_db_parameter_group.three_rds_parameter: Creating...
  aws_eip.three_tier_eip: Creating...
  aws_vpc.three_tier_vpc: Creating...
  aws_eip.three_tier_eip: Creation complete after 1s [id=eipalloc-04760dac1a7b62f52]
  aws_vpc.three_tier_vpc: Creation complete after 1s [id=vpc-046c4f6e1ad75ed38]
  aws_internet_gateway.three_tier_GateWay: Creating...
  .
  .
  .
  .
  aws_db_instance.three_rds: Still creating... [6m20s elapsed]
  aws_db_instance.three_rds: Still creating... [6m30s elapsed]
  aws_db_instance.three_rds: Creation complete after 6m40s [id=db-YX5ZZ4MD3A2EZRFAADEOADYXQ4]
  
  Apply complete! Resources: 28 added, 0 changed, 0 destroyed.
  
  Outputs: (Example)
  
  was_instance_id = "i-07f5xxxxxxxxxxx865"
  was_instance_private_ip = "10.0.x.xx"
  web_instance_eip = "43.xxx.xxx.187"
  web_instance_id = "i-0cxxxxxxxxx7e9"
  ```

### Terraform Destroy(리소스 삭제)
  ```bash
  // AWS 서비스(리소스) 삭제
  >> terraform destroy / terraform destroy --auto-approve
  ****--auto-approve 옵션 넣을 시 "Enter a value: yes" 없이 다이렉트로 진행****

  Do you really want to destroy all resources?
    Terraform will destroy all your managed infrastructure, as shown above.
    There is no undo. Only 'yes' will be accepted to confirm.
  
    Enter a value: yes
  
  aws_route_table_association.pub_c_assoc: Destroying... [id=rtbassoc-087353458dd2bc1a9]
  aws_eip.web_eip: Destroying... [id=eipalloc-0d04626ea6333192f]
  aws_route_table_association.rds_a_assoc: Destroying... [id=rtbassoc-001e0bfde6a2a3972]
  aws_route_table_association.pub_sub_route: Destroying... [id=rtbassoc-07a47f1377c73f216]
  aws_route_table_association.rds_c_assoc: Destroying... [id=rtbassoc-02f2c344589cd535e]
  aws_route_table_association.pri_c_assoc: Destroying... [id=rtbassoc-093e6caeee3c3d9c6]
  .
  .
  .
  .
  aws_subnet.Pri_subnet_A: Destruction complete after 0s
  aws_vpc.three_tier_vpc: Destroying... [id=vpc-046c4f6e1ad75ed38]
  aws_vpc.three_tier_vpc: Destruction complete after 1s
  
  Destroy complete! Resources: 28 destroyed.
  ```

### AWS 서비스(리소스) 삭제 확인
  ```bash
  EC2, EIP, RDS, VPC 등등 삭제 여부 확인
  ```

## Jenkins Container Password 및 접속 방법
``` bash
// 컨테이너로 젠킨스를 Pull을 했기 때문에 초기 비밀번호 확인법은 조금 다르다.
// Container NAMES Checking

$ sudo docker ps -a

// 비밀번호 확인

$ sudo docker logs [Container NAMES]
...
Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

a768ea935............ [초기 비밀번호]

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
...

// 젠킨스 서버 접속
[EC2 Public IP:8080]
```
