USE delivery_logistics;

CREATE OR REPLACE VIEW vw_overall_delivery_performance AS
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT trip_uuid) AS unique_trips,
    ROUND(AVG(actual_time), 2) AS avg_actual_time,
    ROUND(AVG(osrm_time), 2) AS avg_expected_time,
    ROUND(AVG(delay), 2) AS avg_delay,
    ROUND(
        100.0 * SUM(CASE WHEN delay > 0 THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS delayed_records_percentage
FROM delivery_data;

CREATE OR REPLACE VIEW vw_route_type_performance AS
SELECT
    route_type,
    COUNT(*) AS records,
    COUNT(DISTINCT trip_uuid) AS unique_trips,
    ROUND(AVG(actual_time), 2) AS avg_actual_time,
    ROUND(AVG(osrm_time), 2) AS avg_expected_time,
    ROUND(AVG(delay), 2) AS avg_delay
FROM delivery_data
GROUP BY route_type;

CREATE OR REPLACE VIEW vw_source_center_performance AS
SELECT
    source_center,
    COUNT(*) AS records,
    COUNT(DISTINCT trip_uuid) AS unique_trips,
    ROUND(AVG(delay), 2) AS avg_delay,
    ROUND(AVG(actual_time), 2) AS avg_actual_time
FROM delivery_data
GROUP BY source_center;

CREATE OR REPLACE VIEW vw_route_performance AS
SELECT
    source_center,
    destination_center,
    COUNT(*) AS records,
    COUNT(DISTINCT trip_uuid) AS unique_trips,
    ROUND(AVG(delay), 2) AS avg_delay,
    ROUND(AVG(actual_time), 2) AS avg_actual_time,
    ROUND(AVG(osrm_time), 2) AS avg_expected_time
FROM delivery_data
GROUP BY source_center, destination_center;
