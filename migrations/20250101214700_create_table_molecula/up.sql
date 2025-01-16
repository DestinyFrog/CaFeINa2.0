CREATE TABLE `molecula` (
	`_id` INTEGER PRIMARY KEY,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`iupac_name` TEXT,
	`popular_name` TEXT,
	`another_names` JSON,
	`characteristics` JSON,
	`xyz` TEXT,
	`xy` TEXT DEFAULT '',
	`organic` TEXT,
	`term` TEXT,
	`formula` TEXT
);

INSERT INTO `molecula`
(`organic`, `formula`, `term`, `iupac_name`, `popular_name`, `another_names`,
	`xyz`,
	`xy`,
	`characteristics`
)
VALUES

('inorgânico',	'H<2>O',			'HHO',					'oxidano',				'água',				'[]',
	'O 0 0 0|H 0 61.26 79.05|H 180 61.26 79.05',
	'O 0 0 0 1|H 0.79 0.61 1|H -0.79 0.61 0$1 s|1 s',
	'["óxido"]'
),

('inorgânico',	'NH<3>',			'HHHN',					'amônia',				'amônia',			'[]',
	'N 0 0 0|H 0 78.86 64.21|H 120 78.86 64.21|H 240 78.86 64.21',
	'N 0 0 0 1 2|H 0.79 0.61 0|H -0.91 0.4 1|H -0.34 0.94 2$1 s|1 f|1 s',
	'[]'
),

--< MONOATOMICOS >

('inorgânico',	'H<2>',				'HH',					'hidrogênio molecular',	'gás hidrogênio',	'[]',
	'H 0 45 0|H 180 45 0',
	'H -0.5 0 0|H 0.5 0 0$1 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'Cl<2>',			'ClCl',					'cloro molecular',		'gás cloro',		'[]',
	'Cl 0 70 0|Cl 180 70 0',
	'Cl -0.5 0 0|Cl 0.5 0 0$1 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'Br<2>',			'BrBr',					'bromo molecular',		'dibromo',			'[]',
	'Br 0 75 0|Br 180 75 0',
	'Br -0.5 0 0|Br 0.5 0 0$1 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'I<2>',				'II',					'iodo molecular',		'diiodo',			'[]',
	'I 0 106 0|I 180 106 0',
	'I -0.5 0 0|I 0.5 0 0$1 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'O<2>',				'OO',					'oxigênio molecular',	'gás oxigênio',		'[]',
	'O 0 40 0|O 180 40 0',
	'O -0.5 0 0|O 0.5 0 0$2 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'S<2>',				'SS',					'enxofre molecular',	'gás enxofre',		'[]',
	'S 0 40 0|S 180 40 0',
	'S -0.5 0 0|S 0.5 0 0$2 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'N<2>',				'NN',					'nitrogênio moleculas',	'gás nitrogênio',	'[]',
	'N 0 45 0|N 180 45 0',
	'N -0.5 0 0|N 0.5 0 0$3 s',
	'["monoatômico","alotrópica"]'
),

('inorgânico',	'P<4>',				'PPPP',					'tetrafósforo',		'fósforo branco',	'[]',
	'P 0 200 100|P 120 200 100|P 240 200 100|P 0 0 -100',
	'P -0.5 0 0 1 2|P 0.5 0 0 3 4|P 0 -0.5 2 3 5|P 0 0.5 1 4 5$1 s|1 s|1 s|1 s|1 s|1 s',
	'["monoatômico","alotrópica"]'
),
--

--< ÁCIDOS >
('inorgânico',	'HClO<4>',			'ClHOOOO',				'ácido clorídrico',		'ácido clorídrico', 'Cl 0 0 0|O 0 0 -110|H 20 50 -180|O 0 103.06 65|O 120 103.06 65|O 240 103.06 65', 'H -0.5 0 0|Cl 0.5 0 0$1 s', '[]', '[]'),
('inorgânico',	'H<2>SO<4>',		'HHOOOOS',				'ácido sulfúrico',		'ácido sulfúrico', 'S 0 0 0|O 0 0 -110|O 0 103.06 65|H 20 174 65|O 120 103.06 65|O 240 103.06 65|H 260 174 65|', 'S 0 0 0 1 2 3|O 0 -1 0 4|O 0.98 0.17 1 5|O -0.34 0.93 2|O -0.93 0.34 3|H -1.4 -0.7 4|H 0.48 1.04 5$1 s|1 s|2 s|2 s|1 s|1 s', '[]', '[]'),
('inorgânico',	'H<3>PO<4>',		'HHHOOOOP',				'ácido fosfórico',		'ácido fosfórico', 'P 0 0 0|O 0 0 -130|O 0 109.9 65|H 20 180 65|O 120 109.9 65|H 140 180 65|O 240 109.9 75|H 260 180 65', '', '[]', '[]'),
--

