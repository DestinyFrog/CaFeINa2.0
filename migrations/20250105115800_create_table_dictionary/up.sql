CREATE TABLE dictionary (
	`_id` INTEGER PRIMARY KEY,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`description` TEXT,
	`terms` JSON
);

INSERT INTO dictionary (`description`, `terms`)
VALUES
('Uma categoria que engloba os elementos da 1° coluna da tabela periódica (exceto o hidrogênio). Todos tem apenas 1 elétron na sua camada de valência. São "metais" pois tem tendência de doar elétrons e "alcalinos" pois facilmente reagem com hidroxila para gerar bases fortes.', '["metais alcalinos","metal alcalino"]'),
('Uma categoria que engloba os elementos da 2° coluna da tabela periódica. Todos tem apenas 2 elétrons na sua camada de valência. São "metais" pois tem tendência de doar seus elétrons, "alcalinos" pois reagem com hidroxila para gerar bases e "terrosos" pois antigamente os óxidos desses metais eram chamados de "terras" pois eram presentes na litosfera', '["metais alcalinos terrosos","metal alacalino terroso"]'),
('Uma categoria que engloba os elementos da última coluna da tabla periódica. ','')