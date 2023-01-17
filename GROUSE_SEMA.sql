USE role GROUSE_ROLE_C_ANALYTICS;
USE warehouse GROUSE_WH;
USE DATABASE GROUSE_DEID_ANALYTICS_DB; 

CREATE SCHEMA IF NOT EXISTS grouse_sema;
USE SCHEMA grouse_sema;


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/    

/* Code to create key of Semaglutide Prescriptions for all GROUSE sites */
/*
Table: site_sema_info
    Semaglutide prescription information for all sites
                Columns:
                    patid: (varchar)
                    min_date: (date)
                    max_date: (date)
                    counts: (number)
                    weeks: (number)
*/

/* ALLINA */ 
CREATE TABLE allina_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_end_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_end_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;
   
    
/* IHC  - they cap */    
CREATE TABLE ihc_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_end_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_end_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


        
        
/* KUMC */    
CREATE TABLE kumc_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* MCRI */    
CREATE TABLE mcri_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;



/* MCW */    
CREATE TABLE mcw_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* MU */    
CREATE TABLE mu_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* UIOWA */    
CREATE TABLE uiowa_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* UNMC */    
CREATE TABLE unmc_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* UTHOUSTON */    
CREATE TABLE uthouston_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_order_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_order_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* UTHSCSA */    
CREATE TABLE uthscsa_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_end_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_end_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3; 
    


/* UTSW */    
CREATE TABLE utsw_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_end_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_end_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;


/* UU */   
CREATE TABLE uu_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_end_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_end_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    HAVING counts >=3;


/* WASHU - also cap*/    
CREATE TABLE washu_sema_info AS 
    SELECT patid,
           MIN(rx_order_date) AS min_date,
           MAX(rx_end_date) AS max_date,
           COUNT(prescribingid) AS counts,
           DATEDIFF(week, MIN(rx_order_date), MAX(rx_end_date)) AS weeks
    FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_PRESCRIBING
    WHERE rxnorm_cui IN (SELECT rxcui 
                         FROM semaglutide_rxcuis)
    GROUP BY patid
    HAVING weeks >= 12
    AND counts >=3;



/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/    

/* Now creating the Weight Tables */
/* Allina */ 
CREATE TABLE allina_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from allina_sema_info);

/* IHC */
CREATE TABLE ihc_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from ihc_sema_info);
      
      
/* KUMC */
CREATE TABLE kumc_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from kumc_sema_info);
      
      
/* MCRI */
CREATE TABLE MCRI_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from mcri_sema_info);

/* MCW */
CREATE TABLE mcw_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from mcw_sema_info);
      
      
/* MU */
CREATE TABLE mu_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND vital.wt > 13 
      AND vital.wt < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from mu_sema_info);

/* UIOWA */
CREATE TABLE uiowa_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from uiowa_sema_info);
      
      
/* UNMC */
CREATE TABLE unmc_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from unmc_sema_info);

/* UTHOUSTON */
CREATE TABLE uthouston_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from uthouston_sema_info);
      
      
/* UTHSCSA */
CREATE TABLE UTHSCSA_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from UTHSCSA_sema_info);

/* UTSW */
CREATE TABLE utsw_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from utsw_sema_info);
      
      
/* UU */ 
CREATE TABLE uu_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from uu_sema_info);

/* WASHU */
CREATE TABLE washu_weight AS
  SELECT vital.vitalid, 
          vital.measure_date,
          vital.wt,
          vital.patid
  FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_VITAL vital
  INNER JOIN GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_DEMOGRAPHIC demo
      ON vital.patid=demo.patid
  WHERE DATEDIFF(year, demo.birth_date, vital.measure_date)>=18
      AND TRY_CAST(vital.wt as NUMBER) > 13 
      AND TRY_CAST(vital.wt as NUMBER) < 1000
      AND vital.wt IS NOT NULL
      AND vital.patid = ANY(SELECT patid from washu_sema_info);



/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/       

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------Getting Semaglutide and Weight Change Info------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*ALLINA*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/ 
CREATE TABLE allina_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM allina_weight wts
    INNER JOIN allina_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid; 


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/ 
CREATE TABLE allina_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM allina_weight wts
    INNER JOIN allina_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid; 



