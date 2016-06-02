��    0      �                        "  4   '  8   \     �     �     �     �     �     �       '   '     O  i   R     �  %   �     �  I         J  �   S     6  a   ;    �  c   �  �   
  �   �  
   &	  
   1	    <	     Y
     `
  $   {
  4   �
  7   �
  ?     8   M  ;   �  C   �  2        9     B     J     S     \     e     q     y  v  �     �     �  4     8   6     o     w     �     �     �     �     �  '        )  i   ,     �  %   �     �  I   �     $  �   -       a       w  c   �  �   �  �   e  
      
            3     :  $   U  4   z  7   �  ?   �  8   '  ;   `  C   �  2   �               $     -     6     ?     K     S   City Code Configuration de la connexion à la base de données Configuration pour indiquer l'emplacement des repository Country CountryCode CountryLanguage Création des entitées Création des repository Création du repository City Création du repository Country Création du repository CountryLanguage ID Il suffit d'ajouter en tant que dépendance Ting à notre projet : ``composer require ccmbenchmark/ting`` Initialisation Initialisation de la base de données Installer Ting La base de données ``world database`` à trois tables composées ainsi : Language Lorsque l'on a créé les repository, on a indiqué avec quel entité il travaille : ``$metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);`` On va donc maintenant créer une entité pour chaque repository. Name Note : dans cet exemple nous ne prenons pas toutes les colonnes des tables pour alléger le guide Nous supposerons dans ce guide que vous avez déjà installé ``composer`` (https://getcomposer.org/) Les sources pour cet example se situerons dans ``src/VendorName/ApplicationName`` il faut donc penser à bien ajouter ce chemin dans l'autoload du composer.json : On a maintenant les repository et les entitées correspondantes, on va pouvoir faire des requêtes. On configure l'emplacement des repository en ajoutant le contenu suivant dans ``src/VendorName/ApplicationName/bootstrap.php`` : On va maintenant configurer l'accès à la base de données. Ajouter le fichier ``src/VendorName/ApplicationName/bootstrap.php`` avec le contenu suivant : Percentage Population Pour ce guide on utilise ``world database`` (http://downloads.mysql.com/docs/world.sql.gz) qu'il faut installer dans une base de données MySQL. Vous pouvez vous référer à ce guide pour savoir comment procéder https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html Region Utilisation sans framework Vous pouvez maintenant utiliser Ting ``src/VendorName/ApplicationName/Entity/City.php`` : ``src/VendorName/ApplicationName/Entity/Country.php`` : ``src/VendorName/ApplicationName/Entity/CountryLanguage.php`` : ``src/VendorName/ApplicationName/Repository/City.php`` : ``src/VendorName/ApplicationName/Repository/Country.php`` : ``src/VendorName/ApplicationName/Repository/CountryLanguage.php`` : ``src/VendorName/ApplicationName/bootstrap.php`` : char(26) char(3) char(30) char(35) char(52) float(4, 1) int(11) int(3) Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-06-02 10:40+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: fr <LL@li.org>
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 City Code Configuration de la connexion à la base de données Configuration pour indiquer l'emplacement des repository Country CountryCode CountryLanguage Création des entitées Création des repository Création du repository City Création du repository Country Création du repository CountryLanguage ID Il suffit d'ajouter en tant que dépendance Ting à notre projet : ``composer require ccmbenchmark/ting`` Initialisation Initialisation de la base de données Installer Ting La base de données ``world database`` à trois tables composées ainsi : Language Lorsque l'on a créé les repository, on a indiqué avec quel entité il travaille : ``$metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);`` On va donc maintenant créer une entité pour chaque repository. Name Note : dans cet exemple nous ne prenons pas toutes les colonnes des tables pour alléger le guide Nous supposerons dans ce guide que vous avez déjà installé ``composer`` (https://getcomposer.org/) Les sources pour cet example se situerons dans ``src/VendorName/ApplicationName`` il faut donc penser à bien ajouter ce chemin dans l'autoload du composer.json : On a maintenant les repository et les entitées correspondantes, on va pouvoir faire des requêtes. On configure l'emplacement des repository en ajoutant le contenu suivant dans ``src/VendorName/ApplicationName/bootstrap.php`` : On va maintenant configurer l'accès à la base de données. Ajouter le fichier ``src/VendorName/ApplicationName/bootstrap.php`` avec le contenu suivant : Percentage Population Pour ce guide on utilise ``world database`` (http://downloads.mysql.com/docs/world.sql.gz) qu'il faut installer dans une base de données MySQL. Vous pouvez vous référer à ce guide pour savoir comment procéder https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html Region Utilisation sans framework Vous pouvez maintenant utiliser Ting ``src/VendorName/ApplicationName/Entity/City.php`` : ``src/VendorName/ApplicationName/Entity/Country.php`` : ``src/VendorName/ApplicationName/Entity/CountryLanguage.php`` : ``src/VendorName/ApplicationName/Repository/City.php`` : ``src/VendorName/ApplicationName/Repository/Country.php`` : ``src/VendorName/ApplicationName/Repository/CountryLanguage.php`` : ``src/VendorName/ApplicationName/bootstrap.php`` : char(26) char(3) char(30) char(35) char(52) float(4, 1) int(11) int(3) 