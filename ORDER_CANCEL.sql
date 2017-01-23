DROP PROCEDURE IF EXISTS ORDER_CANCELLED;
DELIMITER $$
CREATE  PROCEDURE ORDER_CANCELLED(IN ORDERID INT,IN SEATNO INT,FOODITEM VARCHAR(20))
BEGIN
DECLARE FOOD_ID INT;
DECLARE MENU_ID INT;
IF SEATNO IN(SELECT SEAT_NO FROM ORDER_RECORDS WHERE ID=ORDERID)
THEN
SELECT 'ORDER CANCELLED';
SELECT ID INTO FOOD_ID FROM MENU_ITEMS WHERE FOOD_ITEMS=FOODITEM;
SET MENU_ID=(SELECT FOOD_TYPE FROM ITEM_QUANTITY WHERE MENU_TYPE=F_ID);
UPDATE SEAT SET STATUS='AVAILABLE' WHERE ID=ORDERID AND SEAT_NO=SEATNO;
UPDATE ORDER_RECORDS SET STATUS='ORDER CANCELLED' WHERE ID=ORDERID AND SEAT_NO=SEATNO ;
ELSE
SELECT'OUT OF RANGE';
END IF;
END $$

DELIMITER ;

CALL ORDER_CANCELLED(1,1,'IDLY')