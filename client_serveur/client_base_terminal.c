#include <netinet/in.h>
#include <sys/socket.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>


int main (int argc, char *argv[]) {
	char buf [80] ;
	int s_cli ;
	/*char carte [12]= argv[1];
	char code [4]= argv[2];
	char ammount [1000] = argv[3];*/
	struct sockaddr_in serv_addr ;

	s_cli = socket (PF_INET, SOCK_STREAM, 0) ;

	serv_addr.sin_family = AF_INET ;
	serv_addr.sin_addr.s_addr = inet_addr (argv[1]) ;
	serv_addr.sin_port = htons (atoi(argv[2])) ;
	memset (&serv_addr.sin_zero, 0, sizeof(serv_addr.sin_zero));

	connect (s_cli, (struct sockaddr *)&serv_addr, sizeof serv_addr) ;
        printf ("Je me suis connecté au serveur %s sur son port %d\n", \
                   inet_ntoa (serv_addr.sin_addr), ntohs (serv_addr.sin_port)) ;


	//envoi numero CB
	memset (buf, 0, 80);
	strcpy (buf, argv[3]) ;
	write (s_cli, buf, strlen (buf)) ;
	printf ("J'ai envoye [%s] au serveur\n", buf) ;

        memset (buf, 0, 80);
        read (s_cli, buf, 80) ;
        printf ("J'ai recu [%s] du serveur\n", buf) ;

	//envoi code CB
	memset (buf, 0, 80);
	strcpy (buf, argv[4]) ;
	write (s_cli, buf, strlen (buf)) ;
	printf ("J'ai envoye [%s] au serveur\n", buf) ;

        memset (buf, 0, 80);
        read (s_cli, buf, 80) ;
        printf ("J'ai recu [%s] du serveur\n", buf) ;

	//envoi montant si le serveur valide la pousuite de la transaction
	if (!strncmp (buf, "Oui", strlen("Oui"))) {

		memset (buf, 0, 80);
		strcpy (buf, argv[5]) ;
		write (s_cli, buf, strlen (buf)) ;
		printf ("J'ai envoye [%s] au serveur\n", buf) ;

		memset (buf, 0, 80);
		read (s_cli, buf, 80) ;
		printf ("J'ai recu [%s] du serveur\n", buf) ;
		
		//envoi localisation du terminal si le serveur valide la pousuite de la transaction
		if (!strncmp (buf, "Oui", strlen("Oui"))) {

			memset (buf, 0, 80);
			strcpy (buf, "7 rue Mitterand") ;
			write (s_cli, buf, strlen (buf)) ;
			printf ("J'ai envoye [%s] au serveur\n", buf) ;

			memset (buf, 0, 80);
			read (s_cli, buf, 80) ;
			printf ("J'ai recu [%s] du serveur\n", buf) ;
			printf ("paiement complete");
		}
		else printf ("paiement refuse");
	}
	else printf ("paiement refuse");
	close (s_cli) ;
}
