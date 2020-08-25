/* PRINTERS */
SELECT   printer_name, printer_type, description, creation_date,
         last_update_date, created_by, last_update_login, last_updated_by
    FROM APPS.fnd_printer_vl
   WHERE printer_name like '%cwb_almox_tec%'
   --WHERE DESCRIPTION LIKE '%iscal%'
   --WHERE printer_type = '%E%'
ORDER BY printer_name,description

