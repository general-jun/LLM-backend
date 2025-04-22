module.exports = function () {
    this.on('invokeScraping', async (req) => {
        try {
            let urlCode, serviceUrl, invokeResult;

            urlCode = req.data.urlCode || "BLOG";

            serviceUrl = cds.env.requires["JOBSCHEDULER_URL"] + `/api/scrap?urlCode${urlCode}`;
            invokeResult = await axios.get(serviceUrl, {
              headers: {
                "User-Agent": "Chrome/135.0.0.0"
              }
            });
            return {
                code: "200",
                message: `Scraping Success: ${result.data.msg}`
            };
        } catch (error) {
            req.error(500, `Scraping Failed: ${error.message}`);
        }
    })
}