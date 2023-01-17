USE role GROUSE_ROLE_C_ANALYTICS;
USE warehouse GROUSE_WH;
USE DATABASE GROUSE_DEID_ANALYTICS_DB; 

CREATE SCHEMA IF NOT EXISTS grouse_sema;
USE SCHEMA grouse_sema;




/*
Table 1: ingredient_level
    Names and rxcuis of all drugs in the database at the ingredient level
                Columns:
                    rxcui: (varchar)
                    name: (varchar)
*/
CREATE TABLE IF NOT EXISTS ingredient_level as
SELECT DISTINCT a.RXCUI, a.str as name
FROM "ONTOLOGY"."RXNORM"."RXNCONSO" a
WHERE a.tty = 'IN'
    AND a.sab = 'RXNORM';
    
    

/*
Table 2: semaglutide_rxcuis
    rxcuis for the lower level prescriptions of semaglutide
                Columns:
                    rxcui: (varchar)
                    name: (varchar)
*/
CREATE TABLE IF NOT EXISTS semaglutide_rxcuis AS
SELECT DISTINCT a.RXCUI, a.str AS name
FROM "ONTOLOGY"."RXNORM"."RXNCONSO" a
WHERE a.sab = 'RXNORM'
    AND a.str LIKE '%semaglutide%';
    

/*
Table 3: rxcuis_map
    rxcuis for the lower level prescriptions of semaglutide
    Potential - get from Python
                Columns:
                    ingredient_name: name of ingredient level (varchar)
                    rxcui_in: ingredient level rxcui (varchar)
                    rxcui_lower: lower level rxcui(varchar)
*/    

CREATE TABLE IF NOT EXISTS rxcuis_map (
    ingredient_name varchar,
    rxcui_in varchar,
    rxcui_lower varchar
); 


select * from rxcuis_map;
select * from semaglutide_rxcuis;