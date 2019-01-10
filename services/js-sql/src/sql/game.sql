
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE game (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	home integer DEFAULT 0,
        away integer DEFAULT 0,
        winner integer DEFAULT NULL CHECK(winner = home OR winner = away),
        type integer NOT NULL,
        tournament integer NOT NULL,
        FOREIGN KEY home REFERENCES player(id),
        FOREIGN KEY away REFERENCES player(id),
        FOREIGN KEY type REFERENCES gametype(id),
        FOREIGN KEY tournament REFERENCES tournament(id)
      );
    `,
    addByHomeIdAndAwayIdAndTypeId: `
      INSERT INTO game (tournament, type, home, away)
        VALUES (?, ?, ?, ?);
    `,
    removeById: `
      DELETE FROM game
        WHERE id = (?);
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
