namespace kr.sap.demo.llm;

using { cuid, managed } from '@sap/cds/common';

/**
 * Table: KR_SAP_DEMO_LLM_CONVERSATION
 * Description: 대화 정보
 */
entity Conversation {
    key cID : UUID not null;
    userID: String;
    creation_time: Timestamp;
    last_update_time: Timestamp;
    title: String;
    to_messages: Composition of many Message on to_messages.cID = $self;
}

/**
 * Table: KR_SAP_DEMO_LLM_MESSAGE
 * Description: 대화 메시지
 */
entity Message {
    key cID: Association to Conversation;
    key mID: UUID not null;
    role: String;
    content: LargeString;
    creation_time: Timestamp;
}

/**
 * Table: KR_SAP_DEMO_LLM_FILES
 * Description: 사용자가 업로드한 파일의 정보 및 Binary
 */
entity Files: cuid, managed {
    @Core.MediaType: mediaType
    @Core.ContentDisposition.Filename: fileName
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: String;
}

/**
 * Table: KR_SAP_DEMO_LLM_DOCUMENTCHUNK
 * Description: 사용자가 업로드한 파일에 대한 Chunk 및 Vector
 */
entity DocumentChunk: cuid {
    text_chunk: LargeString;
    metadata_column: LargeString;
    embedding: Vector(1536);
}

/**
 * Table: KR_SAP_DEMO_LLM_SITELIST
 * Description: Scrapping 사이트
 */
entity SiteList {
    key url_code: String not null;
    description: String;
    url: String;
}

/**
 * Table: KR_SAP_DEMO_LLM_SCRAPCHUNK
 * Description: Scrapping 데이터
 */
 entity ScrapChunk {
    key url_code: String not null;
    key checksum: String not null;
    title: LargeString;
    posted_date: Date;
    content: LargeString;
    embedded: Boolean default false;
    embedding: Vector(1536)
 }