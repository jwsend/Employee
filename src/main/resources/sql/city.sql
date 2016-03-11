DROP TABLE CITY;

CREATE TABLE City (
  ID NUMERIC(11) NOT NULL,
  Name CHAR(35 char) NOT NULL,
  CountryCode CHAR(3 char) NOT NULL,
  District CHAR(20 char) NOT NULL,
  Population NUMERIC(11) NOT NULL,
  CONSTRAINT pk_city_id PRIMARY KEY (ID)
);


drop sequence city_id_generator;

create sequence city_id_generator start with 4080;

select city_id_generator.nextVal from dual;



select * from city where id=1331;

select outer.* from ( select rownum r, inner.* from ( select * from city order by id desc ) inner ) outer where outer.r >= 1 and outer.r <= 1331;

