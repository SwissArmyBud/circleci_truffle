
var moduleSelf = this;
var self = null;

module.exports = self || ()=>{

  self = moduleSelf;
  self.queries = {
    initTable: `
      CREATE TABLE teamrole (
      	id integer PRIMARY KEY AUTOINCREMENT,
      	description text NOT NULL UNIQUE
      );
    `,
    add: `
      INSERT INTO teamrole (description)
        VALUES (?);
    `,
    removeById: `
      DELETE FROM teamrole
        WHERE id = (?);
    `,
    removeByName: `
      DELETE FROM teamrole
        WHERE decription = (?);
    `,
    DANGER_dropTable_DANGER: `
      DROP TABLE teamrole
    `
  };
  self.fill = {
    init:[
      {
        method: "add",
        value: ["MANAGER_TYPE"]
      },
      {
        method: "add",
        value: ["COMPETITOR_TYPE"]
      },
      {
        method: "add",
        value: ["COACH_TYPE"]
      }
    ]
  }

  return self;

};