/* Complete Semaglutide and Weight Change data */ 
CREATE TABLE allina_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM allina_weight wts
        INNER JOIN allina_init_date init
            on wts.patid=init.patid
        INNER JOIN allina_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM allina_weight wts
        INNER JOIN allina_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;


 
 
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*IHC*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE ihc_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM ihc_weight wts
    INNER JOIN ihc_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE ihc_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM ihc_weight wts
    INNER JOIN ihc_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE ihc_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM ihc_weight wts
        INNER JOIN ihc_init_date init
            on wts.patid=init.patid
        INNER JOIN ihc_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM ihc_weight wts
        INNER JOIN ihc_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*KUMC*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE kumc_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM kumc_weight wts
    INNER JOIN kumc_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE kumc_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM kumc_weight wts
    INNER JOIN kumc_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE kumc_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM kumc_weight wts
        INNER JOIN kumc_init_date init
            on wts.patid=init.patid
        INNER JOIN kumc_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM kumc_weight wts
        INNER JOIN kumc_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*MCRI*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE mcri_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM mcri_weight wts
    INNER JOIN mcri_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE mcri_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM mcri_weight wts
    INNER JOIN mcri_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE mcri_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM mcri_weight wts
        INNER JOIN mcri_init_date init
            on wts.patid=init.patid
        INNER JOIN mcri_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM mcri_weight wts
        INNER JOIN mcri_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*MCW*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE mcw_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM mcw_weight wts
    INNER JOIN mcw_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE mcw_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM mcw_weight wts
    INNER JOIN mcw_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE mcw_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM mcw_weight wts
        INNER JOIN mcw_init_date init
            on wts.patid=init.patid
        INNER JOIN mcw_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM mcw_weight wts
        INNER JOIN mcw_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*MU*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE mu_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM mu_weight wts
    INNER JOIN mu_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE mu_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM mu_weight wts
    INNER JOIN mu_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE mu_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM mu_weight wts
        INNER JOIN mu_init_date init
            on wts.patid=init.patid
        INNER JOIN mu_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM mu_weight wts
        INNER JOIN mu_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*UIOWA*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE uiowa_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM uiowa_weight wts
    INNER JOIN uiowa_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE uiowa_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM uiowa_weight wts
    INNER JOIN uiowa_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE uiowa_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM uiowa_weight wts
        INNER JOIN uiowa_init_date init
            on wts.patid=init.patid
        INNER JOIN uiowa_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM uiowa_weight wts
        INNER JOIN uiowa_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*UNMC*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE unmc_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM unmc_weight wts
    INNER JOIN unmc_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE unmc_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM unmc_weight wts
    INNER JOIN unmc_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE unmc_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM unmc_weight wts
        INNER JOIN unmc_init_date init
            on wts.patid=init.patid
        INNER JOIN unmc_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM unmc_weight wts
        INNER JOIN unmc_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*UTHOUSTON*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE uthouston_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM uthouston_weight wts
    INNER JOIN uthouston_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE uthouston_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM uthouston_weight wts
    INNER JOIN uthouston_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE uthouston_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM uthouston_weight wts
        INNER JOIN uthouston_init_date init
            on wts.patid=init.patid
        INNER JOIN uthouston_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM uthouston_weight wts
        INNER JOIN uthouston_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*UTHSCSA*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE uthscsa_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM uthscsa_weight wts
    INNER JOIN uthscsa_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE uthscsa_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM uthscsa_weight wts
    INNER JOIN uthscsa_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE uthscsa_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM uthscsa_weight wts
        INNER JOIN uthscsa_init_date init
            on wts.patid=init.patid
        INNER JOIN uthscsa_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM uthscsa_weight wts
        INNER JOIN uthscsa_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*UTSW*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE utsw_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM utsw_weight wts
    INNER JOIN utsw_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE utsw_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM utsw_weight wts
    INNER JOIN utsw_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE utsw_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM utsw_weight wts
        INNER JOIN utsw_init_date init
            on wts.patid=init.patid
        INNER JOIN utsw_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM utsw_weight wts
        INNER JOIN utsw_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;

select * from utsw_info;
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 


/*UU*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/ 
CREATE TABLE uu_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM uu_weight wts
    INNER JOIN uu_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE uu_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM uu_weight wts
    INNER JOIN uu_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE uu_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM uu_weight wts
        INNER JOIN uu_init_date init
            on wts.patid=init.patid
        INNER JOIN uu_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM uu_weight wts
        INNER JOIN uu_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12; 

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/*WASHU*/

/* Date of last weight measurement before taking Semaglutide
    Table: site_init_date
            Column1: patid 
            Coluumn2: init_date
*/
CREATE TABLE washu_init_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as init_date
    FROM washu_weight wts
    INNER JOIN washu_sema_info sema
        ON wts.patid=sema.patid
    WHERE DATEDIFF(day, wts.measure_date, sema.min_date) >= 0
        AND DATEDIFF(day, wts.measure_date, sema.min_date) <= 30
    GROUP BY wts.patid;


/* Date of most recent weight measurement
    Table: site_final_date
            Column1: patid 
            Coluumn2: final_date
*/
CREATE TABLE washu_final_date AS
    SELECT wts.patid,
           MAX(wts.measure_date) as final_date
    FROM washu_weight wts
    INNER JOIN washu_sema_info sema
        ON wts.patid=sema.patid
    GROUP BY wts.patid;



