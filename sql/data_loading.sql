USE delivery_logistics;

-- Load the cleaned CSV after verifying the column order matches schema.sql.
-- Update the local file path for your MySQL installation.

LOAD DATA LOCAL INFILE 'data/processed/delhivery_cleaned.csv'
INTO TABLE delivery_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
