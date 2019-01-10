var expect = require('chai').expect;
var dbConn = require('../src/module/sql');
var fs = require("fs");

describe('initDB()', function () {
  it('should init', function () {

    dbConn.initTables();

    // 2. ACT
    var tableFileCount = fs.getFileCountFrom("../src/sql");
    var tableDbCount = dbConn.getTableCount();

    // 3. ASSERT
    expect(tableFileCount).to.be.equal(tableDbCount);

  });
});