/* Complete Semaglutide and Weight Change data */
CREATE TABLE washu_info AS
    SELECT a.patid,
            a.sema_init_date,
            a.sema_final_date,
            a.sema_weeks,
            a.sema_counts,
            a.init_wt_date,
            a.init_wt,
            b.final_wt_date,
            b.final_wt,
            (b.final_wt - a.init_wt) as wt_change,
            DATEDIFF(week, a.init_wt_date, b.final_wt_date) AS wt_weeks
    FROM

        (SELECT DISTINCT wts.patid,
                    wts.measure_date as init_wt_date,
                    wts.wt as init_wt,
                    a.min_date as sema_init_date,
                    a.max_date as sema_final_date,
                    a.weeks as sema_weeks,
                    a.counts as sema_counts            
        FROM washu_weight wts
        INNER JOIN washu_init_date init
            on wts.patid=init.patid
        INNER JOIN washu_sema_info a
            ON wts.patid=a.patid
        WHERE wts.measure_date=init.init_date) a
        
    INNER JOIN
    
        (SELECT DISTINCT wts.patid,
                        wts.measure_date as final_wt_date,
                        wts.wt as final_wt
        FROM washu_weight wts
        INNER JOIN washu_final_date final
            on wts.patid=final.patid
        WHERE wts.measure_date=final.final_date) b
    
    ON a.patid=b.patid
    WHERE sema_weeks >= 12
    AND DATEDIFF(week, sema_init_date, final_wt_date) >= 12;
  


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*site_info_clean*/