--< BASES >





('orgânico',		'C<6>H<6>',			'CCCCCCHHHHHH',			'benzeno',				'benzeno',		'[]',
	'C 0 0 0|C 0 120.37 69.5|C 180 120.37 69.5|C 0 120.37 208.5|C 180 120.37 208.5|C 0 0 278|H 0 0 -139|H 0 240.74 0|H 180 240.74 0|H 0 240.74 278|H 180 240.74 278|H 0 0 417',
	'', 
	'[]'),

('orgânico',		'C<2>F<4>',			'CCFFFF',				'tetrafluoretileno',	'teflon',			'[]','C 0 38.5 0|C 180 38.5 0|F 0 120.37 69.5|F 180 120.37 69.5|F 180 120.37 -69.5|F 0 120.37 -69.5', 'C -0.5 0 0 1 2|C 0.5 0 0 0 3 4|F -1 -0.86 1|F -1 0.86 2|F 1 -0.86 3|F 1 0.86 4$2 s|1 s|1 s|1 s|1 s', '[]'),

('inorgânico',	'NaHCO<3>',			'CHNaOOO',				'bicarbonato de sódio', 'bicarbonato de sódio', '[]','C 0 0 0|O 0 0 -120|O 0 123 71.5|O 180 123 71.5|H 180 206.13 -48|Na 0 266 -206.13', '', '[]'),

('orgânico',		'C<4>H<8>Cl<2>S',	'CCCCClClHHHHHHHHS',	'bis-2-clorotioéter',	'gás mostarda', 		'[]','S 0 0 0|C 0 125.57 72.49|H 30 135.57 100.80|H 330 135.57 100.80|C 180 125.57 72.49|H 210 135.57 100.80|H 150 135.57 100.80|C 0 220.32 -22.26|H 20 240.32 -52.26|H 340 240.32 -52.26|C 180 220.32 -22.26|H 160 240.32 -52.26|H 200 240.32 -52.26|Cl 0 341.56 47.73|Cl 180 341.56 47.73', 'S 0 0 0 1|C 0.86 0.49 0 2 3 4|H 1.36 1.36 3|H 0.36 1.36 4|C 1.72 -0.01 2 5 6 7|H 2.22 -0.88 6|H 1.21 -0.88 7|Cl 2.58 0.49 5|C -0.86 0.49 1 8 9 10|H -1.36 1.36 9|H -0.36 1.36 10|C -1.72 -0.01 8 11 12 13|H -2.22 -0.88 11|H -1.21 -0.88 12|Cl -2.58 0.49 13$1 s|1 s|1 s|1 f|1 t|1 s|1 s|1 s|1 s|1 s|1 s|1 s|1 s|1 s', '[]'),

('inorgânico',	'Cl<2>S',			'ClClS',				'sulfeto de cloro',		'sulfeto de dicloro', '[]','S 0 0 0|Cl 0 75.26 79.05|Cl 180 75.26 79.05', 'S 0 0 0 1|Cl 0.79 0.61 1|Cl -0.79 0.61 0$1 s|1 s','[]'),

('orgânico',	'CH<4>',			'CHHHH',				'metano',				'metano', '[]','C 0 0 0|H 0 0 -109|H 0 103.06 33.68|H 120 103.06 33.68|H 240 103.06 33.68', 'C 0 0 0 1 2 3|H 1 0 0|H 0 1 1|H -1 0 2|H 0 -1 3$1 s|1 s|1 s|1 s', '[]'),

