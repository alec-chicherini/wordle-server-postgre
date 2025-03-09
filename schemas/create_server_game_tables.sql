CREATE SCHEMA IF NOT EXISTS server_game_schema;

CREATE TABLE IF NOT EXISTS server_game_schema.words(
	word TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS server_game_schema.game_sessions(
	game_uuid UUID PRIMARY KEY,
	user_uuid UUID,
	word_answer TEXT
);