/*ALLINA*/
CREATE TABLE allina_info_clean AS
    SELECT *
    FROM allina_info
    WHERE patid=ANY(select patid 
                    FROM allina_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*IHC*/
CREATE TABLE ihc_info_clean AS
    SELECT *
    FROM ihc_info
    WHERE patid=ANY(select patid 
                    FROM ihc_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*KUMC*/
CREATE TABLE kumc_info_clean AS
    SELECT *
    FROM kumc_info
    WHERE patid=ANY(select patid 
                    FROM kumc_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*MCRI*/
CREATE TABLE mcri_info_clean AS
    SELECT *
    FROM mcri_info
    WHERE patid=ANY(select patid 
                    FROM mcri_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*MCW*/
CREATE TABLE mcw_info_clean AS
    SELECT *
    FROM mcw_info
    WHERE patid=ANY(select patid 
                    FROM mcw_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*MU*/
CREATE TABLE mu_info_clean AS
    SELECT *
    FROM mu_info
    WHERE patid=ANY(select patid 
                    FROM mu_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*UIOWA*/
CREATE TABLE uiowa_info_clean AS
    SELECT *
    FROM uiowa_info
    WHERE patid=ANY(select patid 
                    FROM uiowa_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*UNMC*/
CREATE TABLE unmc_info_clean AS
    SELECT *
    FROM unmc_info
    WHERE patid=ANY(select patid 
                    FROM unmc_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*UTHOUSTON*/
CREATE TABLE uthouston_info_clean AS
    SELECT *
    FROM uthouston_info
    WHERE patid=ANY(select patid 
                    FROM uthouston_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*UTHSCSA*/
CREATE TABLE uthscsa_info_clean AS
    SELECT *
    FROM uthscsa_info
    WHERE patid=ANY(select patid 
                    FROM uthscsa_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*UTSW*/
CREATE TABLE utsw_info_clean AS
    SELECT *
    FROM utsw_info
    WHERE patid=ANY(select patid 
                    FROM utsw_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*UU*/
CREATE TABLE uu_info_clean AS
    SELECT *
    FROM uu_info
    WHERE patid=ANY(select patid 
                    FROM uu_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);

/*WASHU*/
CREATE TABLE washu_info_clean AS
    SELECT *
    FROM uu_info
    WHERE patid=ANY(select patid 
                    FROM uu_info
                    GROUP BY patid
                    HAVING COUNT(patid)=1);


select distinct patid from unmc_info_clean;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Create Table of clean Semaglutide and Weight Change Information from all the sites for flowchart*/

CREATE TABLE all_info_clean (patid varchar,
                             sema_init_date date,
                             sema_final_date date,
                             sema_weeks number,
                             sema_counts number,
                             init_wt_date date,
                             init_wt number,
                             final_wt_date date,
                             final_wt number,
                             wt_change number,
                             wt_weeks number
                                );

INSERT INTO all_info_clean
    SELECT *
    FROM allina_info_clean;

INSERT INTO all_info_clean
    SELECT *
    FROM ihc_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM kumc_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM mcri_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM mcw_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM mu_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM uiowa_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM unmc_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM uthouston_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM uthscsa_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM utsw_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM uu_info_clean;
    
INSERT INTO all_info_clean
    SELECT *
    FROM washu_info_clean;
    

select * from all_info_clean;




/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------Prescribing Info------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/* ALLINA */ 
CREATE TABLE allina_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           allina_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN allina_info_clean
        ON allina_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, allina_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= allina_info_clean.final_wt_date; 


/* IHC */
CREATE TABLE ihc_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           ihc_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN ihc_info_clean
        ON ihc_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, ihc_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= ihc_info_clean.final_wt_date;


/* KUMC */
CREATE TABLE kumc_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           kumc_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN kumc_info_clean
        ON kumc_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, kumc_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= kumc_info_clean.final_wt_date;


/* MCRI */
CREATE TABLE mcri_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           mcri_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN mcri_info_clean
        ON mcri_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, mcri_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= mcri_info_clean.final_wt_date;


/* MCW */
CREATE TABLE mcw_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           mcw_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN mcw_info_clean
        ON mcw_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, mcw_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= mcw_info_clean.final_wt_date;


/* MU */
CREATE TABLE mu_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           mu_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN mu_info_clean
        ON mu_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, mu_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= mu_info_clean.final_wt_date;


/* UIOWA */
CREATE TABLE uiowa_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           uiowa_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN uiowa_info_clean
        ON uiowa_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, uiowa_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= uiowa_info_clean.final_wt_date;


/* UNMC */
CREATE TABLE unmc_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           unmc_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN unmc_info_clean
        ON unmc_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, unmc_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= unmc_info_clean.final_wt_date;


/* UTHOUSTON */
CREATE TABLE uthouston_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           uthouston_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN uthouston_info_clean
        ON uthouston_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, uthouston_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= uthouston_info_clean.final_wt_date;


/* UTHSCSA */
CREATE TABLE uthscsa_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           uthscsa_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN uthscsa_info_clean
        ON uthscsa_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, uthscsa_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= uthscsa_info_clean.final_wt_date;


/* UTSW */
CREATE TABLE utsw_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           utsw_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN utsw_info_clean
        ON utsw_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, utsw_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= utsw_info_clean.final_wt_date;


/* UU */ 
CREATE TABLE uu_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           uu_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN uu_info_clean
        ON uu_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, uu_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= uu_info_clean.final_wt_date; 

/* WASHU */
CREATE TABLE washu_prescriptions AS
    SELECT pres.patid, 
           pres.rxnorm_cui AS rxnorm_cui,
           pres.rx_start_date as pres_date,
           pres.prescribingid,
           washu_info_clean.sema_init_date,
           map.rxcui_in
    FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_PRESCRIBING pres
    INNER JOIN rxcuis_map map
        ON map.rxcui_lower = pres.rxnorm_cui
    INNER JOIN washu_info_clean
        ON washu_info_clean.patid = pres.patid
    WHERE DATEDIFF(day, washu_info_clean.sema_init_date, pres_date) >= -365
        AND pres_date <= washu_info_clean.final_wt_date;
 
 select *
 from mu_prescriptions
 where prescribingid=ANY(
                        select prescribingid 
                        from mu_prescriptions 
                        group by prescribingid 
                        having count(prescribingid) > 1);
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------Combining All Prescription Data---------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 


CREATE TABLE IF NOT EXISTS grouse_all_prescriptions (
                                        patid varchar,
                                        pres_date date,
                                        rxnorm_cui varchar,
                                        ingredient varchar,
                                        site varchar);

/* ALLINA */ 
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'ALLINA' as site
    FROM allina_prescriptions; 


/* IHC */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'IHC' as site
    FROM ihc_prescriptions;



/* KUMC */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'KUMC' as site
    FROM kumc_prescriptions;


/* MCRI */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'MCRI' as site
    FROM mcri_prescriptions;


/* MCW */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'MCW' as site
    FROM mcw_prescriptions;


/* MU */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'MU' as site
    FROM mu_prescriptions;


/* UIOWA */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'UIOWA' as site
    FROM uiowa_prescriptions;


/* UNMC */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'UNMC' as site
    FROM unmc_prescriptions;


/* UTHOUSTON */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'UTHOUSTON' as site
    FROM uthouston_prescriptions;


/* UTHSCSA */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'UTHSCSA' as site
    FROM uthscsa_prescriptions;


/* UTSW */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'UTSW' as site
    FROM utsw_prescriptions;


/* UU */ 
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'UU' as site
    FROM uu_prescriptions; 


/* WASHU */
INSERT INTO grouse_all_prescriptions
    SELECT patid,
            pres_date,
            rxnorm_cui,
            rxcui_in as ingredient,
            'WASHU' as site
    FROM washu_prescriptions;

/*Check to ensure that the right number of prescriptions from each site are into grouse_all_prescriptions */
SELECT site,
        COUNT(patid) 
FROM grouse_all_prescriptions
GROUP BY site;
/* Check passes */


/* Check of number of patients from each site matches up with patients in the sema_info tables */
SELECT site,
        COUNT(DISTINCT patid) 
FROM grouse_all_prescriptions
GROUP BY site;
/*Check passes */


/* Check to see if the distinct patids in all_prescriptions is equal to total patients from all sites - 3375, there are 4 who have no pres data
they are from UTHOUSTON - which has less prescribing data
note - need to remove them in python, possible delete rows of dataframe that have no prescriptions? or keep them? ask Waitman, also why semaglutide not show?
*/
select distinct patid from grouse_all_prescriptions;


/*SQL string query to get prescriptions dataframe in python */
SELECT PATID,
        pres_date as DATE,
        RXNORM_CUI,
        INGREDIENT
FROM grouse_all_prescriptions;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------Get all Label data for all sites--------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE labels(
                    patid varchar,
                    label float);
                    
INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM allina_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM ihc_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM kumc_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM mcri_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM mcw_info_clean;
    
INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM mu_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM uiowa_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM unmc_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM uthouston_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM uthscsa_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM utsw_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM uu_info_clean;

INSERT INTO labels
    SELECT DISTINCT patid,
            (final_wt-init_wt)/init_wt as label
    FROM washu_info_clean;
    




/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------Get Demographic information for GROUSE sites Semaglutide patients-------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

/* ALLINA */
CREATE TABLE allina_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* IHC */
CREATE TABLE ihc_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);


/* KUMC*/
CREATE TABLE kumc_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* MCRI*/
CREATE TABLE MCRI_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* MCW*/
CREATE TABLE mcw_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);
                
/* MU */
CREATE TABLE mu_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* UIOWA */
CREATE TABLE uiowa_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* UNMC */
CREATE TABLE unmc_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* UTHOUSTON */
CREATE TABLE uthouston_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* UTHSCSA */
CREATE TABLE uthscsa_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* UTSW */
CREATE TABLE utsw_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* UU */
CREATE TABLE uu_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);

/* WASHU */
CREATE TABLE washu_demo AS
SELECT patid,
       CASE WHEN sex='M' THEN 1 ELSE 0 END AS sex,
       CASE WHEN race='05' THEN 1 ELSE 0 END AS race
FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid
                FROM labels);



CREATE TABLE all_demo (
                        patid varchar,
                        sex varchar,
                        race varchar);
                        
INSERT INTO all_demo
    SELECT * 
    FROM allina_demo;

INSERT INTO all_demo
    SELECT * 
    FROM ihc_demo;

INSERT INTO all_demo
    SELECT * 
    FROM kumc_demo;

INSERT INTO all_demo
    SELECT * 
    FROM mcri_demo;

INSERT INTO all_demo
    SELECT * 
    FROM mu_demo;

INSERT INTO all_demo
    SELECT * 
    FROM uiowa_demo;

INSERT INTO all_demo
    SELECT * 
    FROM unmc_demo;

INSERT INTO all_demo
    SELECT * 
    FROM uthouston_demo;

INSERT INTO all_demo
    SELECT * 
    FROM uthscsa_demo;

INSERT INTO all_demo
    SELECT * 
    FROM utsw_demo;

INSERT INTO all_demo
    SELECT * 
    FROM uu_demo;

INSERT INTO all_demo
    SELECT * 
    FROM washu_demo;
    
SELECT distinct patid  
FROM all_demo
WHERE patid=ANY(SELECT patid FROM labels);


create table all_demo_clean as
select patid,
       avg(sex) as sex,
       avg(race) as race
from all_demo
group by patid;

select * from all_demo_clean;



/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------All Semaglutide Weight Change and Pres info-----------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/ 

CREATE TABLE all_sema_info AS
    SELECT *
    FROM (
        SELECT a.*,
                'ALLINA' as site
        FROM allina_info_clean a
        UNION 
        (SELECT ihc.*,
                'IHC' as site
        FROM ihc_info_clean ihc)
        UNION 
        (SELECT ku.*,
                'KUMC' as site
        FROM kumc_info_clean ku)
        UNION 
        SELECT mcri.*,
                'MCRI' as site
        FROM mcri_info_clean mcri
        UNION 
        SELECT mcw.*,
                'MCW' as site
        FROM mcw_info_clean mcw
        UNION 
        SELECT mu.*,
                'MU' as site
        FROM mu_info_clean mu
        UNION 
        SELECT uiowa.*,
                'UIOWA' as site
        FROM uiowa_info_clean uiowa
        UNION 
        SELECT unmc.*,
                'UNMC' as site
        FROM unmc_info_clean unmc
        UNION 
        SELECT uth.*,
                'UTHOUSTON' as site
        FROM uthouston_info_clean uth
        UNION 
        SELECT uthscsa.*,
                'UTHSCSA' as site
        FROM uthscsa_info_clean uthscsa
        UNION 
        SELECT utsw.*,
                'UTSW' as site
        FROM utsw_info_clean utsw
        UNION 
        SELECT uu.*,
                'UU' as site
        FROM uu_info_clean uu
        UNION 
        SELECT washu.*,
                'WASHU' as site
        FROM washu_info_clean washu
        )
    WHERE patid=ANY(SELECT patid from labels);





/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------Creating a table of Semaglutide Diagnoses-------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/   

/* Note - many thousands of diagnoses */
/*ALLINA - 209,963, KUMC - 80,856*/

CREATE TABLE all_sema_diag AS
SELECT 'ALLINA' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'IHC' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'KUMC' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'MCRI' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'MCW' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'MU' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'UIOWA' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'UNMC' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'UTHOUSTON' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'UTHSCSA' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'UTSW' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'UU' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'WASHU' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels)
UNION ALL
SELECT 'CMS' as site,
       patid,
       dx_type,
       dx,
       enc_type,
       admit_date
FROM GROUSE_DEID_DB.CMS_PCORNET_CDM.V_DEID_DIAGNOSIS
WHERE patid=ANY(SELECT patid from labels);

/* Duplicate checks for diagnoses */
select * from all_sema_diag;


/*Check same number of rows in the diagnoses and phecodes */


/* Code from Dr. Song */

/* Code that gets all the diagnoses and mapped to the PHECODES - correctly has 2,248 patients in it
Check and see what is going on here 
Also note code modified from Dr.Song Template */
CREATE TABLE sema_diag_phecd AS
select distinct dx.*,
       phe."phecode" as phecd_dxgrpcd, 
       ref."phecode_string" as phecd_dxgrp,
       ref."phecode_category" as phecd_cat
from all_sema_diag dx 
join ONTOLOGY.GROUPER_VALUESETS.ICD10CM_PHECODEX phe on dx.DX = phe."icd10" and dx.DX_TYPE = '10'
join ONTOLOGY.GROUPER_VALUESETS.PHECODEX_REF ref on phe."phecode" = ref."phecode"
union
select distinct dx.*,
       phe."phecode" as phecd_dxgrpcd, 
       ref."phecode_string" as phecd_dxgrp,
       ref."phecode_category" as phecd_cat
from all_sema_diag dx 
join ONTOLOGY.GROUPER_VALUESETS.ICD9CM_PHECODEX phe on dx.DX = phe."icd9" and dx.DX_TYPE = '09'
join ONTOLOGY.GROUPER_VALUESETS.PHECODEX_REF ref on phe."phecode" = ref."phecode";

/*Correct 3,375 patients in sema_diag_phecd */
select distinct patid from sema_diag_phecd;
select * from labels;

select * from sema_diag_phecd;

/* Code to see how diagnoses groups end up */
SELECT phecd_cat,
       COUNT(DISTINCT patid)
FROM sema_diag_phecd
GROUP BY phecd_cat;


/*
cleaning phecodes so they are not after taking semaglutide - here, need diagnosis window
*/
create table sema_diag_phecd_clean as
select a.*, b.sema_init_date
from sema_diag_phecd a
inner join all_sema_info b
    on a.patid=b.patid
where a.admit_date < b.sema_final_date
    and DATEDIFF(day, a.admit_date, b.sema_init_date) < 365;


/*Gonna have to get the birthdays of all the patients from all the GROUSE EHRs - use this to get age at start of semaglutide
Combine this with the diagnoses information
2 potential models - with lower level phecodes, and with categories and limited drug groups that impact weight change
 - check to see if can get accurate dosage information - maybe next week
 now will have models with demo, diagnoses, and prescription data with weight change*/
 
/* Problem with Duplicates */

CREATE TABLE all_birthdays2 AS
SELECT 'ALLINA' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'IHC' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'KUMC' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'MCRI' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'MCW' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'MU' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'UIOWA' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'UNMC' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'UTHSCSA' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'UTSW' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'UTHOUSTON' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'UU' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels)
UNION ALL
SELECT 'WASHU' as site,
       patid,
       birth_date
FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_DEMOGRAPHIC
WHERE patid=ANY(SELECT patid FROM labels);


/* Removing duplicate values from the birthdays table */
CREATE TABLE all_birthdays_clean AS
SELECT b.*
FROM all_birthdays2 b
WHERE b.patid=ANY(SELECT patid 
                FROM all_birthdays2 
                GROUP BY patid
                HAVING COUNT(patid)=1);











/* Good clean final demo table with Age, Sex, and Race */
CREATE TABLE all_demo_clean_2 AS
SELECT DISTINCT d.*,
                DATEDIFF(year, b.birth_date, s.sema_init_date) as age 
FROM all_demo_clean d
INNER JOIN all_sema_info s ON s.patid=d.patid
INNER JOIN all_birthdays_clean b ON b.patid=d.patid
WHERE d.patid=ANY(SELECT patid FROM all_demo)
    AND age<100;

/*Check for duplicates */
select * from all_demo_clean_2;
select distinct patid from all_demo_clean_2;


/* Good clean final demo table with Age, Sex, and Race - and weight before Semaglutide and number of weeks on semaglutide for*/
CREATE TABLE all_demo_clean_3 AS
SELECT DISTINCT d.*,
                s.init_wt as init_wt,
                s.sema_weeks as sema_weeks
FROM all_demo_clean_2 d
INNER JOIN all_sema_info s ON s.patid=d.patid
WHERE d.patid=ANY(SELECT patid FROM labels);

select * from all_demo_clean_3;


/* Getting Diagnoses Information by PHECODE category - using from any time window - get rid of ones from dates
Note - use only from prior baseline BMI date - baseline PHECODEs*/
CREATE TABLE sema_demo_phecd_cat AS
SELECT d.*,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Cardio')) THEN 1 ELSE 0 END AS cardio,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Endo')) THEN 1 ELSE 0 END AS endo,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='GI')) THEN 1 ELSE 0 END AS gi,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Signs/Symptoms')) THEN 1 ELSE 0 END AS signs_symptoms,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Neuro')) THEN 1 ELSE 0 END AS neuro,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Neoplasms')) THEN 1 ELSE 0 END AS neoplasms,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Musc/Skel')) THEN 1 ELSE 0 END AS musc_skel,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Derm')) THEN 1 ELSE 0 END AS derm,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Rx')) THEN 1 ELSE 0 END AS rx,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Resp')) THEN 1 ELSE 0 END AS resp,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Genitourinary')) THEN 1 ELSE 0 END AS genitourinary,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Eye')) THEN 1 ELSE 0 END AS eye,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Cong')) THEN 1 ELSE 0 END AS cong,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Metab')) THEN 1 ELSE 0 END AS metab,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Blood')) THEN 1 ELSE 0 END AS blood,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Preg')) THEN 1 ELSE 0 END AS preg,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Stat')) THEN 1 ELSE 0 END AS stat,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Dev')) THEN 1 ELSE 0 END AS dev,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Mental')) THEN 1 ELSE 0 END AS mental,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='Hearing')) THEN 1 ELSE 0 END AS hearing,
        CASE WHEN (d.patid = ANY(SELECT patid from sema_diag_phecd_clean WHERE phecd_cat='ID')) THEN 1 ELSE 0 END AS id    
