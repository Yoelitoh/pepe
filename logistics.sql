

DROP DATABASE IF EXISTS logistics;
CREATE DATABASE logistics;
USE logistics;


CREATE TABLE warehouse (
  warehouse_id INT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  city VARCHAR(100) NOT NULL,
  `point` POINT SRID 4326
);

CREATE TABLE item (
  item_id INT PRIMARY KEY,
  sku VARCHAR(40),
  name VARCHAR(160),
  unit_price DECIMAL(10,2)
);

CREATE TABLE shipment (
  shipment_id INT PRIMARY KEY,
  warehouse_id INT NOT NULL,
  ship_date DATE NOT NULL,
  destination VARCHAR(120) NOT NULL,
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);

CREATE TABLE shipment_item (
  shipment_id INT,
  item_id INT,
  quantity INT NOT NULL,
  PRIMARY KEY (shipment_id, item_id),
  FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id),
  FOREIGN KEY (item_id) REFERENCES item(item_id)
);

 
INSERT INTO warehouse(warehouse_id, name, city, `point`) VALUES
  (1,'North Hub','Bilbao',     ST_GeomFromText('POINT(-2.934985 43.263012)',4326)),
  (2,'Coastal DC','Santander', ST_GeomFromText('POINT(-3.804000 43.463000)',4326)),
  (3,'Central DC','Valladolid',ST_GeomFromText('POINT(-4.728000 41.652000)',4326)),
  (4,'East Hub','Zaragoza',    ST_GeomFromText('POINT(-0.889000 41.648000)',4326));

INSERT INTO item(item_id, sku, name, unit_price) VALUES
  (10,'BX-100','BX small',1.20),
  (11,'BX-200','BX medium',1.50),
  (12,'BX-300','BX large',1.90),
  (13,'PL-001','Pallet 120x80',14.00),
  (14,'TB-010','Tape roll',2.30);

INSERT INTO shipment(shipment_id, warehouse_id, ship_date, destination) VALUES
  (100,1,'2026-02-02','Vigo'),
  (101,2,'2026-02-03','Oviedo'),
  (102,3,'2026-02-04','Madrid'),
  (103,4,'2026-02-05','Valencia'),
  (104, 1, '2026-02-10', 'Barcelona'), 
  (105, 1, '2026-02-08', 'Sevilla'),   
  (106, 2, '2026-02-15', 'Bilbao'),   
  (107, 2, '2026-02-12', 'Madrid'),    
  (108, 3, '2026-02-20', 'Burgos'),    
  (109, 3, '2026-02-18', 'León');    

INSERT INTO shipment_item(shipment_id, item_id, quantity) VALUES
  (100,10,200),
  (100,14,50),
  (101,11,150),
  (102,13,20),
  (102,12,120),
  (103,10,300);
