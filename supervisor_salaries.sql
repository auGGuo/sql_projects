CREATE TABLE supervisor_salaries (
town varchar(30),
county varchar(30),
supervisor varchar(30),
start_date date,
salary money,
benefits money
);

# Load selective (available) columns into the table 
COPY supervisor_salaries (town, supervisor, salary)
FROM '/Users/augustguo/Desktop/Postgres/practical_sql/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

# Delete the already imported supervisor salary data
DELETE FROM supervisor_salaries;

# Use temporary table to insert default values 
CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

COPY supervisor_salaries_temp (town, supervisor, salary)
FROM '/Users/augustguo/Desktop/Postgres/practical_sql/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

# Use COPY to export data







