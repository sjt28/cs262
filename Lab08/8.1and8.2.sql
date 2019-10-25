--8.1.a Retrieve all the games that occurred in the past week
--SELECT *
  --FROM Game
  --WHERE time > (NOW() - interval '7 days')
  --;

--8.1.b Retrieve a list of players who have (non-Null) Names
--SELECT *
  --From Player
  --WHERE name IS NOT NULL
  --;

--8.1.c Retrieve a list of IDs for all players who have some game score larger than 2000
--SELECT playerID
  --FROM PlayerGame
  --WHERE score > 2000
  --;

--8.1.d Retrieve a list of players who have GMail accounts
--SELECT *
  --FROM Player
  --WHERE emailAddress LIKE '%gmail%'

--8.2.a Retrieve all "The Kings"'s game scores in decreasing order.
--SELECT score
  --FROM PlayerGame, Player
  --WHERE Player.ID = PlayerGame.playerID
  --AND name = "The King"
  --ORDER BY DESC
  --;
--8.2.b Retrieve the name of the winner of the game played on 2006-06-28 13:20:20
-- SELECT Player.name
-- FROM PlayerGame, Player, Game
-- WHERE Player.ID = PlayerGame.playerID
-- AND Game.ID = PlayerGame.gameID
-- AND Game.time = "2006-06-28 13:20:20"
-- AND PlayerGame.Score = SELECT MAX(score) from playerGame
-- ;

--8.2.c So what does that P1.ID < P2.ID clause do in the last sample query?
  -- ANSWER: it checks that there are two different users with the same name

--8.2.d The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you'd wnat to join a table to itself?
  -- ANSWER: In cases where you'd want to check that there aren't duplicate entrys, or in the subpart example we did in class
