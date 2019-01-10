
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE gametype (
      	id integer PRIMARY KEY AUTOINCREMENT,
        description text NOT NULL
      );
    `,
    add: `
      INSERT INTO gametype (description)
        VALUES (?);
    `,
    removeById: `
      DELETE FROM gametype
        WHERE id = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE gametype;
    `
  };
  self.fill = {
    init:[
      {
        method: "add",
        value: ["SINGLE_ELIMINATION"]
      },
      {
        method: "add",
        value: ["BEST_OF_THREE"]
      }
    ]
  }

  return self;

};
