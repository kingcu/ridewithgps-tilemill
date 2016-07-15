-- drop the id column from the table as we don't need it
ALTER TABLE srtm DROP COLUMN id;

-- drop any existing tables
DROP TABLE IF EXISTS srtm_contours_10m;
DROP TABLE IF EXISTS srtm_contours_50m;
DROP TABLE IF EXISTS srtm_contours_250m;

-- create the pyramid
CREATE TABLE srtm_contours_10m AS (
  SELECT * FROM srtm WHERE ((ele % 10) = 0)
);
VACUUM ANALYZE srtm_contours_10m;

CREATE TABLE srtm_contours_50m AS (
  SELECT * FROM srtm_contours_10m WHERE ((ele % 50) = 0)
);
VACUUM ANALYZE srtm_contours_50m;

CREATE TABLE srtm_contours_250m AS (
  SELECT * FROM srtm_contours_50m WHERE ((ele % 250) = 0)
);
VACUUM ANALYZE srtm_contours_250m;

-- this table isn't really needed anymore more
-- if you are planning to use it for other things though you may want to
-- keep it
--DROP TABLE srtm;

-- create geometry indexes
CREATE INDEX srtm_contours_10m_geom_idx
  ON srtm_contours_10m
  USING gist
  (wkb_geometry);

CREATE INDEX srtm_contours_50m_geom_idx
  ON srtm_contours_50m
  USING gist
  (wkb_geometry);

CREATE INDEX srtm_contours_250m_geom_idx
  ON srtm_contours_250m
  USING gist
  (wkb_geometry);


-- ensure we have the proper PostGIS metadata for these tables
INSERT INTO geometry_columns(f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, "type") VALUES ('', 'public', 'srtm_contours_10m', 'wkb_geometry', 2, 900913, 'LINESTRING');
INSERT INTO geometry_columns(f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, "type") VALUES ('', 'public', 'srtm_contours_50m', 'wkb_geometry', 2, 900913, 'LINESTRING');
INSERT INTO geometry_columns(f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, "type") VALUES ('', 'public', 'srtm_contours_250m', 'wkb_geometry', 2, 900913, 'LINESTRING');

