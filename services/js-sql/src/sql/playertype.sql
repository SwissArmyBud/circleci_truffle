
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE playertype (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	description text NOT NULL UNIQUE
      );
    `,
    add: `
      INSERT INTO playertype (description)
        VALUES (?);
    `,
    removeById: `
      DELETE FROM playertype
        WHERE id = (?);
    `,
    removeById: `
      DELETE FROM playertype
        WHERE description = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE playertype;
    `
  };
  self.fill = {
    init:[
      {
        method: "add",
        value: ["INDIVIDUAL_TYPE"]
      },
      {
        method: "add",
        value: ["TEAM_TYPE"]
      },
      {
        method: "add",
        value: ["SQUAD_TYPE"]
      }
    ]
  }

  return self;

};
