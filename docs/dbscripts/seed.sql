
CREATE TABLE test
(
 id serial PRIMARY KEY,
 title VARCHAR (50) NOT NULL
);

ALTER TABLE test OWNER TO master;

Insert into test(title) values( 'Title 12');