FROM all_demo_clean_3 d;

select * from all_demo_clean_3;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/  


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/  


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/  
/* Query to get the final labels with  final patients */
create table labels_final as 
select * 
from labels
where patid=any(select patid from sema_demo_phecd_cat);

select * from labels_final;


/* Query to get the prescriptions for patients we have clean demo and labels for - with exclusions */
CREATE TABLE all_pres_final AS
SELECT PATID,
    pres_date as DATE,
    RXNORM_CUI,
    INGREDIENT
FROM grouse_all_prescriptions
WHERE patid=ANY(SELECT patid FROM labels_final);

select distinct patid from all_pres_final;

/* Query to get the clean labels used in Python */
select * from labels_final;
/*where patid not any select from exclsions - for these next 2 */


/*Query to get the new demo information used in Python  */
SELECT * FROM sema_demo_phecd_cat;

select distinct patid from labels_final;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------Exclusions------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE all_exclusions(patid varchar);

CREATE TABLE all_cancer_exclusions(patid varchar);

CREATE TABLE all_bariatric_exclusions(patid varchar);

CREATE TABLE all_underweight_exclusions(patid varchar);

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Cancer Exclusions - using admit_date - looks like Allina for example doesn't populate dx_date*/
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM allina_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_ALLINA"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0); 
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM ihc_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_IHC"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);    
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM kumc_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_KUMC"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);   
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM mcri_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_MCRI"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);    
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM mcw_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_MU"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);  
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM mu_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_MU"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0); 
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM uiowa_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_UIOWA"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);   
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM unmc_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_UNMC"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0); 
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM uthouston_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_UTHOUSTON"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);   
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM uthscsa_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_UTHSCSA"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);  
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM utsw_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_UTSW"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0); 
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM uu_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_UU"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0);     
    
