
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE tournamenttype (
      	id integer PRIMARY KEY AUTOINCREMENT,
        description text NOT NULL
      );
    `,
    add: `
      INSERT INTO tournamenttype (description)
        VALUES (?);
    `,
    removeById: `
      DELETE FROM tournamenttype
        WHERE id = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE tournamenttype;
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
        value: ["SWISS_ROUNDS"]
      }
    ]
  }

  return self;

};
