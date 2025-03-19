CREATE SCHEMA IF NOT EXISTS server_game_schema;

CREATE TABLE IF NOT EXISTS server_game_schema.words(
	word TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS server_game_schema.game_sessions(
	game_uuid UUID PRIMARY KEY,
	user_uuid UUID,
	word_answer TEXT
);
-- https://github.com/alec-chicherini/wordle-data/blob/main/proto/enum_row_result.proto
CREATE TYPE server_game_schema.enum_row_result AS ENUM (
	'kNoneRowResult',
	'kWordDoNotExists',
	'kWordExists',
	'kWordIsAnswer',
	'kServerError',
	'kGameOver'
);

-- https://github.com/alec-chicherini/wordle-data/blob/main/proto/enum_the_char_color.proto
CREATE TYPE server_game_schema.enum_the_char_color AS ENUM (
	'kNoneTheCharColor',
	'kGreen',
	'kYellow'
);

CREATE TABLE IF NOT EXISTS server_game_schema.game_row_response(
	response_uuid UUID PRIMARY KEY DEFAULT gen_random_uuid() ,
	game_uuid UUID ,
	word_asked TEXT,
	result server_game_schema.enum_row_result,
	vec_colors server_game_schema.enum_the_char_color[5]
);