INSERT INTO all_cancer_exclusions
    SELECT distinct a.patid 
    FROM washu_sema_info a
    INNER JOIN "GROUSE_DEID_DB"."PCORNET_CDM_WASHU"."V_DEID_DIAGNOSIS" diag
        ON diag.patid=a.patid
    WHERE (   /*Cancer excluding benign skin cancer*/
            ((diag.dx_type = '09' AND diag.dx >= '140' AND diag.dx < '210')
            OR (diag.dx_type = '09' AND diag.dx >= '230' AND diag.dx < '240')
            OR (diag.dx_type='10' AND diag.dx LIKE 'C%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D0%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D37%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D38%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D39%')
            OR (diag.dx_type='10' AND diag.dx LIKE 'D%' AND NOT diag.dx LIKE 'D4%')))
        AND (DATEDIFF(year, diag.admit_date, a.min_date) < 1)
        AND (DATEDIFF(year, diag.admit_date, a.max_date) > 0); 

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Bariatric Exclusions - using admit_date - looks like Allina for example doesn't populate dx_date*/

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM allina_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM ihc_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM kumc_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM mcri_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM mcw_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM mu_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM uiowa_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM unmc_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM uthouston_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM uthscsa_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM utsw_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM uu_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );

INSERT INTO all_bariatric_exclusions
    SELECT DISTINCT patid 
    FROM washu_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_DIAGNOSIS 
                    WHERE (dx_type='09' AND dx IN ('V45.86'))
                        OR (dx_type='10' AND dx IN ('Z98.84'))
                   
                   )
    
        OR patid=ANY(SELECT DISTINCT patid

                         FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_PROCEDURES

                         WHERE (     px_type='CH' AND px IN ('43843', '43846', 'S2082', '43633', '43770', '43645', 
                                                             'S2085', '43775', '43644', '43847', '43844')

                                        OR px_type='09' AND px IN ('43.82', '43.89', '44.3', '44.31', '44.38', 
                                                                   '44.39', '44.68', '44.95', '44.96', '44.97',                                                 
                                                                   '44.99', '44.5', '45.51', '45.9')

                                        OR px_type='10' AND px IN ('0D160Z4', '0D160Z9', '0D160ZA','0D160ZB', '0D160ZL', '0DV64Z'))
                         );



