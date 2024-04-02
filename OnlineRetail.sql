CREATE TABLE [CUSTOMER](
[CustomerID] int NOT NULL,
[Country] varchar(100),
PRIMARY KEY([CustomerID]),
CONSTRAINT "Customer ID has a lenght of 5" CHECK (LEN([CustomerID])=5)
);

INSERT INTO CUSTOMER(CustomerID, Country)
VALUES
('17850','United Kingdom'),
('13047','United Kingdom'),
('12583','France'),
('13748','United Kingdom'),
('15100','United Kingdom'),
('15291','United Kingdom'),
('14688','United Kingdom'),
('17809','United Kingdom'),
('15311','United Kingdom'),
('16098','United Kingdom'),
('18074','United Kingdom'),
('17420','United Kingdom'),
('16029','United Kingdom'),
('16250','United Kingdom'),
('12431','Australia')

SELECT *
from CUSTOMER;

--d.quantity is between 0 and 1000, original request 200, 
--but original dataset already have some data beyond 200, so change to 1000
--like 22466 quantity already greater than 200
CREATE TABLE [PRODUCT](
[ProductCode] varchar(100) NOT NULL,
[Description] varchar(100),
[Status] varchar(100),
[Inventory_Quantity] int,
PRIMARY KEY ([ProductCode]),
CONSTRAINT CHK_Inventory_Quantity_Range CHECK ([Inventory_Quantity]>=0 AND [Inventory_Quantity]<=1000)
);

