using { kr.sap.demo.llm as db } from '../db/schema';

/**
 * 
 */
service ChatService @(requires: 'authenticated-user') {
    /**
     * - Conversation
     *   
     * - Message
     *   
     */
    entity Conversation @(restrict: [{
        grant: [
            'READ',
            'WRITE',
            'DELETE'
        ],
        where: 'userID = $user'
    }]) as projection on db.Conversation;
    entity Message as projection on db.Message;

    /**
     * - RagResponse_AdditionalContents
     *   
     * - RagResponse
     *   
     */
    type RagResponse_AdditionalContents {
        score: String;
        pageContent: String;
    }
    type RagResponse {
        role: String;
        content: String;
        messageTime: String;
        additionalContents: array of RagResponse_AdditionalContents;
    }

    /**
     * - Parameters
     *   conversationId: 
     *   messageId
     *   message_time:
     *   user_id:
     *   user_query:
     * - Description
     *   
     */
    action getChatRagResponse(
        conversationId: String,
        messageId: String,
        message_time: Timestamp,
        user_id: String,
        user_query: String
    ) returns RagResponse;
    
    /**
     * - Description
     *   
     */    
    function deleteChatData() returns String;
}