namespace kr.sap.demo.llm;

using { cuid, managed } from '@sap/cds/common';

/**
 * 대화명
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
 * 대화 메시지
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
 * Description: 사용자가 업로드한 파일의 정보 및 Binary data
 */
entity Files: cuid, managed {
    @Core.MediaType: mediaType @Core.ContentDisposition.Filename: fileName
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: String;
}

/**
 * Table: KR_SAP_DEMO_LLM_DOCUMENTCHUNK
 * Description: 사용자가 업로드한 파일에 대한 Chunk 및 Vector data
 */
entity DocumentChunk: cuid {
    text_chunk: LargeString;
    metadata_column: LargeString;
    embedding: Vector(1536);
}

/**
 * Table: KR_SAP_DEMO_LLM_SCRAPCHUNK
 * Description: SAP Community(Technology - Q&A, Blogs)에서 Scrapping한 정보 및 Vector data
 */
 entity ScrapChunk: cuid {
    key checksum: String;
    key tag: String;
    title: String;
    url: String;
    summary: String;
    posted_date: String;
    author: String;
    views: Int16;
    comments: Int16;
    embedded: Boolean default false;
    embedding: Vector(1536)
 }