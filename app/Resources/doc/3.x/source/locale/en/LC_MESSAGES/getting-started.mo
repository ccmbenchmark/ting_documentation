��    /      �                          4     8   L     �     �     �     �     �     �     �  '     Z   ?     �  i   �       %        <  I   K     �  �   �     �    �  c   �  U   �  
   K  
   V  '  a     �	     �	  $   �	     �	     �	     �	     �	     �	     �	     
     
  .   
  1   F
  9   x
  2   �
  5   �
  =     ,   Y  w  �     �               %     ;     C     O     _     q     �     �  #   �  4   �       Z        s     y     �  0   �     �  �   �     �  �   �  ?   M  A   �  
   �  
   �  �   �     �     �     �     
               $     -     6     B     J  .   Q  1   �  9   �  2   �  5     =   U  ,   �   City Code Configuration de la connexion à la base de données Configuration pour indiquer l'emplacement des repository Country CountryCode CountryLanguage Création des entitées Création des repository Création du repository City Création du repository Country Création du repository CountryLanguage Dans cet exemple nous ne prenons pas toutes les colonnes des tables pour alléger le guide ID Il suffit d'ajouter en tant que dépendance Ting à notre projet : ``composer require ccmbenchmark/ting`` Initialisation Initialisation de la base de données Installer Ting La base de données ``world database`` à trois tables composées ainsi : Language Lorsque l'on a créé les repository, on a indiqué avec quelle entité il travaille : ``$metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);`` On va donc maintenant créer une entité pour chaque repository. Name Nous supposerons dans ce guide que vous avez déjà installé `composer <https://getcomposer.org/>`_. Les sources pour cet example se situerons dans ``src/VendorName/ApplicationName`` il faut donc penser à bien ajouter ce chemin dans l'autoload du composer.json : On a maintenant les repository et les entitées correspondantes, on va pouvoir faire des requêtes. On configure l'emplacement des repository en complétant le fichier ``bootstrap.php`` Percentage Population Pour ce guide on utilise `world database <http://downloads.mysql.com/docs/world.sql.gz>`_ qu'il faut installer dans une base de données MySQL. Vous pouvez vous référer au `guide officiel <https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html>`_ pour savoir comment procéder. Region Utilisation sans framework Vous pouvez maintenant utiliser Ting char(26) char(3) char(30) char(35) char(52) float(4, 1) int(11) int(3) src/VendorName/ApplicationName/Entity/City.php src/VendorName/ApplicationName/Entity/Country.php src/VendorName/ApplicationName/Entity/CountryLanguage.php src/VendorName/ApplicationName/Repository/City.php src/VendorName/ApplicationName/Repository/Country.php src/VendorName/ApplicationName/Repository/CountryLanguage.php src/VendorName/ApplicationName/bootstrap.php Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-06-06 09:05+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.4.0
 City Code Database connection settings Repositories settings Country CountryCode CountryLanguage Creating entities Creating repositories Creating City repository Creating Country repository Creating CountryLanguage repository In this tutorial we don't take all columns of tables ID Define the following requirement for your project : ``composer require ccmbenchmark/ting`` Setup Setup database Installation ``world database`` is composed of three tables : Language Previously we created the repository and linked each one with one entity : ``$metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);`` Now we create entity for each repository. Name There are some prerequesites, you should have `composer <https://getcomposer.org/>`_. Sources will be in folder ``src/VendorName/ApplicationName``. Add this autoload to composer.json Now repositories and entities are configured we can do queries. To set the directory of repository we append to ``bootstrap.php`` Percentage Population For this tutorial we are using `world database <http://downloads.mysql.com/docs/world.sql.gz>`_ which you need to install into a MySQL. You can refer to the `official guide <https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html>`_. Region Getting started You can now use Ting char(26) char(3) char(30) char(35) char(52) float(4, 1) int(11) int(3) src/VendorName/ApplicationName/Entity/City.php src/VendorName/ApplicationName/Entity/Country.php src/VendorName/ApplicationName/Entity/CountryLanguage.php src/VendorName/ApplicationName/Repository/City.php src/VendorName/ApplicationName/Repository/Country.php src/VendorName/ApplicationName/Repository/CountryLanguage.php src/VendorName/ApplicationName/bootstrap.php 