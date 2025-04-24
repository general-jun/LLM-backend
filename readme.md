
# 📘 LLM-backend

> **Knowledge Management and Chat Service Using RAG and SAP AI Core**

---

## 🧩 프로젝트 개요

이 프로젝트는 **SAP BTP** 환경에서 **CAP (Cloud Application Programming) 모델**을 기반으로 구축된 **Knowledge Management 및 Chat 서비스**로, **SAP AI Core**와 **RAG 기법**을 활용하여 지식 검색 및 응답 기능을 제공해. 주요 구성 요소는 다음과 같아:

- **Backend (`srv/`)**: CAP 기반의 OData 서비스 및 비즈니스 로직 구현
- **Database (`db/`)**: HANA DB를 위한 HDI container 설정 및 데이터 모델링
- **Security (`xs-security.json`)**: XSUAA를 통한 인증 및 권한 관리 설정
- **Deployment (`mta.yaml`)**: MTA(Multi-Target Application) 배포 설정

---

## 🏗️ 폴더 구조

```
LLM-backend/
├── db/                 # HANA DB 모델 정의 (CDS)
├── srv/                # CAP 서비스 구현 (JavaScript)
├── test/               # 테스트 코드 및 샘플 데이터
├── mta.yaml            # MTA 배포 설정 파일
├── package.json        # Node.js 프로젝트 설정
├── xs-security.json    # XSUAA 보안 설정
├── .gitignore          # Git 무시 파일 목록
└── readme.md           # 프로젝트 설명서
```

---

## ⚙️ 기술 스택

- **SAP BTP**: 클라우드 플랫폼
- **CAP (Cloud Application Programming)**: 서비스 개발 프레임워크
- **SAP HANA**: 데이터베이스
- **SAP AI Core**: AI 모델 실행 및 관리
- **RAG (Retrieval-Augmented Generation)**: 지식 검색 기반 응답 생성
- **XSUAA**: 인증 및 권한 관리
- **MTA (Multi-Target Application)**: 배포 관리

---

## 🚀 실행 방법

1. **의존성 설치**

   ```bash
   npm install
   ```

2. **HANA DB 배포**

   ```bash
   cds deploy --to hana
   ```

3. **애플리케이션 실행**

   ```bash
   cds watch
   ```

4. **MTA 빌드 및 배포**

   ```bash
   mbt build
   cf deploy mta_archives/LLM-backend_1.0.0.mtar
   ```

---

## 🔐 인증 및 권한 관리

`xs-security.json` 파일을 통해 **XSUAA** 서비스를 설정하고, 사용자 역할 및 권한을 관리해. 이를 통해 애플리케이션의 보안을 강화하고, 사용자 접근을 제어할 수 있어.

---

## 🧠 RAG 및 SAP AI Core 통합

이 프로젝트는 **RAG(Retrieval-Augmented Generation)** 기법을 활용하여, 사용자 질문에 대해 관련 지식을 검색하고, 이를 기반으로 응답을 생성해. 또한, **SAP AI Core**를 통해 AI 모델을 실행하고 관리하여, 지능형 응답 기능을 제공해.

---

## 📄 참고 문서

- [SAP CAP 문서](https://cap.cloud.sap/docs/)
- [SAP AI Core 문서](https://help.sap.com/docs/ai-core/)
- [SAP BTP CLI 문서](https://help.sap.com/docs/btp-cli/)
- [SAP HANA 문서](https://help.sap.com/docs/hana-cloud/)
