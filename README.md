# Real Time Commerce(RTC) AWS Cloud 기반 실시간 e-커머스 분석 대시보드

## Project Overview
**Real Time Commerce(RTC)**는 실시간으로 e-커머스 거래 데이터를 처리하고 분석하여, 비즈니스 성능 지표를 추적하는 클라우드 기반 마이크로서비스 애플리케이션입니다. 

이 대시보드는 판매 추세, 고객 행동, 재고 수준 등의 중요한 비즈니스 인사이트를 제공하여, e-커머스 사업의 데이터 기반 결정을 지원합니다.


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
