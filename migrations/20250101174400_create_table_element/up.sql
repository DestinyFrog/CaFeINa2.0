CREATE TABLE element (
	`_id` INTEGER PRIMARY KEY,
	`atomic_number` INTEGER UNIQUE,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`oficial_name` TEXT UNIQUE NOT NULL,
	`latin_name` TEXT DEFAULT NULL,
	`atomic_radius` INTEGER,
	`category` TEXT,
	`atomic_mass` REAL,
	`eletronegativity` REAL,
	`period` INTEGER NOT NULL,
	`family` INTEGER NOT NULL,
	`symbol` TEXT UNIQUE NOT NULL,
	`fase` CHAR,
	`xpos` INTEGER NOT NULL,
	`ypos` INTEGER NOT NULL,
	`layers` JSON,
	`electronic_configuration` TEXT,
	`oxidation_state` JSON,
	`discovery_year` INTEGER DEFAULT NULL,
	`discovery` JSON DEFAULT NULL,
	`another_names` JSON DEFAULT '[]'
);

INSERT INTO element (atomic_number, oficial_name, atomic_radius, category, atomic_mass, eletronegativity, `period`, family, symbol, fase, xpos, ypos, layers, electronic_configuration, oxidation_state, discovery_year, discovery, another_names, latin_name)
VALUES
(1,'hidrogênio',53,'hidrogênio',1.00794,2.1,1,1,'H','G',1,1,'[1]','1s1','[1]',1766,'["Henry Cavendish"]','[]',NULL),
(2,'hélio',31,'gás nobre',4.002602,NULL,1,18,'He','G',18,1,'[2]','1s2','[]',1868,'["Jules Janssen","Norman Lockyer"]','[]',NULL),
(3,'lítio',167,'metal alcalino',6.941,0.98,2,1,'Li','S',1,2,'[2,1]','1s2 2s1','[1]',1817,'["Johan August Arfwedson"]','[]',NULL),
(4,'berílio',112,'metal alcalino terroso',9.012182,1.57,2,2,'Be','S',2,2,'[2,2]','1s2 2s2','[2]',1797,'["Louis Nicolas Vauquelin"]','[]',NULL),
(5,'boro',87,'semimetal',10.811,2.04,2,13,'B','S',13,2,'[2,3]','1s2 2s2 2p1','[]',1808,'["Louis Jacques Thénard","Humphry Davy","Louis Joseph Gay-Lussac"]','[]',NULL),
(6,'carbono',67,'ametal',12.0107,2.55,2,14,'C','S',14,2,'[2,4]','1s2 2s2 2p2','[-2]',1779,'["Antoine Lavoisier"]','[]',NULL),
(7,'nitrogênio',56,'ametal',14.0067,3.04,2,15,'N','G',15,2,'[2,5]','1s2 2s2 2p3','[-2]',1772,'["Daniel Rutherford"]','["azoto"]',NULL),
(8,'oxigênio',48,'ametal',15.9994,3.44,2,16,'O','G',16,2,'[2,6]','1s2 2s2 2p4','[-2]',1774,'["Joseph Priestley","Antoine Lavoisier","Carl Wilhelm Scheele"]','[]',NULL),
(9,'flúor',42,'halogênio',18.9984032,3.98,2,17,'F','G',17,2,'[2,7]','1s2 2s2 2p5','[-1]',1886,'["Henri Moissan"]','[]',NULL),
(10,'neônio',38,'gás nobre',20.1797,NULL,2,18,'Ne','G',18,2,'[2,8]','1s2 2s2 2p6','[]',1898,'["William Ramsay","Morris William Travers"]','[]',NULL),
(11,'sódio',190,'metal alcalino',22.98977,0.93,3,1,'Na','S',1,3,'[2,8,1]','1s2 2s2 2p6 3s1','[1]',1807,'["Humphry Davy"]','[]',NULL),
(12,'magnésio',145,'metal alcalino terroso',24.305,1.31,3,2,'Mg','S',2,3,'[2,8,2]','1s2 2s2 2p6 3s2','[2]',1755,'["Humphry Davy","Joseph Black"]','[]',NULL),
(13,'alumínio',118,'outros metais',26.981538,1.61,3,13,'Al','S',13,3,'[2,8,3]','1s2 2s2 2p6 3s2 3p1','[3]',1825,'["Hans Christian Ørsted"]','[]',NULL),
(14,'silício',111,'semimetal',28.0855,1.9,3,14,'Si','S',14,3,'[2,8,4]','1s2 2s2 2p6 3s2 3p2','[4]',1824,'["Jöns Jacob Berzelius","Antoine Lavoisier"]','[]',NULL),
(15,'fósforo',98,'ametal',30.973761,2.19,3,15,'P','S',15,3,'[2,8,5]','1s2 2s2 2p6 3s2 3p3','[]',1669,'["Henning Brand"]','[]',NULL),
(16,'enxofre',88,'ametal',32.065,2.58,3,16,'S','S',16,3,'[2,8,6]','1s2 2s2 2p6 3s2 3p4','[-2]',1869,'["Antoine Lavoisier"]','[]',NULL),
(17,'cloro',79,'halogênio',35.453,3.16,3,17,'Cl','G',17,3,'[2,8,7]','1s2 2s2 2p6 3s2 3p5','[-1]',1774,'["Carl Wilhelm Scheele"]','[]',NULL),
(18,'argônio',71,'gás nobre',39.948,NULL,3,18,'Ar','G',18,3,'[2,8,8]','1s2 2s2 2p6 3s2 3p6','[]',1894,'["William Ramsay","John William Strutt"]','[]',NULL),
(19,'potássio',243,'metal alcalino',39.0983,0.82,4,1,'K','S',1,4,'[2,8,8,1]','1s2 2s2 2p6 3s2 3p6 4s1','[1]',1807,'["Humphry Davy"]','[]',NULL),
(20,'cálcio',194,'metal alcalino terroso',40.078,1,4,2,'Ca','S',2,4,'[2,8,8,2]','1s2 2s2 2p6 3s2 3p6 4s2','[2]',1808,'["Humphry Davy"]','[]',NULL),
(21,'escândio',184,'metal de transição',44.95591,1.36,4,3,'Sc','S',3,4,'[2,8,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d1','[3]',1879,'["Lars Fredrik Nilson","Per Teodor Cleve"]','[]',NULL),
(22,'titânio',176,'metal de transição',47.867,1.54,4,4,'Ti','S',4,4,'[2,8,10,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d2','[2,3,4]',1791,'["William Justin Gregor"]','[]',NULL),
(23,'vanádio',171,'metal de transição',50.9415,1.63,4,5,'V','S',5,4,'[2,8,11,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d3','[2,3,4,5]',1801,'["Andrés Manuel del Río"]','[]',NULL),
(24,'cromo',166,'metal de transição',51.9961,1.66,4,6,'Cr','S',6,4,'[2,8,13,1]','1s2 2s2 2p6 3s2 3p6 4s1 3d5','[3]',1797,'["Louis Nicolas Vauquelin"]','[]',NULL),
(25,'manganês',161,'metal de transição',54.938049,1.55,4,7,'Mn','S',7,4,'[2,8,13,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d5','[2,3,4,6,7]',1774,'["Carl Wilhelm Scheele","Johan Gottlieb Gahn","Ignatius Gottfried Kaim"]','[]',NULL),
(26,'ferro',156,'metal de transição',55.845,1.83,4,8,'Fe','S',8,4,'[2,8,14,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d6','[2,3]',NULL,NULL,'[]',NULL),
(27,'cobalto',152,'metal de transição',58.9332,1.88,4,9,'Co','S',9,4,'[2,8,15,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d7','[2,3]',1735,'["George Brandt"]','[]',NULL),
(28,'níquel',149,'metal de transição',58.6934,1.91,4,10,'Ni','S',10,4,'[2,8,16,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d8','[2,0,1,3,4]',1751,'["Axel Fredrik Cronstedt"]','[]',NULL),
(29,'cobre',145,'metal de transição',63.546,1.9,4,11,'Cu','S',11,4,'[2,8,18,1]','1s2 2s2 2p6 3s2 3p6 4s1 3d10','[2,1]',NULL,NULL,'[]',NULL),
(30,'zinco',142,'metal de transição',65.409,1.65,4,12,'Zn','S',12,4,'[2,8,18,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10','[2]',1746,'["Andreas Sigismund Marggraf"]','[]',NULL),
(31,'gálio',136,'outros metais',69.723,1.81,4,13,'Ga','S',13,4,'[2,8,18,3]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p1','[3]',1875,'["Paul-Émile Lecoq de Boisbaudran"]','[]',NULL),
(32,'germânio',125,'semimetal',72.64,2.01,4,14,'Ge','S',14,4,'[2,8,18,4]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p2','[4]',1886,'["Clemens Winkler"]','[]',NULL),
(33,'arsênio',114,'semimetal',74.9216,2.18,4,15,'As','S',15,4,'[2,8,18,5]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p3','[-3,0,3,5]',1250,'["Alberto Magno"]','[]',NULL),
(34,'selênio',103,'ametal',78.96,2.55,4,16,'Se','S',16,4,'[2,8,18,6]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p4','[-2]',1817,'["Jöns Jacob Berzelius","Johan Gottlieb Gahn"]','[]',NULL),
(35,'bromo',94,'halogênio',79.904,2.96,4,17,'Br','L',17,4,'[2,8,18,7]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p5','[-1]',1826,'["Antoine Jérôme Balard","Carl Jacob Löwig"]','[]',NULL),
(36,'criptônio',88,'gás nobre',83.798,NULL,4,18,'Kr','G',18,4,'[2,8,18,8]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6','[]',1898,'["William Ramsay","Morris William Travers"]','[]',NULL),
(37,'rubídio',265,'metal alcalino',85.4678,0.82,5,1,'Rb','S',1,5,'[2,8,18,8,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1','[1]',1861,'["Gustav Kirchhoff","Robert Bunsen"]','[]',NULL),
(38,'estrôncio',219,'metal alcalino terroso',87.62,0.95,5,2,'Sr','S',2,5,'[2,8,18,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2','[2]',1790,'["Humphry Davy","Adair Crawford","William Cruickshank"]','[]',NULL),
(39,'ítrio',212,'metal de transição',88.90585,1.22,5,3,'Y','S',3,5,'[2,8,18,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d1','[3]',1794,'["Johan Gadolin"]','[]',NULL),
(40,'zircônio',206,'metal de transição',91.224,1.33,5,4,'Zr','S',4,5,'[2,8,18,10,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d2','[4]',1789,'["Martin Heinrich Klaproth"]','[]',NULL),
(41,'nióbio',198,'metal de transição',92.90638,1.6,5,5,'Nb','S',5,5,'[2,8,18,12,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d4','[5]',1801,'["Charles Hatchett"]','[]',NULL),
(42,'molibdênio',190,'metal de transição',95.94,2.16,5,6,'Mo','S',6,5,'[2,8,18,13,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d5','[6]',1778,'["Carl Wilhelm Scheele"]','[]',NULL),
(43,'tecnécio',183,'metal de transição',97.9072,1.9,5,7,'Tc','S',7,5,'[2,8,18,13,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d5','[]',1937,'["Emilio Gino Segrè","Carlo Perrier"]','[]',NULL),
(44,'rutênio',178,'metal de transição',101.07,2.2,5,8,'Ru','S',8,5,'[2,8,18,15,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d7','[]',1844,'["Karl Ernst Claus"]','[]',NULL),
(45,'ródio',173,'metal de transição',102.9055,2.28,5,9,'Rh','S',9,5,'[2,8,18,16,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d8','[]',1803,'["William Hyde Wollaston"]','[]',NULL),
(46,'paládio',169,'metal de transição',106.42,2.2,5,10,'Pd','S',10,5,'[2,8,18,18]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 4d10','[2,4]',1803,'["William Hyde Wollaston"]','[]',NULL),
(47,'prata',165,'metal de transição',107.8682,1.93,5,11,'Ag','S',11,5,'[2,8,18,18,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d10','[1]',NULL,NULL,'[]',NULL),
(48,'cádmio',161,'metal de transição',112.411,1.69,5,12,'Cd','S',12,5,'[2,8,18,18,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10','[2]',1817,'["Friedrich Stromeyer","Karl Samuel Leberecht Hermann"]','[]',NULL),
(49,'índio',156,'outros metais',114.818,1.78,5,13,'In','S',13,5,'[2,8,18,18,3]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p1','[]',1863,'["Ferdinand Reich"]','[]',NULL),
(50,'estanho',145,'outros metais',118.71,1.96,5,14,'Sn','S',14,5,'[2,8,18,18,4]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p2','[2]',1765,NULL,'[]',NULL),
(51,'antimônio',133,'semimetal',121.76,2.05,5,15,'Sb','S',15,5,'[2,8,18,18,5]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p3','[]',NULL,NULL,'[]',NULL),
(52,'telúrio',123,'semimetal',127.6,2.1,5,16,'Te','S',16,5,'[2,8,18,18,6]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p4','[-2]',1782,'["Martin Heinrich Klaproth","Franz Joseph Müller von Reichenstein"]','[]',NULL),
(53,'iodo',115,'halogênio',126.90447,2.66,5,17,'I','S',17,5,'[2,8,18,18,7]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p5','[-1]',1811,'["Bernard Courtois"]','[]',NULL),
(54,'xenônio',108,'gás nobre',131.293,2.6,5,18,'Xe','G',18,5,'[2,8,18,18,8]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6','[]',1898,'["William Ramsay","Morris William Travers"]','[]',NULL),
(55,'césio',298,'metal alcalino',132.90545,0.79,6,1,'Cs','S',1,6,'[2,8,18,18,8,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1','[1]',1860,'["Robert Bunsen","Gustav Kirchhoff"]','[]',NULL),
(56,'bário',253,'metal alcalino terroso',137.327,0.89,6,2,'Ba','S',2,6,'[2,8,18,18,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2','[2]',1808,'["Humphry Davy","Carl Wilhelm Scheele"]','[]',NULL),
(57,'lantânio',NULL,'lantanídeo',138.9055,1.1,6,3,'La','S',4,9,'[2,8,18,18,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 5d1','[3]',1839,'["Carl Gustaf Mosander"]','[]',NULL),
(58,'cério',NULL,'lantanídeo',140.116,1.12,6,3,'Ce','S',5,9,'[2,8,18,19,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 5d1 4f1','[3]',1803,'["Jöns Jacob Berzelius","Martin Heinrich Klaproth","Carl Gustaf Mosander"]','[]',NULL),
(59,'praseodímio',247,'lantanídeo',140.90765,1.13,6,3,'Pr','S',6,9,'[2,8,18,21,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f3','[]',1885,'["Carl Auer von Welsbach"]','[]',NULL),
(60,'neodímio',206,'lantanídeo',144.24,1.14,6,3,'Nd','S',7,9,'[2,8,18,22,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f4','[4]',1885,'["Carl Auer von Welsbach"]','[]',NULL),
(61,'promécio',205,'lantanídeo',144.9127,1.13,6,3,'Pm','S',8,9,'[2,8,18,23,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f5','[3]',1945,'["Jacob A. Marinsky","Charles D. Coryell","Lawrence E. Glendenin"]','[]',NULL),
(62,'samário',238,'lantanídeo',150.36,1.17,6,3,'Sm','S',9,9,'[2,8,18,24,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f6','[3,2]',1879,'["Paul-Émile Lecoq de Boisbaudran"]','[]',NULL),
(63,'európio',231,'lantanídeo',151.964,1.2,6,3,'Eu','S',10,9,'[2,8,18,25,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f7','[3]',1901,'["Paul-Émile Lecoq de Boisbaudran","Eugène-Anatole Demarçay"]','[]',NULL),
(64,'gadolínio',233,'lantanídeo',157.25,1.2,6,3,'Gd','S',11,9,'[2,8,18,25,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f7 5d1','[3]',1880,'["Jean Charles Galissard de Marignac","Paul-Émile Lecoq de Boisbaudran"]','[]',NULL),
(65,'térbio',225,'lantanídeo',158.92534,1.1,6,3,'Tb','S',12,9,'[2,8,18,27,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f9','[]',1843,'["Carl Gustaf Mosander"]','[]',NULL),
(66,'disprósio',228,'lantanídeo',162.5,1.22,6,3,'Dy','S',13,9,'[2,8,18,28,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f10','[3]',1886,'["Paul-Émile Lecoq de Boisbaudran"]','[]',NULL),
(67,'hólmio',NULL,'lantanídeo',164.93032,1.23,6,3,'Ho','S',14,9,'[2,8,18,29,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f11','[]',1878,'["Per Teodor Cleve","Marc Delafontaine","Jacques Louis Soret"]','[]',NULL),
(68,'érbio',226,'lantanídeo',167.259,1.24,6,3,'Er','S',15,9,'[2,8,18,30,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f12','[]',1843,'["Carl Gustaf Mosander"]','[]',NULL),
(69,'túlio',222,'lantanídeo',168.93421,1.25,6,3,'Tm','S',16,9,'[2,8,18,31,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f13','[]',1879,'["Per Teodor Cleve"]','[]',NULL),
(70,'itérbio',222,'lantanídeo',173.04,1.1,6,3,'Yb','S',17,9,'[2,8,18,32,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14','[]',1878,'["Jean Charles Galissard de Marignac"]','[]',NULL),
(71,'lutécio',217,'lantanídeo',174.967,1.27,6,3,'Lu','S',18,9,'[2,8,18,32,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d1','[]',1907,'["Georges Urbain","Charles James"]','[]',NULL),
(72,'háfnio',208,'metal de transição',178.49,1.3,6,4,'Hf','S',4,6,'[2,8,18,32,10,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d2','[4]',1923,'["George de Hevesy","Dirk Coster"]','[]',NULL),
(73,'tântalo',200,'metal de transição',180.9479,1.5,6,5,'Ta','S',5,6,'[2,8,18,32,11,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d3','[3]',1802,'["Anders Gustaf Ekeberg"]','[]',NULL),
(74,'tungstênio',193,'metal de transição',183.84,2.36,6,6,'W','S',6,6,'[2,8,18,32,12,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d4','[4,6]',1783,'["Juan José Delhuyar","Fausto Delhuyar"]','[]',NULL),
(75,'rênio',188,'metal de transição',186.207,1.9,6,7,'Re','S',7,6,'[2,8,18,32,13,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d5','[]',1925,'["Ida Noddack","Walter Noddack","Otto Berg"]','[]',NULL),
(76,'ósmio',185,'metal de transição',190.23,2.2,6,8,'Os','S',8,6,'[2,8,18,32,14,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d6','[4,3]',1803,NULL,'[]',NULL),
(77,'irídio',180,'metal de transição',192.217,2.2,6,9,'Ir','S',9,6,'[2,8,18,32,15,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d7','[]',1803,NULL,'[]',NULL),
(78,'platina',177,'metal de transição',195.078,2.28,6,10,'Pt','S',10,6,'[2,8,18,32,17,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1 4f14 5d9','[2]',1735,'["Antonio de Ulloa"]','[]',NULL),
(79,'ouro',174,'metal de transição',196.96655,2.54,6,11,'Au','S',11,6,'[2,8,18,32,18,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1 4f14 5d10','[3,1]',1695,NULL,'[]',NULL),
(80,'mercúrio',171,'metal de transição',200.59,2,6,12,'Hg','L',12,6,'[2,8,18,32,18,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10','[2,1,0]',NULL,NULL,'[]',NULL),
(81,'tálio',156,'outros metais',204.3833,2.04,6,13,'Tl','S',13,6,'[2,8,18,32,18,3]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p1','[]',1861,'["William Crookes"]','[]',NULL),
(82,'chumbo',154,'outros metais',207.2,2.33,6,14,'Pb','S',14,6,'[2,8,18,32,18,4]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p2','[2,4]',NULL,NULL,'[]',NULL),
(83,'bismuto',143,'outros metais',208.98038,2.02,6,15,'Bi','S',15,6,'[2,8,18,32,18,5]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p3','[3,-3]',1753,'["Claude François Geoffroy"]','[]',NULL),
(84,'polônio',135,'outros metais',208.9824,2,6,16,'Po','S',16,6,'[2,8,18,32,18,6]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p4','[-2,2,4]',1898,'["Marie Curie","Pierre Curie"]','[]',NULL),
(85,'astatínio',NULL,'halogênio',209.9871,2.2,6,17,'At','S',17,6,'[2,8,18,32,18,7]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p5','[-1]',1940,'["Emilio Gino Segrè"]','[]',NULL),
(86,'radônio',120,'gás nobre',222.0176,NULL,6,18,'Rn','G',18,6,'[2,8,18,32,18,8]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6','[]',1900,'["Friedrich Ernst Dorn"]','[]',NULL),
(87,'frâncio',270,'metal alcalino',223.0197,0.7,7,1,'Fr','S',1,7,'[2,8,18,32,18,8,1]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s1','[1]',1939,'["Marguerite Catherine Perey"]','[]',NULL),
(88,'rádio',NULL,'metal alcalino terroso',226.0254,0.89,7,2,'Ra','S',2,7,'[2,8,18,32,18,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2','[2]',1898,'["Marie Curie","Pierre Curie"]','[]',NULL),
(89,'actínio',NULL,'actinídeo',227.0277,1.1,7,3,'Ac','S',4,10,'[2,8,18,32,18,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 6d1','[3]',1899,'["André-Louis Debierne"]','[]',NULL),
(90,'tório',NULL,'actinídeo',232.0381,1.3,7,3,'Th','S',5,10,'[2,8,18,32,18,10,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 6d2','[4]',1828,'["Jöns Jacob Berzelius"]','[]',NULL),
(91,'protactínio',NULL,'actinídeo',231.03588,1.5,7,3,'Pa','S',6,10,'[2,8,18,32,20,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f2 6d1','[5]',1913,'["Kasimir Fajans","Oswald Helmuth Göhring"]','[]',NULL),
(92,'urânio',NULL,'actinídeo',238.02891,1.38,7,3,'U','S',7,10,'[2,8,18,32,21,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f3 6d1','[3,4,5,6]',1789,'["Martin Heinrich Klaproth"]','[]',NULL),
(93,'netúnio',NULL,'actinídeo',237.0482,1.36,7,3,'Np','S',8,10,'[2,8,18,32,22,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f4 6d1','[]',1940,'["Edwin Mattison McMillan","Philip Abelson"]','[]',NULL),
(94,'plutônio',NULL,'actinídeo',244.0642,1.28,7,3,'Pu','S',9,10,'[2,8,18,32,24,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f6','[3,4,5,6,7]',1940,'["Arthur Wahl","Glenn Theodore Seaborg","Edwin Mattison McMillan","Joseph William Kennedy"]','[]',NULL),
(95,'amerício',NULL,'actinídeo',243.0614,1.3,7,3,'Am','S',10,10,'[2,8,18,32,25,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f7','[]',1944,'["Albert Ghiorso","Glenn Theodore Seaborg","Ralph A. James"]','[]',NULL),
(96,'cúrio',NULL,'actinídeo',247.0704,1.3,7,3,'Cm','S',11,10,'[2,8,18,32,25,9,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f7 6d1','[]',1944,'["Glenn Theodore Seaborg","Ralph A. James"]','[]',NULL),
(97,'berquélio',NULL,'actinídeo',247.0703,1.3,7,3,'Bk','S',12,10,'[2,8,18,32,27,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f9','[3,4]',1949,'["Glenn Theodore Seaborg","Albert Ghiorso"]','[]',NULL),
(98,'califórnio',NULL,'actinídeo',251.0796,1.3,7,3,'Cf','S',13,10,'[2,8,18,32,28,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f10','[]',1950,'["Albert Ghiorso","Glenn Theodore Seaborg"]','[]',NULL),
(99,'einstéinio',NULL,'actinídeo',252.083,1.3,7,3,'Es','S',14,10,'[2,8,18,32,29,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f11','[]',1952,'["Albert Ghiorso","Glenn Theodore Seaborg"]','[]',NULL),
(100,'férmio',NULL,'actinídeo',257.0951,1.3,7,3,'Fm','S',15,10,'[2,8,18,32,30,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f12','[]',1953,'["Glenn Theodore Seaborg","Albert Ghiorso"]','[]',NULL),
(101,'mendelévio',NULL,'actinídeo',258.0984,1.3,7,3,'Md','S',16,10,'[2,8,18,32,31,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f13','[]',1955,'["Glenn Theodore Seaborg"]','[]',NULL),
(102,'nobélio',NULL,'actinídeo',259.101,1.3,7,3,'No','S',17,10,'[2,8,18,32,32,8,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14','[]',1958,'["Glenn Theodore Seaborg","Instituto Central de Investigações Nucleares"]','[]',NULL),
(103,'laurêncio',NULL,'actinídeo',262.1097,NULL,7,3,'Lr','S',18,10,'[2,8,18,32,32,8,3]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 7p1','[]',1961,'["Laboratório Nacional de Lawrence Berkeley"]','[]',NULL),
(104,'rutherfórdio',NULL,'metal de transição',261.1088,NULL,7,4,'Rf','S',4,7,'[2,8,18,32,32,10,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d2','[]',1964,'["Albert Ghiorso","Instituto Central de Investigações Nucleares"]','[]',NULL),
(105,'dúbnio',NULL,'metal de transição',262.1141,NULL,7,5,'Db','S',5,7,'[2,8,18,32,32,11,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d3','[]',1967,'["Albert Ghiorso","Laboratório Nacional de Lawrence Berkeley","Instituto Central de Investigações Nucleares"]','[]',NULL),
(106,'seabórgio',NULL,'metal de transição',266.1219,NULL,7,6,'Sg','S',6,7,'[2,8,18,32,32,12,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d4','[]',1974,'["Albert Ghiorso","Laboratório Nacional de Lawrence Berkeley"]','[]',NULL),
(107,'bóhrio',NULL,'metal de transição',264.12,NULL,7,7,'Bh','S',7,7,'[2,8,18,32,32,13,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d5','[]',1981,'["Peter Armbruster","Gottfried Münzenberg"]','[]',NULL),
(108,'hássio',NULL,'metal de transição',277,NULL,7,8,'Hs','S',8,7,'[2,8,18,32,32,14,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d6','[]',1984,'["Peter Armbruster","Gottfried Münzenberg"]','[]',NULL),
(109,'meitnério',NULL,'desconhecido',268.1388,NULL,7,9,'Mt','S',9,7,'[2,8,18,32,32,15,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d7','[]',1982,'["Peter Armbruster","Gottfried Münzenberg"]','[]',NULL),
(110,'darmstadtio',NULL,'desconhecido',281,NULL,7,10,'Ds','S',10,7,'[2,8,18,32,32,16,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d8','[]',1994,'["Sigurd Hofmann"]','[]',NULL),
(111,'roentgénio',NULL,'desconhecido',272.1535,NULL,7,11,'Rg','S',11,7,'[2,8,18,32,32,17,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d9','[]',1994,'["Sigurd Hofmann"]','[]',NULL),
(112,'copernício',NULL,'metal de transição',285,NULL,7,12,'Cn','L',12,7,'[2,8,18,32,32,18,2]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10','[]',1996,'["Sigurd Hofmann"]','[]',NULL),
(113,'nihônio',NULL,'desconhecido',286,NULL,7,13,'Nh','S',13,7,'[2,8,18,32,32,18,3]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p1','[]',2003,'["Riken"]','[]',NULL),
(114,'fleróvio',NULL,'outros metais',289,NULL,7,14,'Fl','S',14,7,'[2,8,18,32,32,18,4]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p2','[]',1998,'["Sigurd Hofmann","Instituto Central de Investigações Nucleares","Laboratório Flerov de Reações Nucleares"]','[]',NULL),
(115,'moscóvio',NULL,'desconhecido',289,NULL,7,15,'Mc','S',15,7,'[2,8,18,32,32,18,5]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p3','[]',2003,NULL,'[]',NULL),
(116,'livermório',NULL,'desconhecido',289,NULL,7,16,'Lv','S',16,7,'[2,8,18,32,32,18,6]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p4','[]',2000,'["Instituto Central de Investigações Nucleares"]','[]',NULL),
(117,'tenesso',NULL,'desconhecido',294,NULL,7,17,'Ts','S',17,7,'[2,8,18,32,32,18,7]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p5','[]',2010,'["Yuri Oganessian","Instituto Central de Investigações Nucleares"]','[]',NULL),
(118,'oganessônio',NULL,'desconhecido',294,NULL,7,18,'Og','S',18,7,'[2,8,18,32,32,18,8]','1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p6','[]',2002,'["Yuri Oganessian"]','[]',NULL)