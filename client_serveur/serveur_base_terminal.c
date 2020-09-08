#include <netinet/in.h>
#include <sys/socket.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <libpq-fe.h>
#include <time.h>
#include <unistd.h>



int main (int argc, char *argv[]) {

	time_t timestamp; 
  	struct tm * t; 

	char buf [80] ;
	PGconn *db;
	PGresult *pgres;
	PGresult *pgres2;
	
	char acc[10]; 
	//acc = "acc0010002";
	strcpy(acc, "acc0010002");
	char cmpr[4];

	char carte [80];
	char code [80];
	
	int s_ecoute, s_dial, cli_len ;
	struct sockaddr_in serv_addr, cli_addr ;

	serv_addr.sin_family = AF_INET ;
	serv_addr.sin_addr.s_addr = INADDR_ANY ;
	serv_addr.sin_port = htons (atoi(argv[1])) ;
	memset (&serv_addr.sin_zero, 0, sizeof(serv_addr.sin_zero));

	s_ecoute = socket (PF_INET, SOCK_STREAM, 0) ;
	bind (s_ecoute, (struct sockaddr *)&serv_addr, sizeof serv_addr) ;

	listen (s_ecoute, 5) ;
	cli_len = sizeof (cli_addr) ;
	s_dial = accept (s_ecoute, (struct sockaddr *)&cli_addr, &cli_len) ;

	printf ("Le client d'adresse IP %s s'est connecté depuis son port %d\n", \
	            inet_ntoa (cli_addr.sin_addr), ntohs (cli_addr.sin_port)) ;

//db = PQconnectdb("host=10.40.128.23 user=y2019l3i_dszathma dbname=db2019l3i_dszathma password=A123456*");
	db = PQconnectdb("dbname=testdb user=yelka");

//reception des numéro et code de carte bleu
	memset (buf, 0, 80);
	read (s_dial, buf, 80) ;
	strcpy(carte , buf);
	printf ("J'ai recu [%s] du client\n", buf) ;

        memset (buf, 0, 80);
        strcpy (buf, "Validation") ;
        write (s_dial, buf, strlen (buf)) ;
        printf ("J'ai envoye [%s] au client\n", buf) ;

	memset (buf, 0, 80);
	read (s_dial, buf, 80) ;
	strcpy(code , buf);
	printf ("J'ai recu [%s] du client\n", buf) ;

	
//verification {code CB/id CB}
	
	char buffer[1024];
	snprintf(buffer, sizeof(buffer), "SELECT COUNT(*) FROM carte1 WHERE carte_id='%s';",carte);
	pgres = PQexec(db, buffer);
	if (atoi(PQgetvalue(pgres,0,0))==1){
		PQclear(pgres);
		snprintf(buffer, sizeof(buffer), "SELECT carte_id,codecarte FROM carte1 WHERE carte_id='%s';",carte);
		
		pgres = PQexec(db, buffer);
		memset (buffer, 0, 80);
		strcpy(cmpr,PQgetvalue(pgres,0,1));
		

		PQclear(pgres);

		//
		

		memset (buf, 0, 80);
	 	if (!strncmp (cmpr, code, strlen("1111"))) {				//comparaison des code (=vérification)
			strcpy (buf, "Oui") ;
		
		
			write (s_dial, buf, strlen (buf)) ;
			printf ("J'ai envoye [%s] au client\n", buf) ;

			memset (buf, 0, 80);
			read (s_dial, buf, 80);
			printf ("J'ai recu [%s] du client\n", buf) ;
			int somme = atoi(buf);
			//vérification capacite de paiement {solde, plafond} -> faire la
			
			
			snprintf(buffer, sizeof(buffer), "SELECT maximum,utilise FROM carte1 FULL JOIN capacite1 ON carte1.carte_id = capacite1.carte_id WHERE carte1.carte_id='%s';",carte);			//requete pour connaitre le plafond de la carte

			pgres = PQexec(db, buffer);
			memset (buffer, 0, 80);
			int plaf = atoi(PQgetvalue(pgres,0,0))-atoi(PQgetvalue(pgres,0,1));
			int utilise = atoi(PQgetvalue(pgres,0,1));
			PQclear(pgres);

			
			snprintf(buffer, sizeof(buffer), "SELECT compte1.account_id,solde FROM carte1 FULL JOIN compte1 ON carte1.account_id = compte1.account_id WHERE carte1.carte_id='%s';",carte);			//requete pour connaitre le solde du compte

			
			pgres = PQexec(db, buffer);
			int solde = atoi(PQgetvalue(pgres,0,1));
			char compte [10];
			strcpy(compte,PQgetvalue(pgres,0,0));
			PQclear(pgres);
			//

			
			if ((solde >= somme) && (plaf >= somme)){
				int newsolde = solde-somme;
				int newplaf = utilise + somme;
				snprintf(buffer, sizeof(buffer), "UPDATE compte1 SET solde = %d WHERE compte1.account_id = '%s';",newsolde,compte);	//mise à jour du solde du payeur
				pgres = PQexec(db, buffer);
				memset (buffer, 0, 80);
				PQclear(pgres);		

				snprintf(buffer, sizeof(buffer), "UPDATE capacite1 SET utilise = %d WHERE capacite1.carte_id = '%s';",newplaf,carte);	//mise à jour de la capacite de paiement du payeur
				pgres = PQexec(db, buffer);
				memset (buffer, 0, 80);
				PQclear(pgres);		

				snprintf(buffer, sizeof(buffer), "SELECT solde FROM compte1 WHERE compte1.account_id='acc0010002';");
				//int arr = atoi(PQgetvalue(pgres,0,0));
				pgres = PQexec(db, buffer);
				memset (buffer, 0, 80);
				int arr = atoi(PQgetvalue(pgres,0,0));
				PQclear(pgres);
				
				arr = arr + somme;
				snprintf(buffer, sizeof(buffer), "UPDATE compte1 SET solde = %d WHERE compte1.account_id = 'acc0010002';",arr);		//mise à jour du solde du receveur
				pgres = PQexec(db, buffer);
				memset (buffer, 0, 80);
				PQclear(pgres);

				strcpy (buf, "Oui") ;
			

				write (s_dial, buf, strlen (buf)) ;
				printf ("J'ai envoye [%s] au client\n", buf) ;

				memset (buf, 0, 80);
				read (s_dial, buf, 80) ;
				printf ("J'ai recu [%s] du client\n", buf) ;
			
			//ajout données complémentaires

				char evid[20];
				int nb = 1;
				
				snprintf(evid, sizeof(evid), "evt0010001");
				
				snprintf(buffer, sizeof(buffer), "SELECT COUNT(*) FROM evenement1 WHERE evenement1.event_id='%s';",evid);
				pgres = PQexec(db, buffer);
				while(atoi(PQgetvalue(pgres,0,0)) == 1){		//boucle permettant d'incrémenter la clé event_id pour en trouver une libre.
					PQclear(pgres);
					nb++;
					snprintf(evid, sizeof(evid), "evt001%04d", nb);
					snprintf(buffer, sizeof(buffer), "SELECT COUNT(*) FROM evenement1 WHERE evenement1.event_id='%s';",evid);
					pgres = PQexec(db, buffer);
				}
				PQclear(pgres);
				
				timestamp = time(NULL); 
	    			t = localtime(&timestamp); 		//récupération de la date du serveur
				char datem [20];
				snprintf(datem, sizeof(datem), "%04d-%02d-%02d", 1900+t->tm_year, 1 + t->tm_mon, 1);		//date pour la table historique
				char date [20];
				snprintf(date, sizeof(date), "%04d-%02d-%02d", 1900+t->tm_year, 1 +t->tm_mon, t->tm_mday);	//date au format SQL
				
				snprintf(buffer, sizeof(buffer), "SELECT COUNT(*) FROM historique1 WHERE mois = '%s';",datem);	
				pgres = PQexec(db, buffer);
				//printf("%s",PQgetvalue(pgres,0,0));
				if(atoi(PQgetvalue(pgres,0,0)) == 1){
					PQclear(pgres);
					snprintf(buffer, sizeof(buffer), "SELECT historique_id FROM historique1 WHERE mois = '%s';",datem);
					pgres = PQexec(db, buffer);
					snprintf(buffer, sizeof(buffer), "INSERT INTO evenement1 VALUES ('%s','prélèv',-%d,'%s','%s','%s');",evid,somme,date,buf,PQgetvalue(pgres,0,0));		//insertion du nouvel évenement
					pgres2 = PQexec(db, buffer);
				}
				memset (buffer, 0, 80);
	PQclear(pgres);		
				
				memset (buf, 0, 80);
				strcpy (buf, "Fini") ;
				write (s_dial, buf, strlen (buf)) ;
				printf ("J'ai envoye [%s] au client\n", buf) ;
				
				PQfinish(db);

				close (s_dial) ;
				close (s_ecoute) ;
			}
			else {						//Fermeture de la connexion si le montant est trop élevé
			strcpy (buf, "Non") ;

			 write (s_dial, buf, strlen (buf)) ;
			printf ("J'ai envoye [%s] au client\n", buf) ;		

			PQfinish(db);

			close (s_dial) ;
			close (s_ecoute) ;
			}

		}
		else {							//Fermeture de la connexion si le code est éroné
			strcpy (buf, "Non") ;

			 write (s_dial, buf, strlen (buf)) ;
			printf ("J'ai envoye [%s] au client\n", buf) ;		

			PQfinish(db);

			close (s_dial) ;
			close (s_ecoute) ;
		}

	}
	else {								//Fermeture de la connexion si le numéro de la carte et le code n'existe pas dans la base de donnée
			strcpy (buf, "Non") ;

			 write (s_dial, buf, strlen (buf)) ;
			printf ("J'ai envoye [%s] au client\n", buf) ;		

			PQfinish(db);

			close (s_dial) ;
			close (s_ecoute) ;
		}

	

}