INSERT INTO PRODUCT(ProductCode, Description, Inventory_Quantity,Status)
VALUES
('21730','GLASS STAR FROSTED T-LIGHT HOLDER',12,'Good inventory'),
('22752','SET 7 BABUSHKA NESTING BOXES',2,'Need attention'),
('71053','WHITE METAL LANTERN',12,'Good inventory'),
('84029E','RED WOOLLY HOTTIE WHITE HEART.',12,'Good inventory'),
('84029G','KNITTED UNION FLAG HOT WATER BOTTLE',12,'Good inventory'),
('84406B','CREAM CUPID HEARTS COAT HANGER',16,'Good inventory'),
('85123A','WHITE HANGING HEART T-LIGHT HOLDER',12,'Good inventory'),
('22632','HAND WARMER RED POLKA DOT',12,'Good inventory'),
('22633','HAND WARMER UNION JACK',12,'Good inventory'),
('21754','HOME BUILDING BLOCK WORD',3,'Need attention'),
('21755','LOVE BUILDING BLOCK WORD',3,'Need attention'),
('21777','RECIPE BOX WITH METAL HEART',4,'Need attention'),
('22310','IVORY KNITTED MUG COSY ',12,'Good inventory'),
('22622','BOX OF VINTAGE ALPHABET BLOCKS',2,'Need attention'),
('22623','BOX OF VINTAGE JIGSAW BLOCKS ',3,'Need attention'),
('22745','POPPY''S PLAYHOUSE BEDROOM ',12,'Good inventory'),
('22748','POPPY''S PLAYHOUSE KITCHEN',12,'Good inventory'),
('22749','FELTCRAFT PRINCESS CHARLOTTE DOLL',16,'Good inventory'),
('48187','DOORMAT NEW ENGLAND',4,'Need attention'),
('84879','ASSORTED COLOUR BIRD ORNAMENT',64,'Good inventory'),
('84969','BOX OF 6 ASSORTED COLOUR TEASPOONS',12,'Good inventory'),
('22912','YELLOW COAT RACK PARIS FASHION',3,'Need attention'),
('22913','RED COAT RACK PARIS FASHION',3,'Need attention'),
('22914','BLUE COAT RACK PARIS FASHION',3,'Need attention'),
('22960','JAM MAKING SET WITH JARS',12,'Good inventory'),
('21756','BATH BUILDING BLOCK WORD',3,'Need attention'),
('10002','INFLATABLE POLITICAL GLOBE ',96,'Good inventory'),
('21035','SET/2 RED RETROSPOT TEA TOWELS ',36,'Good inventory'),
('21724','PANDA AND BUNNIES STICKER SHEET',24,'Good inventory'),
('21731','RED TOADSTOOL LED NIGHT LIGHT',48,'Good inventory'),
('21791','VINTAGE HEADS AND TAILS CARD GAME ',48,'Good inventory'),
('21883','STARS GIFT TAPE ',48,'Good inventory'),
('21913','VINTAGE SEASIDE JIGSAW PUZZLES',24,'Good inventory'),
('22326','ROUND SNACK BOXES SET OF4 WOODLAND ',48,'Good inventory'),
('22492','MINI PAINT SET VINTAGE ',72,'Good inventory'),
('22540','MINI JIGSAW CIRCUS PARADE ',48,'Good inventory'),
('22544','MINI JIGSAW SPACEBOY',48,'Good inventory'),
('22629','SPACEBOY LUNCH BOX ',48,'Good inventory'),
('22631','CIRCUS PARADE LUNCH BOX ',48,'Good inventory'),
('22659','LUNCH BOX I LOVE LONDON',48,'Good inventory'),
('22661','CHARLOTTE BAG DOLLY GIRL DESIGN',40,'Good inventory'),
('22726','ALARM CLOCK BAKELIKE GREEN',24,'Good inventory'),
('22727','ALARM CLOCK BAKELIKE RED ',48,'Good inventory'),
('22728','ALARM CLOCK BAKELIKE PINK',48,'Good inventory'),
('22900',' SET 2 TEA TOWELS I LOVE LONDON ',48,'Good inventory'),
('POST','POSTAGE',3,'Need attention'),
('22086','PAPER CHAIN KIT 50''S CHRISTMAS ',160,'Good inventory'),
('20679','EDWARDIAN PARASOL RED',12,'Good inventory'),
('21068','VINTAGE BILLBOARD LOVE/HATE MUG',12,'Good inventory'),
('21071','VINTAGE BILLBOARD DRINK ME MUG',12,'Good inventory'),
('21871','SAVE THE PLANET MUG',12,'Good inventory'),
('37370','RETRO COFFEE MUGS ASSORTED',12,'Good inventory'),
('82482','WOODEN PICTURE FRAME WHITE FINISH',12,'Good inventory'),
('82483','WOOD 2 DRAWER CABINET WHITE FINISH',2,'Need attention'),
('82486','WOOD S/3 CABINET ANT WHITE FINISH',4,'Need attention'),
('82494L','WOODEN FRAME ANTIQUE WHITE ',12,'Good inventory'),
('21258','VICTORIAN SEWING BOX LARGE',64,'Good inventory'),
('21733','RED HANGING HEART T-LIGHT HOLDER',128,'Good inventory'),
('22114','HOT WATER BOTTLE TEA AND SYMPATHY',96,'Good inventory'),
('20723','STRAWBERRY CHARLOTTE BAG',20,'Good inventory'),
('20725','LUNCH BAG RED RETROSPOT',20,'Good inventory'),
('21033','JUMBO BAG CHARLIE AND LOLA TOYS',20,'Good inventory'),
('21094','SET/6 RED SPOTTY PAPER PLATES',24,'Good inventory'),
('21212','PACK OF 72 RETROSPOT CAKE CASES',240,'Good inventory'),
('21559','STRAWBERRY LUNCH BOX WITH CUTLERY',12,'Good inventory'),
('21929','JUMBO BAG PINK VINTAGE PAISLEY',20,'Good inventory'),
('21931','JUMBO STORAGE BAG SUKI',20,'Good inventory'),
('21975','PACK OF 60 DINOSAUR CAKE CASES',48,'Good inventory'),
('21977','PACK OF 60 PINK PAISLEY CAKE CASES',48,'Good inventory'),
('22352','LUNCH BOX WITH CUTLERY RETROSPOT ',12,'Good inventory'),
('22386','JUMBO BAG PINK POLKADOT',20,'Good inventory'),
('84991','60 TEATIME FAIRY CAKE CASES',48,'Good inventory'),
('84519A','TOMATO CHARLIE+LOLA COASTER SET',12,'Good inventory'),
('84997B','RED 3 PIECE RETROSPOT CUTLERY SET',24,'Good inventory'),
('84997C','BLUE 3 PIECE POLKADOT CUTLERY SET',12,'Good inventory'),
('85071B','RED CHARLIE+LOLA PERSONAL DOORSIGN',192,'Good inventory'),
('85099C','JUMBO  BAG BAROQUE BLACK WHITE',200,'Good inventory'),
('85183B','CHARLIE & LOLA WASTEPAPER BIN FLORA',96,'Good inventory'),
('22961','JAM MAKING SET PRINTED',48,'Good inventory'),
('21166','COOK WITH WINE METAL SIGN ',1,'Need attention'),
('21169','YOU''RE CONFUSING ME METAL SIGN ',3,'Need attention'),
('21175','GIN + TONIC DIET METAL SIGN',2,'Need attention'),
('21523','DOORMAT FANCY FONT HOME SWEET HOME',20,'Good inventory'),
('21533','RETROSPOT LARGE MILK JUG',1,'Need attention'),
('21557','SET OF 6 FUNKY BEAKERS',2,'Need attention'),
('21672','WHITE SPOT RED CERAMIC DRAWER KNOB',12,'Good inventory'),
('21934','SKULL SHOULDER BAG',20,'Good inventory'),
('22083','PAPER CHAIN KIT RETROSPOT',1,'Need attention'),
('22139','RETROSPOT TEA SET CERAMIC 11 PC ',46,'Good inventory'),
('22176','BLUE OWL SOFT TOY',1,'Need attention'),
('22261','FELT EGG COSY WHITE RABBIT ',1,'Need attention'),
('22262','FELT EGG COSY CHICKEN',1,'Need attention'),
('22411','JUMBO SHOPPER VINTAGE RED PAISLEY',20,'Good inventory'),
('22438','BALLOON ART MAKE YOUR OWN FLOWERS',1,'Need attention'),
('22637','PIGGY BANK RETROSPOT ',1,'Need attention'),
('22644','CERAMIC CHERRY CAKE MONEY BANK',1,'Need attention'),
('22646','CERAMIC STRAWBERRY CAKE MONEY BANK',4,'Need attention'),
('22719','GUMBALL MONOCHROME COAT RACK',72,'Good inventory'),
('22771','CLEAR DRAWER KNOB ACRYLIC EDWARDIAN',48,'Good inventory'),
('22774','RED DRAWER KNOB ACRYLIC EDWARDIAN',48,'Good inventory'),
('22778','GLASS CLOCHE SMALL',3,'Need attention'),
('47580','TEA TIME DES TEA COSY',2,'Need attention'),
('71270','PHOTO CLIP LINE',1,'Need attention'),
('82567','AIRLINE LOUNGE,METAL SIGN',2,'Need attention'),
('84832','ZINC WILLIE WINKIE  CANDLE STICK',1,'Need attention'),
('84854','GIRLY PINK TOOL SET',5,'Need attention'),
('15056BL','EDWARDIAN PARASOL BLACK',2,'Need attention'),
('15056N','EDWARDIAN PARASOL NATURAL',2,'Need attention'),
('37444A','YELLOW BREAKFAST CUP AND SAUCER',1,'Need attention'),
('37444C','PINK BREAKFAST CUP AND SAUCER ',1,'Need attention'),
('84971S','SMALL HEART FLOWERS HOOK ',12,'Good inventory'),
('21832','CHOCOLATE CALCULATOR',24,'Good inventory'),
('21912','VINTAGE SNAKES & LADDERS',16,'Good inventory'),
('22379','RECYCLING BAG RETROSPOT ',20,'Good inventory'),
('22381','TOY TIDY PINK POLKADOT',100,'Good inventory'),
('22783','SET 3 WICKER OVAL BASKETS W LIDS',4,'Need attention'),
('22798','ANTIQUE GLASS DRESSING TABLE POT',16,'Good inventory'),
('22838','3 TIER CAKE TIN RED AND CREAM',2,'Need attention'),
('22839','3 TIER CAKE TIN GREEN AND CREAM',2,'Need attention'),
('22926','IVORY GIANT GARDEN THERMOMETER',24,'Good inventory'),
('21324','HANGING MEDINA LANTERN SMALL',12,'Good inventory'),
('21340','CLASSIC METAL BIRDCAGE PLANT HOLDER',2,'Need attention'),
('22189','CREAM HEART CARD HOLDER',4,'Need attention'),
('22224','WHITE LOVEBIRD LANTERN',12,'Good inventory'),
('22424','ENAMEL BREAD BIN CREAM',16,'Good inventory'),
('22427','ENAMEL FLOWER JUG CREAM',3,'Need attention'),
('22428','ENAMEL FIRE BUCKET CREAM',12,'Good inventory'),
('22457','NATURAL SLATE HEART CHALKBOARD ',24,'Good inventory'),
('22464','HANGING METAL HEART LANTERN',24,'Good inventory'),
('22469','HEART OF WICKER SMALL',80,'Good inventory'),
('22470','HEART OF WICKER LARGE',80,'Good inventory'),
('82484','WOOD BLACK BOARD ANT WHITE FINISH',3,'Need attention'),
('84755','COLOUR GLASS T-LIGHT HOLDER HANGING',96,'Good inventory'),
('22168','ORGANISER WOOD ANTIQUE WHITE ',2,'Need attention'),
('22662','LUNCH BAG DOLLY GIRL DESIGN',20,'Good inventory'),
('22663','JUMBO BAG DOLLY GIRL DESIGN',20,'Good inventory'),
('85049A','TRADITIONAL CHRISTMAS RIBBONS',24,'Good inventory'),
('84880','WHITE WIRE EGG HOLDER',72,'Good inventory'),
('85099B','JUMBO BAG RED RETROSPOT',200,'Good inventory'),
('22466','FAIRY TALE COTTAGE NIGHTLIGHT',864,'Good inventory'),
('22779','WOODEN OWLS LIGHT GARLAND ',384,'Good inventory'),
('22780','LIGHT GARLAND BUTTERFILES PINK',384,'Good inventory'),
('79321','CHILLI LIGHTS',384,'Good inventory'),
('21115','ROSE CARAVAN DOORSTOP',4,'Need attention'),
('21363','HOME SMALL WOOD LETTERS',3,'Need attention'),
('21411','GINGHAM HEART  DOORSTOP RED',3,'Need attention'),
('22242','5 HOOK HANGER MAGIC TOADSTOOL',24,'Good inventory'),
('22318','FIVE HEART HANGING DECORATION',12,'Good inventory'),
('22915','ASSORTED BOTTLE TOP  MAGNETS ',24,'Good inventory'),
('22922','FRIDGE MAGNETS US DINER ASSORTED',24,'Good inventory'),
('22923','FRIDGE MAGNETS LES ENFANTS ASSORTED',24,'Good inventory'),
('22969','HOMEMADE JAM SCENTED CANDLES',24,'Good inventory'),
('21622','VINTAGE UNION JACK CUSHION COVER',16,'Good inventory'),
('22191','IVORY DINER WALL CLOCK',2,'Need attention'),
('22192','BLUE DINER WALL CLOCK',2,'Need attention'),
('22193','RED DINER WALL CLOCK',2,'Need attention'),
('22195','LARGE HEART MEASURING SPOONS',48,'Good inventory'),
('22196','SMALL HEART MEASURING SPOONS',48,'Good inventory'),
('22941','CHRISTMAS LIGHTS 10 REINDEER',12,'Good inventory'),
('35004C','SET OF 3 COLOURED  FLYING DUCKS',12,'Good inventory'),
('35004G','SET OF 3 GOLD FLYING DUCKS',4,'Need attention'),
('85014A','BLACK/BLUE POLKADOT UMBRELLA',3,'Need attention'),
('85014B','RED RETROSPOT UMBRELLA',12,'Good inventory')