/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Underweight Exclusions - using admit_date - looks like Allina for example doesn't populate dx_date*/

INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM allina_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_ALLINA.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM ihc_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_IHC.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM kumc_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_KUMC.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM mcri_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_MCRI.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 

INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM mcw_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_MCW.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM mu_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_MU.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM uiowa_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UIOWA.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM unmc_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UNMC.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM uthouston_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UTHOUSTON.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM uthscsa_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UTHSCSA.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM utsw_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UTSW.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM uu_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_UU.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
INSERT INTO all_underweight_exclusions
    SELECT DISTINCT patid 
    FROM washu_sema_info
    WHERE patid=ANY(SELECT DISTINCT patid
                   FROM GROUSE_DEID_DB.PCORNET_CDM_WASHU.V_DEID_DIAGNOSIS diag
                    WHERE (diag.dx_type = '09' AND diag.dx IN ('783.22', 'V85.0', 'V85.51'))
                        OR (diag.dx_type='10' AND diag.dx IN ('Z68.1', 'Z68.20', 'Z68.21', 'Z68.22', 'Z68.23', 'Z68.24', 'R63.6'))
                   
                   ); 
                   
                   

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/  

INSERT INTO all_exclusions
    SELECT *
    FROM all_cancer_exclusions;
    
