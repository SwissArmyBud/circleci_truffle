
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;

  self.queries = {
    // TODO - Add constraint system to ensure matchplayer is sub of match player
    initTable: `
      CREATE TABLE matchplayer (
      	player integer NOT NULL,
      	match integer NOT NULL,
        FOREIGN KEY (player) REFERENCES player.id,
        FOREIGN KEY (match) REFRERENCES match.id
      );
    `,
    addPlayerIdToMatchId: `
      INSERT INTO matchplayer (player, match)
        VALUES (?, ?);
    `,
    removePlayerIdFromMatchId: `
      DELETE FROM matchplayer
        WHERE player = (?)
          AND match = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE matchplayer;
    `
  };
  self.fill = {
    init:[
      // EMPTY INIT
    ]
  }

  return self;

};
