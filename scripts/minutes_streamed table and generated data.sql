--Create practice tables and fill with data for Twitch interview review

CREATE TABLE minutes_streamed (
	time_minute TIMESTAMP,
	streamer_username VARCHAR,
	category VARCHAR,
	concurrent_viewers int);

CREATE TABLE minutes_viewed (
	time_minute TIMESTAMP,
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


WITH streams AS(
		SELECT time_minute, streamer_username, 
		ROW_NUMBER() OVER(PARTITION BY streamer_username ORDER BY time_minute) AS rn,
		time_minute - (ROW_NUMBER() OVER(PARTITION BY streamer_username ORDER BY time_minute) || ' minute')::INTERVAL AS grp
		FROM minutes_streamed
		GROUP BY time_minute, streamer_username
		ORDER BY time_minute, streamer_username
	),
	groups AS (
		SELECT grp, streamer_username, MAX(rn) - MIN(rn) AS minutes
		FROM streams
		GROUP BY grp, streamer_username
		ORDER BY grp
	)

INSERT INTO minutes_viewed (time_minute, viewer, viewer_country, streamer_username)
	SELECT *
	FROM(
		SELECT GENERATE_SERIES(grp, grp + (FLOOR(minutes*random()) || ' minute')::interval,'1 minute'),
			'Asahi' AS viewer,
			'Japan' AS viewer_country,
			streamer_username
		FROM groups
		WHERE streamer_username = 'Leorio') input



Question 2: Write a query that returns a row for each streamer with columns for their total hours streamed (in any category) and percentage of hours streamed in a Call of Duty game category.

WITH hours_streamed AS(
	SELECT streamer_username, 
		COUNT(*)/60 AS tot_hours_streamed, 
		(COUNT(*) FILTER(WHERE INITCAP(category) LIKE 'Call Of Duty%'))/60 AS COD_hours_streamed
	FROM minutes_streamed
	GROUP BY streamer_username
	)
	
SELECT streamer_username,
	tot_hours_streamed,
	to_char(COD_hours_streamed::numeric/tot_hours_streamed*100,'990D99%') AS perc_COD
FROM hours_streamed
GROUP BY streamer_username, COD_hours_streamed, tot_hours_streamed

Question 3: For each calendar month, output the list of streamers who increased their hours streamed from the previous calendar month

WITH names AS (
		SELECT DISTINCT streamer_username AS name
		FROM minutes_streamed
	),
	months AS(
		SELECT GENERATE_SERIES(MIN(DATE_TRUNC('month', time_minute)) - '1 month'::INTERVAL, MAX(DATE_TRUNC('month', time_minute)), '1 month'::interval) AS month,
		name
		FROM minutes_streamed
		CROSS JOIN names
		GROUP BY name
	),
	hours_streamed AS(
		SELECT m.month, m.name, 
			COUNT(*)/60 AS tot_hours_streamed, 
			LAG(COUNT(*)/60, 1) OVER(PARTITION BY m.name ORDER BY m.month) AS prev_months_hours
		FROM months m
		LEFT OUTER JOIN minutes_streamed ms ON DATE_TRUNC('month', ms.time_minute) = m.month AND ms.streamer_username = m.name
		GROUP BY m.month, m.name
		ORDER BY m.month
	)

SELECT m.month, string_agg(h.name, ', ') FILTER (WHERE h.prev_months_hours < h. tot_hours_streamed) AS streamer_list
FROM hours_streamed h
RIGHT OUTER JOIN months m ON m.month = h.month AND m.name = h.name
GROUP BY m.month
ORDER BY m.month

Question 4: for each streamer, columns with average concurrent viewers, total minutes viewed from Japan

SELECT s.streamer_username, FLOOR(AVG(concurrent_viewers)) AS avg_concurrent_viewers, COUNT(v.*) FILTER (WHERE v.viewer_country = 'Japan') AS jpn_mins
FROM minutes_streamed s
INNER JOIN minutes_viewed v ON s.streamer_username = v.streamer_username AND s.time_minute = v.time_minute
GROUP BY s.streamer_username
ORDER BY s.streamer_username