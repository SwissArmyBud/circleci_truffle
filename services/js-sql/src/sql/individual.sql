
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE individual (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	first_name text NOT NULL,
      	last_name text NOT NULL
      );
    `,
    addByName: `
      INSERT INTO individual (first_name, last_name)
        VALUES (?, ?);
    `,
    removeById: `
      DELETE FROM individual
        WHERE id = (?);
    `,
    removeById: `
      DELETE FROM individual
        WHERE first_name = (?)
          AND last_name = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE individual;
    `
  };
  self.fill = {
    init:[
      // EMPTY INIT
    ]
  }

  return self;

};
