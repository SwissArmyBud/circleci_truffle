
var gameSQL = require("../sql/game.sql");
// var matchSQL = require("../sql/match.sql");
// var matchplayerSQL = require("../sql/matchplayer.sql");
// var playerSQL = require("../sql/player.sql");
// var teamSQL = require("../sql/team.sql");
// var teamplayerSQL = require("../sql/teamplayer.sql");

var Promise = require("promises");
var dbFramework = require("sqlBlueBird");
var dbConfig = require("../conf/sql.js")
module.exports = dbFramework.config(dbConfig.getCurrentOptions());
