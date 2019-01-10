
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE team (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	name text NOT NULL UNIQUE,
        creation DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    `,
    addByName: `
      INSERT INTO team (name)
        VALUES (?);
    `,
    removeById: `
      DELETE FROM team
        WHERE id = (?);
    `,
    removeByName: `
      DELETE FROM team
        WHERE name = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE team;
    `
  };
  self.fill = {
    init:[
      // EMPTY INIT
    ]
  }

  return self;

};