INSERT INTO all_exclusions
    SELECT *
    FROM all_bariatric_exclusions;
    
INSERT INTO all_exclusions
    SELECT *
    FROM all_underweight_exclusions;
    
    
    
/*Code to get the numbers for the flowchart*/
select distinct patid from all_cancer_exclusions;

select distinct patid from all_bariatric_exclusions
where not patid=ANY(select patid from all_cancer_exclusions);

select * from all_underweight_exclusions;
select distinct patid from all_exclusions;

/*Post-Exclusion Final Tables*/
/* Query to get the prescriptions for patients we have clean demo and labels for - with exclusions */
CREATE TABLE all_pres_final_clean AS
    SELECT *
    FROM all_pres_final
    WHERE NOT patid=ANY(SELECT patid FROM all_exclusions);

select * from all_pres_final_clean;

/* Query to get the clean labels used in Python */
CREATE TABLE labels_final_clean AS
    SELECT *
    FROM labels_final
    WHERE NOT patid=ANY(SELECT patid FROM all_exclusions);

select * from labels_final_clean;
/*where patid not any select from exclsions - for these next 2 */


/*Query to get the new demo information used in Python  */
CREATE TABLE sema_demo_phecd_cat_clean AS
    SELECT *
    FROM sema_demo_phecd_cat
    WHERE NOT patid=ANY(SELECT patid FROM all_exclusions);
    
SELECT * FROM sema_demo_phecd_cat_clean;




