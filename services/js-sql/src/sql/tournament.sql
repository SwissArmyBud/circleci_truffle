
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE tournament (
      	id integer PRIMARY KEY AUTOINCREMENT,
        name text NOT NULL,
        description text NOT NULL,
        series_id integer NULL,
        season_id integer NULL,
        FOREIGN KEY series_id REFERENCES series(id),
        FOREIGN KEY season_id REFERENCES season.id
      );
    `,
    add: `
      INSERT INTO tournament (name, description, season_id, series_id)
        VALUES (?, ?, ?, ?);
    `,
    removeById: `
      DELETE FROM tournament
        WHERE id = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE tournament;
    `
  };
  self.fill = {
    init:[
      // EMPTY INIT
    ]
  }

  return self;

};
