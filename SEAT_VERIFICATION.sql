

DELIMITER $$
CREATE  FUNCTION `SEAT_VERIFICATION`(SEATNO INT)
 RETURNS BOOLEAN
BEGIN
RETURN EXISTS(SELECT SEAT_NO FROM SEAT WHERE SEAT_NO=SEATNO);
END $$

DELIMITER ;
