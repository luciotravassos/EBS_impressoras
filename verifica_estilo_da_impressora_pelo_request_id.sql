/* Formatted on 2005/05/05 16:05 (Formatter Plus v4.7.0) */
SELECT printer_style_name, srw_driver, width, LENGTH, orientation
  FROM fnd_printer_styles
 WHERE printer_style_name = (SELECT print_style
                               FROM fnd_concurrent_requests
                              WHERE request_id = 1232169)

