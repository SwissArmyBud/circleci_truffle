
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;
  self.queries = {
    initTable: `
      CREATE TABLE player (
      	id integer PRIMARY KEY AUTOINCREMENT,
        linked integer NOT NULL,
      	type_id integer NOT NULL,
        FOREIGN KEY (type) REFERENCES playertype(id)
      );
    `,
    addByIndividualId: `
      INSERT INTO player (linked, type)
        VALUES (?, SELECT id
                    FROM playertype
                      WHERE description = "INDIVIDUAL_TYPE");
    `,
    addByTeamId: `
      INSERT INTO player (linked, type)
        VALUES (?, SELECT id
                    FROM playertype
                      WHERE description = "TEAM_TYPE");
    `,
    removeByIndividualId: `
      DELETE FROM player
        WHERE linked = (?)
          AND id = (SELECT id
                      FROM playertype
                        WHERE description = "INDIVIDUAL_TYPE");
    `,
    removeByIndividualId: `
      DELETE FROM player
        WHERE player_linked = (?)
          AND type_id = (SELECT id
                          FROM playertype
                            WHERE description = "TEAM_TYPE");
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE player;
    `
  };
  self.fill = {
    init:[
      // EMPTY INIT
    ]
  }

  return self;

};