('orgânico',		'C<2>H<4>',			'CCHHHH',				'eteno',				'eteno', '[]',
'C 0 38.5 0|C 180 38.5 0|H 0 120.37 69.5|H 180 120.37 69.5|H 180 120.37 -69.5|H 0 120.37 -69.5',
'C -0.5 0 0 1 2|C 0.5 0 0 0 3 4|H -1 -0.86 1|H -1 0.86 2|H 1 -0.86 3|H 1 0.86 4$2 s|1 s|1 s|1 s|1 s', '[]'),



--- AUTO

('inorgânico','LiF','FLi','fluoreto de lítio','fluoreto de lítio','[]',
        'Li 0 114.50 0|F 180 114.50 0',
        'Li -0.5 0|F 0.5 0',
        '["sal"]'
),
('inorgânico','LiCl','ClLi','cloreto de lítio','cloreto de lítio','[]',
        'Li 0 133.00 0|Cl 180 133.00 0',
        'Li -0.5 0|Cl 0.5 0',
        '["sal"]'
),
('inorgânico','LiBr','BrLi','brometo de lítio','brometo de lítio','[]',
        'Li 0 140.50 0|Br 180 140.50 0',
        'Li -0.5 0|Br 0.5 0',
        '["sal"]'
),
('inorgânico','LiI','ILi','iodeto de lítio','iodeto de lítio','[]',
        'Li 0 151.00 0|I 180 151.00 0',
        'Li -0.5 0|I 0.5 0',
        '["sal"]'
),
('inorgânico','LiOH','HLiO','hidróxido de lítio (I)','hidróxido de lítio','[]',
        'O 0 0 0|H 0 61.26 79.05|Li 180 200.66 140.38',
        'Li -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','NaF','FNa','fluoreto de sódio','fluoreto de sódio','[]',
        'Na 0 126.00 0|F 180 126.00 0',
        'Na -0.5 0|F 0.5 0',
        '["sal"]'
),
('inorgânico','NaCl','ClNa','cloreto de sódio','cloreto de sódio','[]',
        'Na 0 144.50 0|Cl 180 144.50 0',
        'Na -0.5 0|Cl 0.5 0',
        '["sal"]'
),
('inorgânico','NaBr','BrNa','brometo de sódio','brometo de sódio','[]',
        'Na 0 152.00 0|Br 180 152.00 0',
        'Na -0.5 0|Br 0.5 0',
        '["sal"]'
),
('inorgânico','NaI','INa','iodeto de sódio','iodeto de sódio','[]',
        'Na 0 162.50 0|I 180 162.50 0',
        'Na -0.5 0|I 0.5 0',
        '["sal"]'
),
('inorgânico','NaOH','HNaO','hidróxido de sódio (I)','hidróxido de sódio','[]',
        'O 0 0 0|H 0 61.26 79.05|Na 180 219.49 153.56',
        'Na -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','KF','FK','fluoreto de potássio','fluoreto de potássio','[]',
        'K 0 152.50 0|F 180 152.50 0',
        'K -0.5 0|F 0.5 0',
        '["sal"]'
),
('inorgânico','KCl','ClK','cloreto de potássio','cloreto de potássio','[]',
        'K 0 171.00 0|Cl 180 171.00 0',
        'K -0.5 0|Cl 0.5 0',
        '["sal"]'
),
('inorgânico','KBr','BrK','brometo de potássio','brometo de potássio','[]',
        'K 0 178.50 0|Br 180 178.50 0',
        'K -0.5 0|Br 0.5 0',
        '["sal"]'
),
('inorgânico','KI','IK','iodeto de potássio','iodeto de potássio','[]',
        'K 0 189.00 0|I 180 189.00 0',
        'K -0.5 0|I 0.5 0',
        '["sal"]'
),
('inorgânico','KOH','HKO','hidróxido de potássio (I)','hidróxido de potássio','[]',
        'O 0 0 0|H 0 61.26 79.05|K 180 262.90 183.93',
        'K -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','RbF','FRb','fluoreto de rubídio','fluoreto de rubídio','[]',
        'Rb 0 163.50 0|F 180 163.50 0',
        'Rb -0.5 0|F 0.5 0',
        '["sal"]'
),
('inorgânico','RbCl','ClRb','cloreto de rubídio','cloreto de rubídio','[]',
        'Rb 0 182.00 0|Cl 180 182.00 0',
        'Rb -0.5 0|Cl 0.5 0',
        '["sal"]'
),
('inorgânico','RbBr','BrRb','brometo de rubídio','brometo de rubídio','[]',
        'Rb 0 189.50 0|Br 180 189.50 0',
        'Rb -0.5 0|Br 0.5 0',
        '["sal"]'
),
('inorgânico','RbI','IRb','iodeto de rubídio','iodeto de rubídio','[]',
        'Rb 0 200.00 0|I 180 200.00 0',
        'Rb -0.5 0|I 0.5 0',
        '["sal"]'
),
('inorgânico','RbOH','HORb','hidróxido de rubídio (I)','hidróxido de rubídio','[]',
        'O 0 0 0|H 0 61.26 79.05|Rb 180 280.92 196.54',
        'Rb -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','CsF','CsF','fluoreto de césio','fluoreto de césio','[]',
        'Cs 0 180.00 0|F 180 180.00 0',
        'Cs -0.5 0|F 0.5 0',
        '["sal"]'
),
('inorgânico','CsCl','ClCs','cloreto de césio','cloreto de césio','[]',
        'Cs 0 198.50 0|Cl 180 198.50 0',
        'Cs -0.5 0|Cl 0.5 0',
        '["sal"]'
),
('inorgânico','CsBr','BrCs','brometo de césio','brometo de césio','[]',
        'Cs 0 206.00 0|Br 180 206.00 0',
        'Cs -0.5 0|Br 0.5 0',
        '["sal"]'
),
('inorgânico','CsI','CsI','iodeto de césio','iodeto de césio','[]',
        'Cs 0 216.50 0|I 180 216.50 0',
        'Cs -0.5 0|I 0.5 0',
        '["sal"]'
),
('inorgânico','CsOH','CsHO','hidróxido de césio (I)','hidróxido de césio','[]',
        'O 0 0 0|H 0 61.26 79.05|Cs 180 307.94 215.45',
        'Cs -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','FrF','FFr','fluoreto de frâncio','fluoreto de frâncio','[]',
        'Fr 0 166.00 0|F 180 166.00 0',
        'Fr -0.5 0|F 0.5 0',
        '["sal"]'
),
('inorgânico','FrCl','ClFr','cloreto de frâncio','cloreto de frâncio','[]',
        'Fr 0 184.50 0|Cl 180 184.50 0',
        'Fr -0.5 0|Cl 0.5 0',
        '["sal"]'
),
('inorgânico','FrBr','BrFr','brometo de frâncio','brometo de frâncio','[]',
        'Fr 0 192.00 0|Br 180 192.00 0',
        'Fr -0.5 0|Br 0.5 0',
        '["sal"]'
),
('inorgânico','FrI','FrI','iodeto de frâncio','iodeto de frâncio','[]',
        'Fr 0 202.50 0|I 180 202.50 0',
        'Fr -0.5 0|I 0.5 0',
        '["sal"]'
),
('inorgânico','FrOH','FrHO','hidróxido de frâncio (I)','hidróxido de frâncio','[]',
        'O 0 0 0|H 0 61.26 79.05|Fr 180 285.01 199.40',
        'Fr -0.819 0.573|O 0 0 0|H 0.79 0.61 0$1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','BeF<2>','BeFF','fluoreto de berílio','fluoreto de berílio','[]',
        'F 0 174.00 0|Be 0 0 0|F 180 174.00 0',
        'F -1 0|Be 0 0|F 1 0',
        '["sal"]'
),
('inorgânico','BeCl<2>','BeClCl','cloreto de berílio','cloreto de berílio','[]',
        'Cl 0 211.00 0|Be 0 0 0|Cl 180 211.00 0',
        'Cl -1 0|Be 0 0|Cl 1 0',
        '["sal"]'
),
('inorgânico','BeBr<2>','BeBrBr','brometo de berílio','brometo de berílio','[]',
        'Br 0 226.00 0|Be 0 0 0|Br 180 226.00 0',
        'Br -1 0|Be 0 0|Br 1 0',
        '["sal"]'
),
('inorgânico','BeI<2>','BeII','iodeto de berílio','iodeto de berílio','[]',
        'I 0 247.00 0|Be 0 0 0|I 180 247.00 0',
        'I -1 0|Be 0 0|I 1 0',
        '["sal"]'
),
('inorgânico','BeO','BeO','monóxido de berílio','monóxido de berílio','[]',
        'O 0 90.00 0|Be 180 90.00 0',
        'Be -0.5 0 0|O 0.5 0 0$2 s',
        '["óxido"]'
),
('inorgânico','Be(OH)²','BeHHOO','hidróxido de berílio (II)','hidróxido de berílio','[]',
        'Be 0 0 0|O 0 155.88 90.00|H 0 206.38 2.53|O 180 155.88 90.00|H 180 206.38 2.53',
        'Be 0 0|O 0.79 0.61 0|H 1.58 0 0|O -0.79 0.61 1|H -1.58 0 1$1 s|1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','MgF<2>','FFMg','fluoreto de magnésio','fluoreto de magnésio','[]',
        'F 0 207.00 0|Mg 0 0 0|F 180 207.00 0',
        'F -1 0|Mg 0 0|F 1 0',
        '["sal"]'
),
('inorgânico','MgCl<2>','ClClMg','cloreto de magnésio','cloreto de magnésio','[]',
        'Cl 0 244.00 0|Mg 0 0 0|Cl 180 244.00 0',
        'Cl -1 0|Mg 0 0|Cl 1 0',
        '["sal"]'
),
('inorgânico','MgBr<2>','BrBrMg','brometo de magnésio','brometo de magnésio','[]',
        'Br 0 259.00 0|Mg 0 0 0|Br 180 259.00 0',
        'Br -1 0|Mg 0 0|Br 1 0',
        '["sal"]'
),
('inorgânico','MgI<2>','IIMg','iodeto de magnésio','iodeto de magnésio','[]',
        'I 0 280.00 0|Mg 0 0 0|I 180 280.00 0',
        'I -1 0|Mg 0 0|I 1 0',
        '["sal"]'
),
('inorgânico','MgO','MgO','monóxido de magnésio','monóxido de magnésio','[]',
        'O 0 106.50 0|Mg 180 106.50 0',
        'Mg -0.5 0 0|O 0.5 0 0$2 s',
        '["óxido"]'
),
('inorgânico','Mg(OH)²','HHMgOO','hidróxido de magnésio (II)','hidróxido de magnésio','[]',
        'Mg 0 0 0|O 0 184.46 106.50|H 0 234.96 19.03|O 180 184.46 106.50|H 180 234.96 19.03',
        'Mg 0 0|O 0.79 0.61 0|H 1.58 0 0|O -0.79 0.61 1|H -1.58 0 1$1 s|1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','CaF<2>','CaFF','fluoreto de cálcio','fluoreto de cálcio','[]',
        'F 0 256.00 0|Ca 0 0 0|F 180 256.00 0',
        'F -1 0|Ca 0 0|F 1 0',
        '["sal"]'
),
('inorgânico','CaCl<2>','CaClCl','cloreto de cálcio','cloreto de cálcio','[]',
        'Cl 0 293.00 0|Ca 0 0 0|Cl 180 293.00 0',
        'Cl -1 0|Ca 0 0|Cl 1 0',
        '["sal"]'
),
('inorgânico','CaBr<2>','BrBrCa','brometo de cálcio','brometo de cálcio','[]',
        'Br 0 308.00 0|Ca 0 0 0|Br 180 308.00 0',
        'Br -1 0|Ca 0 0|Br 1 0',
        '["sal"]'
),
('inorgânico','CaI<2>','CaII','iodeto de cálcio','iodeto de cálcio','[]',
        'I 0 329.00 0|Ca 0 0 0|I 180 329.00 0',
        'I -1 0|Ca 0 0|I 1 0',
        '["sal"]'
),
('inorgânico','CaO','CaO','monóxido de cálcio','monóxido de cálcio','[]',
        'O 0 131.00 0|Ca 180 131.00 0',
        'Ca -0.5 0 0|O 0.5 0 0$2 s',
        '["óxido"]'
),
('inorgânico','Ca(OH)²','CaHHOO','hidróxido de cálcio (II)','hidróxido de cálcio','[]',
        'Ca 0 0 0|O 0 226.90 131.00|H 0 277.40 43.53|O 180 226.90 131.00|H 180 277.40 43.53',
        'Ca 0 0|O 0.79 0.61 0|H 1.58 0 0|O -0.79 0.61 1|H -1.58 0 1$1 s|1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','SrF<2>','FFSr','fluoreto de estrôncio','fluoreto de estrôncio','[]',
        'F 0 281.00 0|Sr 0 0 0|F 180 281.00 0',
        'F -1 0|Sr 0 0|F 1 0',
        '["sal"]'
),
('inorgânico','SrCl<2>','ClClSr','cloreto de estrôncio','cloreto de estrôncio','[]',
        'Cl 0 318.00 0|Sr 0 0 0|Cl 180 318.00 0',
        'Cl -1 0|Sr 0 0|Cl 1 0',
        '["sal"]'
),
('inorgânico','SrBr<2>','BrBrSr','brometo de estrôncio','brometo de estrôncio','[]',
        'Br 0 333.00 0|Sr 0 0 0|Br 180 333.00 0',
        'Br -1 0|Sr 0 0|Br 1 0',
        '["sal"]'
),
('inorgânico','SrI<2>','IISr','iodeto de estrôncio','iodeto de estrôncio','[]',
        'I 0 354.00 0|Sr 0 0 0|I 180 354.00 0',
        'I -1 0|Sr 0 0|I 1 0',
        '["sal"]'
),
('inorgânico','SrO','OSr','monóxido de estrôncio','monóxido de estrôncio','[]',
        'O 0 143.50 0|Sr 180 143.50 0',
        'Sr -0.5 0 0|O 0.5 0 0$2 s',
        '["óxido"]'
),
('inorgânico','Sr(OH)²','HHOOSr','hidróxido de estrôncio (II)','hidróxido de estrôncio','[]',
        'Sr 0 0 0|O 0 248.55 143.50|H 0 299.05 56.03|O 180 248.55 143.50|H 180 299.05 56.03',
        'Sr 0 0|O 0.79 0.61 0|H 1.58 0 0|O -0.79 0.61 1|H -1.58 0 1$1 s|1 s',
        '["base","base de arrhenius","hidróxido"]'
),
('inorgânico','BaF<2>','BaFF','fluoreto de bário','fluoreto de bário','[]',
        'F 0 315.00 0|Ba 0 0 0|F 180 315.00 0',
        'F -1 0|Ba 0 0|F 1 0',
        '["sal"]'
),
('inorgânico','BaCl<2>','BaClCl','cloreto de bário','cloreto de bário','[]',
        'Cl 0 352.00 0|Ba 0 0 0|Cl 180 352.00 0',
        'Cl -1 0|Ba 0 0|Cl 1 0',
        '["sal"]'
),
('inorgânico','BaBr<2>','BaBrBr','brometo de bário','brometo de bário','[]',
        'Br 0 367.00 0|Ba 0 0 0|Br 180 367.00 0',
        'Br -1 0|Ba 0 0|Br 1 0',
        '["sal"]'
),
('inorgânico','BaI<2>','BaII','iodeto de bário','iodeto de bário','[]',
        'I 0 388.00 0|Ba 0 0 0|I 180 388.00 0',
        'I -1 0|Ba 0 0|I 1 0',
        '["sal"]'
),
('inorgânico','BaO','BaO','monóxido de bário','monóxido de bário','[]',
        'O 0 160.50 0|Ba 180 160.50 0',
        'Ba -0.5 0 0|O 0.5 0 0$2 s',
        '["óxido"]'
),
('inorgânico','Ba(OH)²','BaHHOO','hidróxido de bário (II)','hidróxido de bário','[]',
        'Ba 0 0 0|O 0 277.99 160.50|H 0 328.49 73.03|O 180 277.99 160.50|H 180 328.49 73.03',
        'Ba 0 0|O 0.79 0.61 0|H 1.58 0 0|O -0.79 0.61 1|H -1.58 0 1$1 s|1 s',
        '["base","base de arrhenius","hidróxido"]'
)