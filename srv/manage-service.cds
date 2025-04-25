using { kr.sap.demo.llm as db } from '../db/schema';

service ManageService @(requires: 'authenticated-user') {
    
    /**
     * 
     */
    entity SiteList as projection on db.SiteList;
    
    /**
     * 
     */
    entity ScrapChunk as
        projection on db.ScrapChunk
        excluding {
            embedding
        };
}