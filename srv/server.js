const cds = require("@sap/cds");
const cors = require("cors");
const cds_swagger = require("cds-swagger-ui-express")

/**
 * 
 */
cds.on("bootstrap", (app) => {
    app.use(cors());
});
cds.on('bootstrap', app => app.use(cds_swagger()))

//
module.exports = cds.server;