SELECT * 
from PRODUCT;

--5. create constraints and check constraints
--a.he date of Invoice must be after 2010-Jan-01'
CREATE TABLE [INVOICE](
[InvoiceNo] int NOT NULL,
[CustomerID] int,
[InvoiceDate] date,
PRIMARY KEY([InvoiceNo]),
FOREIGN KEY ([CustomerID]) REFERENCES [CUSTOMER]([CustomerID]),
CONSTRAINT [Constraint Date Greater than 1/1/2010] CHECK ([InvoiceDate]>='2010-01-01')
);

INSERT INTO INVOICE(InvoiceNo, InvoiceDate,CustomerID)
VALUES
(536365,'12-01-2010',17850),
(536366,'12-01-2010',17850),
(536367,'12-01-2010',13047),
(536368,'12-01-2010',13047),
(536369,'12-01-2010',13047),
(536370,'12-01-2010',12583),
(536371,'12-01-2010',13748),
(536372,'12-01-2010',17850),
(536373,'12-01-2010',17850),
(536374,'12-01-2010',15100),
(536375,'12-01-2010',17850),
(536376,'12-01-2010',15291),
(536377,'12-01-2010',17850),
(536378,'12-01-2010',14688),
(536380,'12-01-2010',17809),
(536381,'12-01-2010',15311),
(536382,'12-01-2010',16098),
(536384,'12-01-2010',18074),
(536385,'12-01-2010',17420),
(536386,'12-01-2010',16029),
(536387,'12-01-2010',16029),
(536388,'12-01-2010',16250),
(536389,'12-01-2010',12431)


