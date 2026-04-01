const cds = require("@sap/cds");

module.exports = async function () {
    let northwind = await cds.connect.to("northwind");

    this.before("READ","Books", function () {
        console.log("read triggered");

    });
    this.on("READ","Products", function (req){
        return northwind.run(req.query);
    });

    
};