/* Detalhamento por impressora */
SELECT   a.printer_style_name, a.srw_driver, a.width, a.LENGTH, a.orientation,
         c.printer_name, c.description
    FROM fnd_printer_styles a, fnd_printer_vl c
   WHERE c.printer_name LIKE '%cwb_almox_tec%'
ORDER BY orientation

