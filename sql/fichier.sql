--pour modifier la base de donnnees 
-- mofier la taille de mot de passe on veut un 255 car
CREATE TABLE banque (
	banque_ID VARCHAR (10) PRIMARY KEY NOT NULL,
	adress VARCHAR (30) NOT NULL,
	ville VARCHAR (20) NOT NULL
);
CREATE TABLE conseiller (
	conseiller_ID VARCHAR (10) PRIMARY KEY NOT NULL,
	nom VARCHAR (50) NOT NULL,
	prenom VARCHAR (25) NOT NULL, 
	telephone VARCHAR  (10) NOT NULL,
	login VARCHAR (10) NOT NULL, 
	password  VARCHAR (255) NOT NULL,
	banque_ID VARCHAR(10) NOT NULL REFERENCES banque (banque_ID)
);

CREATE TABLE utilisateur (
	user_id INTEGER  PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),

	nom VARCHAR (50) NOT NULL,
	  prenom VARCHAR (50) NOT NULL, 
	  adresse VARCHAR(60) NOT NULL,
		ville VARCHAR (30) NOT NULL,
	codePostal VARCHAR (5) NOT NULL,
	  login VARCHAR(10) NOT NULL, 
	  password VARCHAR(255) NOT NULL, 
	  banque_ID VARCHAR(10) NOT NULL REFERENCES banque (banque_ID));


CREATE TABLE compte (account_ID VARCHAR(10) NOT NULL PRIMARY KEY,
					 solde FLOAT NOT NULL , 
					 iban VARCHAR (20) NOT NULL,
					user_ID  INT   NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) REFERENCES utilisateur1 (user_ID),
					banque_ID VARCHAR(10) NOT NULL REFERENCES banque (banque_ID)
					);
CREATE TABLE carte (
	carte_ID VARCHAR(10) NOT NULL PRIMARY KEY,
	
	date_delivrance DATE , 
	date_peremption DATE, 
	account_ID VARCHAR(10) NOT NULL REFERENCES  compte (account_ID));

CREATE TABLE capacite (
	plafond_ID VARCHAR(10) NOT NULL PRIMARY KEY,
	max INT NOT NULL,
	utilise INT NOT NULL,
	carte_ID VARCHAR(10) NOT NULL REFERENCES  carte(carte_ID));

CREATE TABLE historique (
	historique_ID VARCHAR(10) NOT NULL PRIMARY KEY,
	mois DATE NOT NULL ,
	account_ID VARCHAR(10) NOT NULL REFERENCES compte (account_ID));


CREATE TABLE evenement (
	event_ID VARCHAR(10) NOT NULL PRIMARY KEY,
	type VARCHAR(10) NOT NULL,
	quantite INT NOT NULL,
	date_transaction DATE, 
	lieu VARCHAR(30), 
	historique_ID VARCHAR(10) NOT NULL REFERENCES historique(historique_ID));

INSERT INTO banque (banque_id, adress, ville) VALUES ('001', '10 avenue du Roi ', '95300');
INSERT INTO banque (banque_id, adress, ville) VALUES ('002', '03 rue de la Fleur', '91230');
INSERT INTO banque (banque_id, adress, ville) VALUES ('003', '67 rue de la Rose ', '95100');
INSERT INTO banque (banque_id, adress, ville) VALUES ('004', '10 avenue du Parisiens ', '75016');
INSERT INTO banque (banque_id, adress, ville) VALUES ('005', '05 avenue Fosh ', '75001');


INSERT INTO conseiller (conseiller_id, nom, prenom,telephone,login,password, banque_id) VALUES ('002','Laurent', 'jack', '0615042148','1234','$2y$10$U9MMfkHXiP6yo8al0fAoremqTCivvy7cCSl74pXV4V2LEkbv1Tmwm','001');
INSERT INTO conseiller (conseiller_id, nom, prenom,telephone,login,password, banque_id) VALUES ('003','LEGRAND', 'Toma', '0615042148','2345','$2y$10$ZtoTHhIlP2CcQNFmiV/cKuP053bz1U53il1yBz5IAjLV.q7N53vPu','002');
INSERT INTO conseiller (conseiller_id, nom, prenom,telephone,login,password, banque_id) VALUES ('004','Kami', 'Sara', '0615042148','3456','$2y$10$RT6VZ.hxrd2AgKKWBtkVb.qeDJ6eXyq6PQFWhFEQ13taqNUesLqGu','002');
INSERT INTO conseiller (conseiller_id, nom, prenom,telephone,login,password, banque_id) VALUES ('005','EMi', 'Elisa', '0615042148','4567','$2y$10$ALIyJCo4MY8ypagLDxIZ1eo8EBC8HzZ819wdXcdfpH0oc3AZFMEzC','003');

