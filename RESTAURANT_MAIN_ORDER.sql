
DROP PROCEDURE IF EXISTS PLACE_ORDER ;

DELIMITER $$

CREATE PROCEDURE PLACE_ORDER(IN SEAT INT,IN ITEM MEDIUMTEXT,IN QUANTITY MEDIUMTEXT)
    
    BEGIN
          DECLARE _next1 TEXT DEFAULT NULL ;
          DECLARE _nextlen1 INT DEFAULT NULL;
          DECLARE _value1 TEXT DEFAULT NULL;
          DECLARE _next2 TEXT DEFAULT NULL ;
          DECLARE _nextlen2 INT DEFAULT NULL;
          DECLARE _value2 TEXT DEFAULT NULL;
          DECLARE temp INT;
          DECLARE ORDER_ID INT;
          SET ORDER_ID=(FLOOR(100+RAND()*(900)));
          SET temp=(LENGTH(ITEM)-LENGTH(REPLACE(ITEM,',','')))+1;
          IF (temp<=5)
          THEN 
          
         IF (SEAT_VERIFICATION(SEAT))
         THEN
         UPDATE SEAT SET STATUS='UNAVAILABLE' WHERE  SEAT_NO=SEAT;
          SELECT CHECK_SERVICE();

                                  
          iterator :
          LOOP    
            IF LENGTH(TRIM(ITEM)) = 0 OR ITEM IS NULL OR LENGTH(TRIM(QUANTITY)) = 0 OR QUANTITY IS NULL THEN
              LEAVE iterator;
              END IF;   
                 SET _next1 = SUBSTRING_INDEX(ITEM,',',1);
                 SET _nextlen1 = LENGTH(_next1);
                 SET _value1 = TRIM(_next1);
                 
                 SET _next2 = SUBSTRING_INDEX(QUANTITY,',',1);
                 SET _nextlen2 = LENGTH(_next2);
                 SET _value2 = TRIM(_next2);
                 
                 CALL ORDERS(ORDER_ID,SEAT,_next1,_next2);
                
                 SET ITEM = INSERT(ITEM,1,_nextlen1 + 1,'');
                 SET QUANTITY = INSERT(QUANTITY,1,_nextlen2 + 1,'');
         END LOOP; 
          SELECT CONCAT('ORDER PLACED, YOUR ORDER ID:',ORDER_ID) AS COMMENTS;
         
         ELSE 
	 SELECT 'NO SEATS';
         END IF;
         END IF; 
          
                 UPDATE  SEAT SET STATUS='AVAILABLE',CHECK_SEAT=0 WHERE SEAT_NO=SEAT; 
                 
    END $$
DELIMITER ;


CALL PLACE_ORDER(5,'IDLY,DOSA','1,2')
