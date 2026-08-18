CREATE DATABASE IF NOT EXISTS delivery_logistics;
USE delivery_logistics;

DROP TABLE IF EXISTS delivery_data;

CREATE TABLE delivery_data (
    trip_creation_time DATETIME NULL,
    route_schedule_uuid VARCHAR(100),
    route_type VARCHAR(30),
    trip_uuid VARCHAR(100),
    source_center VARCHAR(100),
    source_name VARCHAR(255),
    destination_center VARCHAR(100),
    destination_name VARCHAR(255),
    od_start_time DATETIME NULL,
    od_end_time DATETIME NULL,
    start_scan_to_end_scan FLOAT NULL,
    is_cutoff INT NULL,
    cutoff_factor FLOAT NULL,
    cutoff_timestamp DATETIME NULL,
    actual_distance_to_destination FLOAT NULL,
    actual_time FLOAT NULL,
    osrm_time FLOAT NULL,
    osrm_distance FLOAT NULL,
    segment_actual_time FLOAT NULL,
    segment_osrm_time FLOAT NULL,
    segment_osrm_distance FLOAT NULL,
    delay FLOAT NULL,
    day_of_week VARCHAR(20),
    start_hour INT NULL,
    delay_percentage FLOAT NULL,
    factor FLOAT NULL,
    data VARCHAR(100),
    is_cutoff_flag INT NULL
);
