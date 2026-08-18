USE delivery_logistics;

-- 1. Overall delivery performance
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT trip_uuid) AS unique_trips,
    ROUND(AVG(actual_time), 2) AS avg_actual_time,
    ROUND(AVG(osrm_time), 2) AS avg_expected_time,
    ROUND(AVG(delay), 2) AS avg_delay,
    ROUND(100.0 * SUM(CASE WHEN delay > 0 THEN 1 ELSE 0 END) / COUNT(*), 2)
        AS delayed_records_percentage
FROM delivery_data;

-- 2. Route type performance
SELECT
    route_type,
    COUNT(*) AS records,
    COUNT(DISTINCT trip_uuid) AS unique_trips,
    ROUND(AVG(actual_time), 2) AS avg_actual_time,
    ROUND(AVG(osrm_time), 2) AS avg_expected_time,
    ROUND(AVG(delay), 2) AS avg_delay
FROM delivery_data
GROUP BY route_type
ORDER BY avg_delay DESC;

-- 3. Top 10 source centers by average delay
SELECT
    source_center,
    COUNT(*) AS records,
    ROUND(AVG(delay), 2) AS avg_delay
FROM delivery_data
GROUP BY source_center
ORDER BY avg_delay DESC
LIMIT 10;

-- 4. Top 10 source-to-destination routes by average delay
SELECT
    source_center,
    destination_center,
    COUNT(*) AS records,
    ROUND(AVG(delay), 2) AS avg_delay
FROM delivery_data
GROUP BY source_center, destination_center
HAVING COUNT(*) >= 5
ORDER BY avg_delay DESC
LIMIT 10;

-- 5. Average delay by day of week
SELECT
    day_of_week,
    COUNT(*) AS records,
    ROUND(AVG(delay), 2) AS avg_delay
FROM delivery_data
GROUP BY day_of_week
ORDER BY avg_delay DESC;

-- 6. Average delay by start hour
SELECT
    start_hour,
    COUNT(*) AS records,
    ROUND(AVG(delay), 2) AS avg_delay
FROM delivery_data
GROUP BY start_hour
ORDER BY start_hour;

-- 7. Distance versus actual delivery time
SELECT
    ROUND(AVG(actual_distance_to_destination), 2) AS avg_distance,
    ROUND(AVG(actual_time), 2) AS avg_actual_time
FROM delivery_data;

-- 8. Extreme-delay records
SELECT
    COUNT(*) AS extreme_delay_records,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM delivery_data), 2)
        AS extreme_delay_percentage
FROM delivery_data
WHERE delay > 586;
