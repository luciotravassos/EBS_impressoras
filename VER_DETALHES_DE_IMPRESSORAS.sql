/* Formatted on 2005/05/05 16:04 (Formatter Plus v4.7.0) */
SELECT printer_style_name, srw_driver, width, LENGTH, orientation
  FROM fnd_printer_styles
 --WHERE printer_style_name LIKE 'POR%'
 WHERE SRW_DRIVER LIKE 'W2%'

