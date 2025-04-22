using { kr.sap.demo.llm as db } from '../db/schema';

service ManageService @(requires: 'authenticated-user') {
    /**
     * 
     */
    entity ScrapChunk as
        projection on db.ScrapChunk
        excluding {
            embedding
        };

    /**
     * 
     */
    function invokeScraping(urlCode: String) returns Boolean;
}