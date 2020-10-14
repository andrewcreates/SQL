--Create practice tables and fill with data for Twitch interview review

CREATE TABLE minutes_streamed (
	time_minute TIMESTAMP,
	streamer_username VARCHAR,
	category VARCHAR,
	concurrent_viewers int);

CREATE TABLE minutes_viewed (
	time_minute TIME,
	viewer VARCHAR,
	viewer_country VARCHAR,
	streamer_username VARCHAR);

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'BOOP' AS streamer_username, 
				'Heroes of the Storm' AS category, 
				FLOOR(1 + 600 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'Lila' AS streamer_username, 
				'Farmville' AS category, 
				FLOOR(20 + 100 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'Lila' AS streamer_username, 
				'League of Legends' AS category, 
				FLOOR(20 + 500 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'FREEZA' AS streamer_username, 
				'DBZ Unlimited' AS category, 
				FLOOR(1000 + 500 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'Goku' AS streamer_username, 
				'DBZ Unlimited' AS category, 
				FLOOR(1000 + 500 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'Goku' AS streamer_username, 
				'DBZ Rewind' AS category, 
				FLOOR(1000 + 500 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'Kurapika' AS streamer_username, 
				'HXH' AS category, 
				FLOOR(300 + 1500 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM(
			SELECT GENERATE_SERIES(starttime, endtime, '1 minute') AS time_minute, 
				'Kurapika' AS streamer_username, 
				'Call Of Duty' AS category, 
				FLOOR(300 + 1000 * RANDOM()) AS concurrent_viewers
			FROM(
				SELECT starttime, DATE_TRUNC('minute', starttime + '2 hour'::interval * random()) AS endtime
				FROM (SELECT DATE_TRUNC('minute', '2018-01-01'::timestamp + '2 year'::interval * random()) AS starttime) start
				) startend
			) input

