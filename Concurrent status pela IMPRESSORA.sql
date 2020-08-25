/* Verifica o status das requests pela Impressora */
SELECT   c.printer_name, c.description,
         SUBSTR (a.request_id, 1, 20) request_id,
         SUBSTR (b.user_name, 1, 30) requestor,
         SUBSTR (a.completion_text, 1, 30) completion_text,
         a.phase_code "Phase Code", a.status_code,
         SUBSTR (a.program, 1, 40) program, a.priority, a.request_date,
         a.actual_completion_date,
         TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24
                / 60
               ) tempo,
         CASE
            WHEN a.status_code = 'A'
               THEN 'Waiting'
            WHEN a.status_code = 'B'
               THEN 'Resuming'
            WHEN a.status_code = 'C'
               THEN 'Normal'
            WHEN a.status_code = 'D'
               THEN 'Cancelled'
            WHEN a.status_code = 'E'
               THEN 'Error'
            WHEN a.status_code = 'F'
               THEN 'Scheduled'
            WHEN a.status_code = 'G'
               THEN 'Warning'
            WHEN a.status_code = 'H'
               THEN 'On Hold'
            WHEN a.status_code = 'I'
               THEN 'Normal'
            WHEN a.status_code = 'M'
               THEN 'No Manager'
            WHEN a.status_code = 'Q'
               THEN 'Standby'
            WHEN a.status_code = 'R'
               THEN 'Normal'
            WHEN a.status_code = 'S'
               THEN 'Suspended'
            WHEN a.status_code = 'T'
               THEN 'Terminating'
            WHEN a.status_code = 'W'
               THEN 'Paused'
            WHEN a.status_code = 'X'
               THEN 'Terminated'
            WHEN a.status_code = 'U'
               THEN 'Disabled'
            WHEN a.status_code = 'Z'
               THEN 'Waiting'
         END alertas
    FROM fnd_printer_vl c, apps.fnd_conc_req_summary_v a, apps.fnd_user b
   WHERE a.requested_by = b.user_id
         AND c.printer_name like '%a812-pt-balcao-1%'
--         AND a.phase_code = 'C'
--         AND c.printer_name = 'a812-pt-balcao-1'
         /* AS 3 linhas abaixo podem ficar comentadas,
         pois são apenas filtro para o status code*/
       --  AND a.status_code = 'E'
     AND to_char(a.actual_completion_date, 'DD/MM/YYYY') = '28/06/2006'
     --and to_char(a.actual_completion_date, 'DD/MM/YYYY') > '13/08/2005'
     --and a.requested_by = b.user_id AND b.user_name = '25557226'
ORDER BY request_date DESC