SELECT *
from INVOICE;


--c.the default value of quantity is 0
--e.use ON DELETE CASCADE and ON UPDATE CASCADE for the foreign key of the weak entity
--In our case, On INVOICE_DETAIL is weak entity, FOREIGN KEY ProductCode need set up constraint
CREATE TABLE INVOICE_DETAIL(
InvoiceNo int NOT NULL,
ProductCode varchar(100),
Purchase_Quantity int DEFAULT 0,
UnitPrice float,
Total AS (Purchase_Quantity*UnitPrice) persisted,
PRIMARY KEY (InvoiceNo, ProductCode, UnitPrice),
FOREIGN KEY(InvoiceNo) REFERENCES INVOICE(InvoiceNo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ProductCode) REFERENCES PRODUCT (ProductCode) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO INVOICE_DETAIL(InvoiceNo, ProductCode, Purchase_Quantity, UnitPrice)
VALUES
(536365,'21730',6,4.25),
(536365,'22752',2,7.65),
(536365,'71053',6,3.39),
(536365,'84029E',6,3.39),
(536365,'84029G',6,3.39),
(536365,'84406B',8,2.75),
(536365,'85123A',6,2.55),
(536366,'22632',6,1.85),
(536366,'22633',6,1.85),
(536367,'21754',3,5.95),
(536367,'21755',3,5.95),
(536367,'21777',4,7.95),
(536367,'22310',6,1.65),
(536367,'22622',2,9.95),
(536367,'22623',3,4.95),
(536367,'22745',6,2.1),
(536367,'22748',6,2.1),
(536367,'22749',8,3.75),
(536367,'48187',4,7.95),
(536367,'84879',32,1.69),
(536367,'84969',6,4.25),
(536368,'22912',3,4.95),
(536368,'22913',3,4.95),
(536368,'22914',3,4.95),
(536368,'22960',6,4.25),
(536369,'21756',3,5.95),
(536370,'10002',48,0.85),
(536370,'21035',18,2.95),
(536370,'21724',12,0.85),
(536370,'21731',24,1.65),
(536370,'21791',24,1.25),
(536370,'21883',24,0.65),
(536370,'21913',12,3.75),
(536370,'22326',24,2.95),
(536370,'22492',36,0.65),
(536370,'22540',24,0.42),
(536370,'22544',24,0.42),
(536370,'22629',24,1.95),
(536370,'22631',24,1.95),
(536370,'22659',24,1.95),
(536370,'22661',20,0.85),
(536370,'22726',12,3.75),
(536370,'22727',24,3.75),
(536370,'22728',24,3.75),
(536370,'22900',24,2.95),
(536370,'POST',3,18),
(536371,'22086',80,2.55),
(536372,'22632',6,1.85),
(536372,'22633',6,1.85),
(536373,'20679',6,4.95),
(536373,'21068',6,1.06),
(536373,'21071',6,1.06),
(536373,'21730',6,4.25),
(536373,'21871',6,1.06),
(536373,'22752',2,7.65),
(536373,'37370',6,1.06),
(536373,'71053',6,3.39),
(536373,'82482',6,2.1),
(536373,'82483',2,4.95),
(536373,'82486',4,6.95),
(536373,'82494L',6,2.55),
(536373,'84029E',6,3.39),
(536373,'84029G',6,3.39),
(536373,'84406B',8,2.75),
(536373,'85123A',6,2.55),
(536374,'21258',32,10.95),
(536375,'20679',6,4.95),
(536375,'21068',6,1.06),
(536375,'21071',6,1.06),
(536375,'21730',6,4.25),
(536375,'21871',6,1.06),
(536375,'22752',2,7.65),
(536375,'37370',6,1.06),
(536375,'71053',6,3.39),
(536375,'82482',6,2.1),
(536375,'82483',2,4.95),
(536375,'82486',4,6.95),
(536375,'82494L',6,2.55),
(536375,'84029E',6,3.39),
(536375,'84029G',6,3.39),
(536375,'84406B',8,2.75),
(536375,'85123A',6,2.55),
(536376,'21733',64,2.55),
(536376,'22114',48,3.45),
(536377,'22632',6,1.85),
(536377,'22633',6,1.85),
(536378,'20723',10,0.85),
(536378,'20725',10,1.65),
(536378,'21033',10,2.95),
(536378,'21094',12,0.85),
(536378,'21212',120,0.42),
(536378,'21559',6,2.55),
(536378,'21929',10,1.95),
(536378,'21931',10,1.95),
(536378,'21975',24,0.55),
(536378,'21977',24,0.55),
(536378,'22352',6,2.55),
(536378,'22386',10,1.95),
(536378,'84991',24,0.55),
(536378,'84519A',6,2.95),
(536378,'84997B',12,3.75),
(536378,'84997C',6,3.75),
(536378,'85071B',96,0.38),
(536378,'85099C',10,1.95),
(536378,'85183B',48,1.25),
(536380,'22961',24,1.45),
(536381,'21166',1,1.95),
(536381,'21169',3,1.69),
(536381,'21175',2,2.1),
(536381,'21523',10,6.75),
(536381,'21533',1,4.95),
(536381,'21557',2,2.95),
(536381,'21672',6,1.25),
(536381,'21731',2,1.65),
(536381,'21934',10,1.65),
(536381,'22083',1,2.95),
(536381,'22086',4,2.95),
(536381,'22139',23,4.25),
(536381,'22176',1,2.95),
(536381,'22261',1,0.85),
(536381,'22262',1,0.85),
(536381,'22411',10,1.95),
(536381,'22438',1,1.95),
(536381,'22637',1,2.55),
(536381,'22644',1,1.45),
(536381,'22646',4,1.45),
(536381,'22719',36,1.06),
(536381,'22771',24,1.25),
(536381,'22774',24,1.25),
(536381,'22778',3,3.95),
(536381,'47580',2,2.55),
(536381,'71270',4,1.25),
(536381,'82567',2,2.1),
(536381,'84832',1,0.85),
(536381,'84854',5,4.95),
(536381,'15056BL',2,5.95),
(536381,'15056N',2,5.95),
(536381,'37444A',1,2.95),
(536381,'37444C',1,2.95),
(536381,'84971S',6,0.85),
(536382,'10002',12,0.85),
(536382,'21832',12,1.65),
(536382,'21912',8,3.75),
(536382,'22379',10,2.1),
(536382,'22381',50,1.85),
(536382,'22411',10,1.95),
(536382,'22726',4,3.75),
(536382,'22783',4,16.95),
(536382,'22798',8,2.95),
(536382,'22838',2,14.95),
(536382,'22839',2,14.95),
(536382,'22926',12,5.95),
(536384,'21324',6,2.95),
(536384,'21340',2,12.75),
(536384,'22189',4,3.95),
(536384,'22224',6,2.95),
(536384,'22424',8,10.95),
(536384,'22427',3,5.95),
(536384,'22428',6,6.95),
(536384,'22457',12,2.95),
(536384,'22464',12,1.65),
(536384,'22469',40,1.45),
(536384,'22470',40,2.55),
(536384,'82484',3,6.45),
(536384,'84755',48,0.65),
(536385,'22168',2,8.5),
(536385,'22662',10,1.65),
(536385,'22663',10,1.95),
(536385,'22783',1,19.95),
(536385,'22960',6,4.25),
(536385,'22961',12,1.45),
(536385,'85049A',12,1.25),
(536386,'84880',36,4.95),
(536386,'85099B',100,1.65),
(536386,'85099C',100,1.65),
(536387,'21731',432,1.25),
(536387,'22466',432,1.45),
(536387,'22779',192,3.37),
(536387,'22780',192,3.37),
(536387,'79321',192,3.82),
(536388,'21115',4,6.75),
(536388,'21363',3,4.95),
(536388,'21411',3,4.25),
(536388,'21523',2,7.95),
(536388,'21754',3,5.95),
(536388,'21755',3,5.95),
(536388,'22242',12,1.65),
(536388,'22318',6,2.95),
(536388,'22464',12,1.65),
(536388,'22469',12,1.65),
(536388,'22915',12,0.42),
(536388,'22922',12,0.85),
(536388,'22923',12,0.85),
(536388,'22969',12,1.45),
(536389,'21622',8,4.95),
(536389,'21791',12,1.25),
(536389,'22191',2,8.5),
(536389,'22192',2,8.5),
(536389,'22193',2,8.5),
(536389,'22195',24,1.65),
(536389,'22196',24,0.85),
(536389,'22726',4,3.75),
(536389,'22727',4,3.75),
(536389,'22941',6,8.5),
(536389,'35004C',6,5.45),
(536389,'35004G',4,6.35),
(536389,'85014A',3,5.95),
(536389,'85014B',6,5.95)

SELECT *
from INVOICE_DETAIL;

--TESTING OUTPUT WITH THE EXCEL ROWS
SELECT 
I.InvoiceNo, 
ID.ProductCode,
P.Description,
P.Inventory_Quantity,
ID.Purchase_Quantity,
P.status,
I.InvoiceDate,
ID.UnitPrice,
I.CustomerID,
C.Country
from INVOICE I
LEFT JOIN INVOICE_DETAIL ID ON ID.InvoiceNo=I.InvoiceNo
LEFT JOIN CUSTOMER C ON C.CustomerID=I.CustomerID
LEFT JOIN PRODUCT P ON P.ProductCode=ID.ProductCode;

--TEST CASE
SELECT *
from INVOICE_DETAIL
WHERE InvoiceNo='536365';

--6. Add a column into table Product to indicate the inventory status(If the column has not been created
--in previous steps). Create a trigger named quantity_update that checks the quantity of each product
--Trigger timing and event: After Updating rows in the product table
--Trigger action: If the quantity is below 5, then change the inventory status to Need attention"

CREATE TRIGGER qty_trigger_1
ON PRODUCT AFTER UPDATE
AS 
BEGIN
IF UPDATE(Inventory_Quantity) AND EXISTS(
SELECT *
FROM inserted
WHERE Inventory_Quantity<5)
BEGIN
UPDATE PRODUCT SET Status='Needs Attention'
WHERE ProductCode IN(
SELECT ProductCode
FROM inserted
WHERE Inventory_Quantity<5);
END
ELSE
BEGIN
UPDATE PRODUCT SET Status='Good Inventory'
WHERE ProductCode IN(
SELECT ProductCode
FROM inserted
WHERE Inventory_Quantity>=5);
END
END;

--test case
SELECT *
FROM PRODUCT
WHERE ProductCode='71053';

UPDATE PRODUCT
SET 
Inventory_Quantity=3
WHERE ProductCode='71053';

UPDATE PRODUCT
SET 
Inventory_Quantity=12
WHERE ProductCode='71053'

--7) Run two queries:
--a. Find all the customers(ids) who purchased CREAM CUPID HEARTS COAT HANGER and SAVE THE PLANET MUG
--TEST OUTPUT WITH THE EXCEL ROWS

SELECT DISTINCT I.CustomerID
FROM INVOICE I
LEFT JOIN INVOICE_DETAIL ID ON ID.InvoiceNo=I.InvoiceNo
LEFT JOIN CUSTOMER C ON C.CustomerID=I.CustomerID
LEFT JOIN PRODUCT P ON P.ProductCode = ID.ProductCode
WHERE P.Description IN ('CREAM CUPID HEARTS COAT HANGER','SAVE THE PLANET MUG');

--b. Find out which customer spent most money
--testing output with the excel rows
SELECT TOP 1
I.CustomerID,
SUM(ID.Total) AS 'Total Amount'
FROM INVOICE I
LEFT JOIN INVOICE_DETAIL ID ON ID.InvoiceNo=I.InvoiceNo
LEFT JOIN CUSTOMER C ON C.CustomerID=I.CustomerID
LEFT JOIN PRODUCT P ON P.ProductCode=ID.ProductCode
GROUP BY I.CustomerID
ORDER BY 2 DESC;