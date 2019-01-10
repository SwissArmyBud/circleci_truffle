
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    initTable: `
      CREATE TABLE teamplayer (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	team_id integer NOT NULL,
        individual_id integer NOT NULL,
        teamrole_id integer NOT NULL,
        FOREIGN KEY (team_id) REFERENCES team(id),
        FOREIGN KEY (individual_id) REFERENCES individual(id),
        FOREIGN KEY (teamrole_id) REFERENCES teamrole(id)
      );
    `,
    addTeamIndividualRole: `
      INSERT INTO teamplayer (id, id, id)
        VALUES (?, ?, ?);
    `,
    removeFromTeamIdByIndividualId: `
      DELETE FROM teamplayer
        WHERE id = (?)
          AND id = (?);
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