INSERT INTO utilisateur (nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('1','BELKESSA', 'Ahcene', '10 avenue Foch','Pontoise','95300', '1234','$2y$10$E4SOyEcRbBLBRfcrWGaeluYysht6riD5l0oSn5Y9yRZSNxMLNWI0W','001');
INSERT INTO utilisateur (nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('2','Lena', 'Irika', '03 rue de la gloire','Paris','75014', '2345','$2y$10$XafhzNJ2nYRs6Q0CHyRi8.yLMThQ0gE81rt/v26ZbxGsuC4YN5EV.','001');
INSERT INTO utilisateur (nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('3','Carotte', 'Katrine', '12 rue le cheval','Paris','75012', '3456','$2y$10$esMm0FNvA4lympRnQVbo2.wAbonnez6h78PkozznI1L8Re/785pW.','002');
INSERT INTO utilisateur (nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('4','Banane', 'Amilie', '12 rue le cheval','Paris','75012', '5678','$2y$10$hQI008CU1Z.ME2QUQ3U7DeJOezXHmHBDpwsx2/SUCTYgF.ithNN66','003');
INSERT INTO utilisateur (nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('5','Tomatte', 'Luise', '12 rue lamerie','Pontoise','95300', '6789','$2y$10$X/RmGptgl1bf76nKp9F5jeeuk45a1v46119iq5jTq3RhtCWG9eA6q','003');

--
--INSERT INTO utilisateur (user_id,nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('1','BELKESSA', 'Ahcene', '10 avenue Foch','Pontoise','95300', '1234','$2y$10$E4SOyEcRbBLBRfcrWGaeluYysht6riD5l0oSn5Y9yRZSNxMLNWI0W','001');
--INSERT INTO utilisateur ( user_id,nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('2','Lena', 'Irika', '03 rue de la gloire','Paris','75014', '2345','$2y$10$XafhzNJ2nYRs6Q0CHyRi8.yLMThQ0gE81rt/v26ZbxGsuC4YN5EV.','001');
--INSERT INTO utilisateur (user_id,nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('3','Carotte', 'Katrine', '12 rue le cheval','Paris','75012', '3456','$2y$10$esMm0FNvA4lympRnQVbo2.wAbonnez6h78PkozznI1L8Re/785pW.','002');
--INSERT INTO utilisateur (user_id,nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('4','Banane', 'Amilie', '12 rue le cheval','Paris','75012', '5678','$2y$10$hQI008CU1Z.ME2QUQ3U7DeJOezXHmHBDpwsx2/SUCTYgF.ithNN66','003');
--INSERT INTO utilisateur (user_id,nom, prenom, adresse, ville, codePostal, login, password, banque_id) VALUES ('5','Tomatte', 'Luise', '12 rue lamerie','Pontoise','95300', '6789','$2y$10$X/RmGptgl1bf76nKp9F5jeeuk45a1v46119iq5jTq3RhtCWG9eA6q','003');

INSERT INTO compte (account_id, solde, iban,user_id, banque_id) VALUES ('001', 1230.65,'FR001',1,'001' );
INSERT INTO compte (account_id, solde, iban,user_id, banque_id) VALUES ('002', 1230.65,'FR002',2,'001' );
INSERT INTO compte (account_id, solde, iban,user_id, banque_id) VALUES ('005', 6400.65,'FR003',3,'002' );
INSERT INTO compte (account_id, solde, iban,user_id, banque_id) VALUES ('004', 44.65,'FR004',4,'003' );
INSERT INTO compte (account_id, solde, iban,user_id, banque_id) VALUES ('003', 1230.65,'FR001',5,'001' );
INSERT INTO compte (account_id, solde, iban,user_id, banque_id) VALUES ('006', 130.05,'FR004',6,'004');

--INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('1111111111', '23/11/2019','23/11/2024', '001');
--INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('2222222222', '11/08/2019','11/08/2024', '002');
--INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('3333333333', '09/04/2019','09/04/2024', '003');
--INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('5555555555', '02/01/2019','02/01/2024', '005');
--INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('6666666666', '30/06/2019','30/06/2024', '006');
INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('4444444444', '11/26/2019','11/26/2024', '001');
INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('1111111111', '11/26/2019','11/26/2024', '001');
INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('2222222222', '10/13/2019','10/13/2024', '002');
INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('3333333333', '09/23/2019','09/23/2024', '003');
INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('5555555555', '07/31/2019','07/31/2024', '005');
INSERT INTO  carte (carte_id, date_delivrance, date_peremption, account_id) VALUES ('6666666666', '03/03/2019','03/03/2024', '006');

INSERT INTO  capacite (plafond_id, max, utilise, carte_id) VALUES ('003',800,0, '3333333333');
INSERT INTO  capacite (plafond_id, max, utilise, carte_id) VALUES ('002',300,0, '2222222222');
INSERT INTO  capacite (plafond_id, max, utilise, carte_id) VALUES ('001',700,0, '1111111111');
INSERT INTO  capacite (plafond_id, max, utilise, carte_id) VALUES ('005',800,0, '5555555555');
INSERT INTO  capacite (plafond_id, max, utilise, carte_id) VALUES ('006',900,0, '4444444444');
INSERT INTO  capacite (plafond_id, max, utilise, carte_id) VALUES ('006',900,0, '4444444444');

INSERT INTO  historique (historique_id, mois, account_id) VALUES ('001','01/01/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('002','01/02/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('005','01/03/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('003','01/04/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('004','01/05/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('006','01/06/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('007','01/07/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('008','01/08/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('009','01/09/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('010','01/10/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('011','01/11/2019','001');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('012','01/12/2019','001');

INSERT INTO  historique (historique_id, mois, account_id) VALUES ('013','01/01/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('014','01/02/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('015','01/03/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('016','01/04/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('017','01/05/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('018','01/06/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('019','01/07/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('020','01/08/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('021','01/09/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('022','01/10/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('023','01/11/2019','002');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('024','01/12/2019','002');


INSERT INTO  historique (historique_id, mois, account_id) VALUES ('025','01/01/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('026','01/02/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('027','01/03/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('028','01/04/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('029','01/05/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('030','01/06/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('031','01/07/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('032','01/08/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('033','01/09/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('034','01/10/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('035','01/11/2019','003');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('036','01/12/2019','003');


INSERT INTO  historique (historique_id, mois, account_id) VALUES ('049','01/01/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('048','01/02/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('046','01/03/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('045','01/04/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('044','01/05/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('043','01/06/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('042','01/07/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('041','01/08/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('040','01/09/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('039','01/10/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('038','01/11/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('037','01/12/2019','004');


INSERT INTO  historique (historique_id, mois, account_id) VALUES ('050','01/01/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('051','01/02/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('052','01/03/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('053','01/04/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('054','01/05/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('055','01/06/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('056','01/07/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('057','01/08/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('058','01/09/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('059','01/10/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('060','01/11/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('061','01/12/2019','005');



INSERT INTO  historique (historique_id, mois, account_id) VALUES ('073','01/01/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('072','01/02/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('071','01/03/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('070','01/04/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('069','01/05/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('068','01/06/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('067','01/07/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('066','01/08/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('065','01/09/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('064','01/10/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('063','01/11/2019','006');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('062','01/12/2019','006');








INSERT INTO  historique (historique_id, mois, account_id) VALUES ('049','01/01/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('048','01/02/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('046','01/03/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('045','01/04/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('044','01/05/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('043','01/06/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('042','01/07/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('041','01/08/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('040','01/09/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('039','01/10/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('038','01/11/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('037','01/12/2019','004');


INSERT INTO  historique (historique_id, mois, account_id) VALUES ('050','01/01/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('051','01/02/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('052','01/03/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('053','01/04/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('054','01/05/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('055','01/06/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('056','01/07/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('057','01/08/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('058','01/09/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('059','01/10/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('060','01/11/2019','005');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('061','01/12/2019','005');




INSERT INTO  historique (historique_id, mois, account_id) VALUES ('041','01/08/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('040','01/09/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('039','01/10/2019','004');
INSERT INTO  historique (historique_id, mois, account_id) VALUES ('038','01/11/2019','004');



INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('203', 'virement',2000, '01/11/2019', 'Auchan Cergy', '038' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('204', 'prélèv',-224, '14/11/2019', 'Auchan Cergy', '038' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('205', 'prélèv',-215, '13/11/2019', 'Auchan Cergy', '038' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('206', 'prélèv',-50, '12/12/2019', 'LCL', '039' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('207', 'prélèv',-70, '19/12/2019', 'LCL', '039' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('208', 'prélèv',-60, '19/12/2019', 'LCL', '039' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('209', 'prélèv',-510, '19/01/2019', 'LCL', '040' );
	INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('210', 'prélèv',-21, '19/01/2019', 'LCL', '040' );
	INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('211', 'prélèv',-112, '19/01/2019', 'LCL', '040' );

	INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('212', 'prélèv',-10, '19/02/2019', 'LCL', '041' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('213', 'prélèv',-60, '19/02/2019', 'LCL', '041' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('214', 'prélèv',-10, '19/02/2019', 'LCL', '041' );



INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('215', 'virement',1040, '01/03/2019', 'Auchan Cergy', '042' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('216', 'prélèv',-410, '15/03/2019', 'Loyer', '042' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, histo rique_id)
	VALUES ('217', 'prélèv',-253, '28/03/2019', 'Auchan Cergy', '042' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('218', 'prélèv',-230, '12/04/2019', 'LCL', '043' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('219', 'prélèv',-110, '19/04/2019', 'LCL', '043' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('220', 'prélèv',-860, '17/04/2019', 'LCL', '043' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('221', 'prélèv',-150, '20/05/2019', 'LCL', '044' );




INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('222', 'virement',1000, '01/05/2019', 'Auchan Cergy', '044' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('223', 'prélèv',-241, '14/05/2019', 'Auchan Cergy', '044' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('224', 'prélèv',-251, '13/05/2019', 'Auchan Cergy', '044' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('225', 'prélèv',-10, '12/06/2019', 'LCL', '045' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('226', 'prélèv',-70, '19/06/2019', 'LCL', '045' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('227', 'prélèv',-60, '19/06/2019', 'LCL', '045' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('228', 'prélèv',-50, '19/06/2019', 'LCL', '046' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('229', 'virement',1040, '01/06/2019', 'Auchan Cergy', '046' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('230', 'prélèv',-401, '15/06/2019', 'Loyer', '046' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('231', 'prélèv',-25, '28/06/2019', 'Auchan Cergy', '046' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('232', 'prélèv',-20, '12/07/2019', 'LCL', '047' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('233', 'prélèv',-70, '19/07/2019', 'LCL', '047' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('234', 'prélèv',-40, '17/07/2019', 'LCL', '047' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('235', 'prélèv',-10, '20/07/2019', 'LCL', '047' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('236', 'virement',1000, '01/08/2019', 'Auchan Cergy', '048' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('237', 'prélèv',-14, '14/08/2019', 'Auchan Cergy', '048' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('238', 'prélèv',-15, '13/08/2019', 'Auchan Cergy', '048' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('239', 'prélèv',-52, '12/09/2019', 'LCL', '049' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('240', 'prélèv',-12, '19/09/2019', 'LCL', '049' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('241', 'prélèv',-10, '19/09/2019', 'LCL', '049' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('242', 'prélèv',-51, '19/09/2019', 'LCL', '049' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('243', 'virement',1040, '01/12/2019', 'Auchan Cergy', '050' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('244', 'prélèv',-40, '15/12/2019', 'Loyer', '050' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('245', 'prélèv',-215, '28/12/2019', 'Auchan Cergy', '050' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('246', 'prélèv',-20, '12/12/2019', 'LCL', '050' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('247', 'prélèv',-10, '19/12/2019', 'LCL', '050' );





INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('248', 'prélèv',-61, '17/01/2019', 'LCL', '051' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('249', 'prélèv',-52, '20/01/2019', 'LCL', '051' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('250', 'virement',1030, '01/01/2019', 'Auchan Cergy', '051' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('251', 'prélèv',-21, '14/01/2019', 'Auchan Cergy', '051' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('252', 'prélèv',-21, '13/02/2019', 'Auchan Cergy', '052' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('253', 'prélèv',-53, '12/02/2019', 'LCL', '052' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('254', 'prélèv',-73, '19/02/2019', 'LCL', '052' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('255', 'prélèv',-64, '19/02/2019', 'LCL', '052' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('256', 'prélèv',-51, '19/03/2019', 'LCL', '053' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('257', 'virement',1040, '01/03/2019', 'Auchan Cergy', '053' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('258', 'prélèv',-400, '15/03/2019', 'Loyer', '053' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('259', 'prélèv',-25, '28/04/2019', 'Auchan Cergy', '054' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('260', 'prélèv',-230, '12/04/2019', 'LCL', '054' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('261', 'prélèv',-70, '19/04/2019', 'LCL', '054' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('262', 'prélèv',-60, '17/04/2019', 'LCL', '054' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('263', 'prélèv',-50, '20/05/2019', 'LCL', '055' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('264', 'virement',1000, '01/05/2019', 'Auchan Cergy', '055' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('265', 'prélèv',-24, '14/05/2019', 'Auchan Cergy', '055' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('266', 'prélèv',-25, '13/05/2019', 'Auchan Cergy', '055' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('267', 'prélèv',-50, '12/06/2019', 'LCL', '056' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('268', 'prélèv',-70, '19/06/2019', 'LCL', '056' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('269', 'prélèv',-60, '19/06/2019', 'LCL', '056' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('270', 'prélèv',-50, '19/06/2019', 'LCL', '056' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('271', 'virement',1040, '01/06/2019', 'Auchan Cergy', '056' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('272', 'prélèv',-400, '15/07/2019', 'Loyer', '057' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('273', 'prélèv',-25, '28/07/2019', 'Auchan Cergy', '057' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('274', 'prélèv',-230, '12/07/2019', 'LCL', '057' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('275', 'prélèv',-50, '19/07/2019', 'LCL', '057' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('276', 'prélèv',-10, '17/07/2019', 'LCL', '057' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('277', 'prélèv',-510, '20/08/2019', 'LCL', '058' );

	INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('278', 'prélèv',-50, '19/08/2019', 'LCL', '058' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('279', 'prélèv',-10, '17/09/2019', 'LCL', '059' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('280', 'prélèv',-510, '20/09/2019', 'LCL', '059' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('281', 'prélèv',-510, '20/10/2019', 'LCL', '060' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('282', 'prélèv',-510, '20/10/2019', 'LCL', '060' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('283', 'prélèv',-510, '20/10/2019', 'LCL', '060' );





























INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('074', 'virement',2000, '01/01/2019', 'Auchan Cergy', '014' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('075', 'prélèv',-24, '14/01/2019', 'Auchan Cergy', '014' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('076', 'prélèv',-25, '13/01/2019', 'Auchan Cergy', '015' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('077', 'prélèv',-50, '12/01/2019', 'LCL', '013' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('078', 'prélèv',-70, '19/01/2019', 'LCL', '013' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('079', 'prélèv',-60, '19/01/2019', 'LCL', '013' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('080', 'prélèv',-50, '19/02/2019', 'LCL', '014' );
	INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('081', 'prélèv',-70, '19/02/2019', 'LCL', '014' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('082', 'prélèv',-60, '19/02/2019', 'LCL', '014' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('083', 'prélèv',-50, '19/02/2019', 'LCL', '014' );



INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('084', 'virement',2040, '01/03/2019', 'Auchan Cergy', '015' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('085', 'prélèv',-400, '15/03/2019', 'Loyer', '015' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('086', 'prélèv',-25, '28/03/2019', 'Auchan Cergy', '015' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('087', 'prélèv',-230, '12/03/2019', 'LCL', '015' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('089', 'prélèv',-70, '19/03/2019', 'LCL', '015' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('090', 'prélèv',-60, '17/03/2019', 'LCL', '015' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('091', 'prélèv',-50, '20/03/2019', 'LCL', '015' );




INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('092', 'virement',2000, '01/04/2019', 'Auchan Cergy', '016' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('093', 'prélèv',-24, '14/04/2019', 'Auchan Cergy', '016' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('094', 'prélèv',-25, '13/04/2019', 'Auchan Cergy', '016' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('095', 'prélèv',-50, '12/04/2019', 'LCL', '016' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('096', 'prélèv',-70, '19/04/2019', 'LCL', '016' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('097', 'prélèv',-60, '19/04/2019', 'LCL', '016' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('098', 'prélèv',-50, '19/04/2019', 'LCL', '016' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('099', 'virement',1040, '01/05/2019', 'Auchan Cergy', '017' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('100', 'prélèv',-400, '15/05/2019', 'Loyer', '017' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('101', 'prélèv',-25, '28/05/2019', 'Auchan Cergy', '017' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('102', 'prélèv',-230, '12/05/2019', 'LCL', '017' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('103', 'prélèv',-70, '19/05/2019', 'LCL', '017' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('104', 'prélèv',-60, '17/05/2019', 'LCL', '017' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('105', 'prélèv',-50, '20/05/2019', 'LCL', '017' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('106', 'virement',10, '01/05/2019', 'Auchan Cergy', '017' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('108', 'prélèv',-24, '14/05/2019', 'Auchan Cergy', '017' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('109', 'prélèv',-25, '13/05/2019', 'Auchan Cergy', '017' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('110', 'prélèv',-50, '12/06/2019', 'LCL', '018' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('112', 'prélèv',-70, '19/06/2019', 'LCL', '018' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('113', 'prélèv',-60, '19/06/2019', 'LCL', '018' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('114', 'prélèv',-50, '19/06/2019', 'LCL', '018' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('115', 'virement',1040, '01/06/2019', 'Auchan Cergy', '018' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('116', 'prélèv',-400, '15/06/2019', 'Loyer', '018' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('117', 'prélèv',-25, '28/06/2019', 'Auchan Cergy', '018' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('118', 'prélèv',-230, '12/06/2019', 'LCL', '018' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('119', 'prélèv',-70, '19/06/2019', 'LCL', '018' );





INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('120', 'prélèv',-60, '17/07/2019', 'LCL', '019' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('121', 'prélèv',-50, '20/07/2019', 'LCL', '019' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('122', 'virement',1010, '01/07/2019', 'Auchan Cergy', '019' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('123', 'prélèv',-24, '14/07/2019', 'Auchan Cergy', '019' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('124', 'prélèv',-25, '13/07/2019', 'Auchan Cergy', '019' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('125', 'prélèv',-50, '12/07/2019', 'LCL', '019' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('126', 'prélèv',-70, '19/07/2019', 'LCL', '019' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('127', 'prélèv',-60, '19/07/2019', 'LCL', '019' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('128', 'prélèv',-50, '19/07/2019', 'LCL', '019' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('129', 'virement',1140, '01/08/2019', 'Auchan Cergy', '019' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('130', 'prélèv',-400, '15/08/2019', 'Loyer', '020' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('131', 'prélèv',-25, '28/08/2019', 'Auchan Cergy', '020' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('132', 'prélèv',-230, '12/08/2019', 'LCL', '020' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('133', 'prélèv',-70, '19/08/2019', 'LCL', '020' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('134', 'prélèv',-60, '17/08/2019', 'LCL', '020' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('135', 'prélèv',-50, '20/08/2019', 'LCL', '020' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('136', 'virement',1200, '01/08/2019', 'Auchan Cergy', '020' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('137', 'prélèv',-24, '14/09/2019', 'Auchan Cergy', '021' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('138', 'prélèv',-25, '13/09/2019', 'Auchan Cergy', '021' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('139', 'prélèv',-50, '12/09/2019', 'LCL', '021' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('140', 'prélèv',-70, '19/012/2019', 'LCL', '023' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('141', 'prélèv',-60, '19/012/2019', 'LCL', '023' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('142', 'prélèv',-50, '19/012/2019', 'LCL', '023' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('143', 'virement',1240, '01/09/2019', 'Auchan Cergy', '021' );


INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('144', 'prélèv',-400, '15/09/2019', 'Loyer', '021' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('145', 'prélèv',-25, '28/10/2019', 'Auchan Cergy', '022' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('146', 'prélèv',-230, '12/10/2019', 'LCL', '022' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('148', 'prélèv',-50, '19/10/2019', 'LCL', '022' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('149', 'prélèv',-10, '17/10/2019', 'LCL', '022' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('150', 'prélèv',-510, '20/11/2019', 'LCL', '022' );

	INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('151', 'prélèv',-50, '19/11/2019', 'LCL', '022' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('152', 'prélèv',-10, '17/11/2019', 'LCL', '022' );

INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('153', 'prélèv',-510, '20/11/2019', 'LCL', '022' );
















	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('032', 'prélèv',-70, '01/04/2019', 'LCL', '004' );

	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('031', 'prélèv',-500, '02/04/2019', 'LCL', '004' );

	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('030', 'prélèv',-200, '21/04/2019', 'LCL', '004' );

	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('029', 'virement',3912, '01/04/2019', 'LCL', '004' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('028', 'virement',55, '19/04/2019', 'Monoprix', '004' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('027', 'prélèv',-210, '17/04/2019', 'Auchan', '004' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('026', 'virement',200, '13/04/2019', 'LCL', '004' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('025', 'prélèv',-100, '11/04/2019', 'LCL', '004' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('024', 'virement',30, '01/04/2019', 'Les 4 temps', '004' );



INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('034', 'prélèv',-45, '013/04/2019', 'Mcdo', '004' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('035', 'virement',25, '15/04/2019', '', '004' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('036', 'prélèv',-230, '17/04/2019', 'LCL', '004' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('037', 'prélèv',-10, '21/04/2019', 'LCL', '004' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('038', 'prélèv',-200, '22/04/2019', 'LCL', '004' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('039', 'virement',-40, '11/04/2019', 'LCL', '004' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('040', 'prélèv',-20, '01/04/2019', 'LCL', '004' );






	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('041', 'prélèv',-70, '01/04/2019', 'LCL', '006' );

	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('042', 'prélèv',-500, '02/04/2019', 'LCL', '006' );

	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('043', 'prélèv',-200, '21/04/2019', 'LCL', '006' );

	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('044', 'virement',1212, '01/04/2019', 'LCL', '005' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('045', 'virement',55, '19/04/2019', 'Monoprix', '005' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('046', 'prélèv',-210, '17/04/2019', 'Auchan', '005' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('047', 'virement',200, '13/04/2019', 'LCL', '005' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('048', 'prélèv',-100, '11/04/2019', 'LCL', '005' );
	INSERT INTO evenement 
		(event_id, type , quantite, date_transaction, lieu, historique_id)
		VALUES ('049', 'virement',30, '01/04/2019', 'Les 4 temps', '005' );



INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('056', 'prélèv',-45, '013/04/2019', 'Mcdo', '006' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('055', 'virement',2543, '15/04/2019', '', '006' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('054', 'prélèv',-230, '17/04/2019', 'LCL', '006' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('053', 'prélèv',-10, '21/04/2019', 'LCL', '006' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('052', 'prélèv',-200, '22/04/2019', 'LCL', '006' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('051', 'virement',-40, '11/04/2019', 'LCL', '006' );
INSERT INTO evenement 
	(event_id, type , quantite, date_transaction, lieu, historique_id)
	VALUES ('050', 'prélèv',-20, '01/04/2019', 'LCL', '006' );

--Supprimer une table ou user_id= 6
DELETE FROM utilisateur 
WHERE 	user_id=6;
-- metre a jour une table avec UPDATE
	UPDATE utilisateur
	SET nom = 'Lepetit'
	WHERE user_id=1;


SELECT 
MAX (quantite)
FROM evenement
JOIN historique
    ON historique.historique_id = evenement.historique_id
JOIN compte
    ON compte.account_id = historique.account_id
JOIN utilisateur
	ON utilisateur.user_id=compte.user_id
	;

SELECT 
MIN (quantite)
FROM evenement
JOIN historique
    ON historique.historique_id = evenement.historique_id
JOIN compte
    ON compte.account_id = historique.account_id
JOIN utilisateur
	ON utilisateur.user_id=compte.user_id
	;

	SELECT 
MIN (date_transaction)
FROM evenement
JOIN historique
    ON historique.historique_id = evenement.historique_id
JOIN compte
    ON compte.account_id = historique.account_id
JOIN utilisateur
	ON utilisateur.user_id=compte.user_id
	;
	
	
SELECT 
MAX (date_transaction)
FROM evenement
JOIN historique
    ON historique.historique_id = evenement.historique_id
JOIN compte
    ON compte.account_id = historique.account_id
JOIN utilisateur
	ON utilisateur.user_id=compte.user_id
	;
	

SELECT 
SUM (quantite)
FROM evenement, historique, compte, utilisateur
  WHERE utilisateur.user_id=1
    AND historique.historique_id = evenement.historique_id

    AND compte.account_id = historique.account_id
	AND utilisateur.user_id=compte.user_id
	;
