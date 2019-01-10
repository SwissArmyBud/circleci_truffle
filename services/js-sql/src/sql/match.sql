
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE match (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	game_id integer NOT NULL
      );
    `,
    add: `
      INSERT INTO match (game_id)
        VALUES (?);
    `,
    removeByMatchId: `
      DELETE FROM match
        WHERE id = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE match;
    `
  };
  self.fill = {
    init:[
      // EMPTY INIT
    ]
  }

  return self;

};
