CREATE TABLE `session_schedule` ( 
`ID` INT(10) NOT NULL, 
`FOOD_TYPE` VARCHAR(20) NOT NULL, 
`START_TIME` TIME NOT NULL,
 `END_TIME` TIME NOT NULL,  PRIMARY KEY (`ID`));

INSERT INTO `session_schedule` (`ID`, `FOOD_TYPE`, `START_TIME`, `END_TIME`) VALUES('1','Breakfast','08:00:00','11:00:00');
INSERT INTO `session_schedule` (`ID`, `FOOD_TYPE`, `START_TIME`, `END_TIME`) VALUES('2','Lunch','11:15:00','15:00:00');
INSERT INTO `session_schedule` (`ID`, `FOOD_TYPE`, `START_TIME`, `END_TIME`) VALUES('3','Refreshment','15:15:00','23:00:00');
INSERT INTO `session_schedule` (`ID`, `FOOD_TYPE`, `START_TIME`, `END_TIME`) VALUES('4','Dinner','19:00:00','23:00:00');



CREATE TABLE `menu_items` (  
`ID` INT(20) NOT NULL, 
 `FOOD_ITEMS` VARCHAR(20) NOT NULL, 
`RATE` INT(30) NOT NULL,  PRIMARY KEY (`ID`));


INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('1','Idly','10');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('2','Dosa','25');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('3','Vada','10');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('4','Poori','30');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('5','Coffee-B','25');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('6','Tea-B','25');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('7','Pongal','30');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('8','South Indian Meals','120');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('9','North Indian Thali','180');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('10','Variety rice','90');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('11','Coffee-L','25');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('12','Tea-L','25');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('13','Snacks','50');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('14','Fried rice','80');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('15','Chappati','80');
INSERT INTO `menu_items` (`ID`, `FOOD_ITEMS`, `RATE`) VALUES('16','Chat items','50');




CREATE TABLE `item_quantity` ( 
 `ID` INT(30) NOT NULL AUTO_INCREMENT, 
 `FOOD_TYPE` INT(30) DEFAULT NULL,
 `MENU_TYPE` INT(30) DEFAULT NULL,
`QTY` INT(30) DEFAULT NULL,  PRIMARY KEY (`ID`), 
 KEY `RT_TYPE` (`FOOD_TYPE`),
 KEY `RT_MENU` (`MENU_TYPE`),
 CONSTRAINT `RT_MENU` FOREIGN KEY (`MENU_TYPE`) REFERENCES `menu_items` (`ID`),  CONSTRAINT `RT_TYPE` FOREIGN KEY (`FOOD_TYPE`) REFERENCES `session_schedule` (`ID`))


INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('1','1','1','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('2','1','2','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('3','1','3','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('4','1','4','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('5','1','5','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('6','1','6','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('7','1','7','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('8','2','8','75');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('9','2','9','75');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('10','2','10','75');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('11','3','6','200');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('12','3','7','200');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('13','3','11','200');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('14','4','12','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('15','4','13','100');
INSERT INTO `item_quantity` (`ID`, `FOOD_TYPE`, `MENU_TYPE`, `QTY`) VALUES('16','4','14','100');




CREATE TABLE `seat` ( 
 `ID` INT(11) NOT NULL, 
 `SEAT_NO` INT(11) NOT NULL,
 `STATUS` VARCHAR(50) NOT NULL,  PRIMARY KEY (`ID`));


INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('1','1','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('2','2','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('3','3','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('4','4','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('5','5','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('6','6','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('7','7','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('8','8','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('9','9','AVAILABLE');
INSERT INTO `seat` (`ID`, `SEAT_NO`, `STATUS`) VALUES('10','10','AVAILABLE');



CREATE TABLE `ORDER_RECORDS` ( 
 `ID` INT(200) NOT NULL , 
 `SEAT_NO` INT(200) DEFAULT NULL, 
 `FOOD_ITEM` VARCHAR(30) NOT NULL, 
 `QTY` INT(10) NOT NULL,  
`BILL_AMOUNT` BIGINT(30) DEFAULT NULL, 
 `ORDER_DATE` DATETIME DEFAULT NULL, 
 `STATUS` VARCHAR(30) DEFAULT NULL,  PRIMARY KEY (`ID`)) ;