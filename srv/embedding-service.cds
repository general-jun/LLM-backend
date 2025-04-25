using { kr.sap.demo.llm as db } from '../db/schema';

/**
 * 
 */
service EmbeddingService @(requires: 'authenticated-user') {
    /**
     * - Files
     *   
     * - DocumentChunk
     *   
     */
    entity Files @(restrict: [{
        grant: [
            'READ',
            'WRITE',
            'UPDATE',
            'DELETE'
        ],
        where: 'createdBy = $user'
    }]) as projection on db.Files;
    entity DocumentChunk as projection on db.DocumentChunk
        excluding {
            embedding
        };

    /**
     * - Description
     *   
     */
    action storeEmbeddings(uuid: String) returns String;

    /**
     * - Description
     *   
     */
    function deleteEmbeddings() returns String;
}