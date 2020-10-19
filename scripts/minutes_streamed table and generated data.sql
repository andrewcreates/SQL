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


WITH latest AS(
	SELECT MAX(time_minute) + ('2 day'::interval * random()) AS next_start, 
		streamer_username, 
		category, 
		CEIL(AVG(concurrent_viewers)) AS avg_concurrent,
		CEIL(stddev(concurrent_viewers)) AS std_dev_concurrent
	FROM minutes_streamed
	GROUP BY category, streamer_username
	ORDER BY MAX(time_minute)
	)
	
SELECT DATE_TRUNC('minute', GENERATE_SERIES(next_start, next_start + ('3 hours'::interval * random()), '1 minute')) AS time_minute,
	streamer_username,
	category,
	FLOOR(avg_concurrent + (2*RANDOM() - 1) * std_dev_concurrent)
FROM latest
WHERE streamer_username = 'Gon' AND category = 'HXH'


WITH RECURSIVE series AS(
	SELECT MAX(time_minute) + ('7 day'::interval * random()) AS next_start,
		streamer_username,
		category,
		CEIL(AVG(concurrent_viewers)) AS avg_concurrent,
		CEIL(stddev(concurrent_viewers)) AS std_dev_concurrent		
	FROM minutes_streamed
	GROUP BY streamer_username, category
	
	UNION ALL
	
	SELECT next_start  + ('7 day'::interval * random()) AS next_start,
		streamer_username,
		category,
		avg_concurrent,
		std_dev_concurrent
	FROM series
	WHERE next_start < '2018-04-01'::TIMESTAMP
	
	)

INSERT INTO minutes_streamed (time_minute, streamer_username, category, concurrent_viewers)
		SELECT *
		FROM (
			SELECT DATE_TRUNC('minute', GENERATE_SERIES(next_start, next_start + ('3 hours'::interval * random()), '1 minute')) AS time_minute,
					streamer_username,
					category,
					FLOOR(avg_concurrent + (4*RANDOM() - 2) * std_dev_concurrent)
			FROM series
			WHERE streamer_username = 'Gon' AND category = 'HXH') input