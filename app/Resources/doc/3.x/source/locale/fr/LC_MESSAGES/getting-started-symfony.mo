��    9      �              �     �     �  4   �  8   �     %     -     9     I     a     z     �  '   �  )   �  Q   	  Z   [  p   �     '  A   *     l  %   {     �  I   �     �  �        �  �   �  c   �  *   #	  g   N	  �   �	     7
  
   ;
  
   F
  &  Q
     x  !     /   �  P   �  \   "       $   �     �     �     �     �     �     �                          <  (   ]  !   �  $   �  ,   �  v  �     q     v  4   {  8   �     �     �     �          %     >     [  '   {  )   �  Q   �  Z     p   z     �  A   �     0  %   ?     e  I   t     �  �   �     �  �   �  c   �  *   �  g     �   z     �  
   �  
   
  &       <  !   C  /   e  P   �  \   �     C  $   `     �     �     �     �     �     �     �     �     �     �         (   !  !   J  $   l  ,   �   City Code Configuration de la connexion à la base de données Configuration pour indiquer l'emplacement des repository Country CountryCode CountryLanguage Création des entitées Création des repository Création du repository City Création du repository Country Création du repository CountryLanguage Dans ``DefaultController::indexAction`` : Dans ``app/config/config.yml`` supprimer tout le bloc de configuration Doctrine : Dans cet exemple nous ne prenons pas toutes les colonnes des tables pour alléger le guide Dans le fichier ``app/AppKernel.php`` supprimer la ligne ``new Doctrine\Bundle\DoctrineBundle\DoctrineBundle()`` ID Il faut ensuite register les bundles dans ``app/AppKernel.php`` : Initialisation Initialisation de la base de données Installer Ting La base de données ``world database`` à trois tables composées ainsi : Language Lorsque l'on a créé les repository, on a indiqué avec quel entité il travaille : ``$metadata->setEntity('AppBundle\Entity\Country');`` On va donc maintenant créer une entité pour chaque repository. Name Nous supposerons dans ce guide que vous avez déjà installé `Symfony installer <http://symfony.com/download>`_, ainsi que `composer <https://getcomposer.org/>`_ Commencer par créer un nouveau projet : ``symfony new world_site 2.8`` On a maintenant les repository et les entitées correspondantes, on va pouvoir faire des requêtes. On configure l'emplacement des repository. On nomme ici la connexion ``main`` on va l'utiliser ci-dessous lors de la configuration des repository. On peut maintenant installer Ting Bundle, qui permet d'utiliser Ting sur Symfony : ``composer require ccmbenchmark/ting_bundle`` Par Percentage Population Pour ce guide on utilise `world database <http://downloads.mysql.com/docs/world.sql.gz>`_ qu'il faut installer dans une base de données MySQL. Vous pouvez vous référer au `guide officiel <https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html>`_ pour savoir comment procéder Region Retirer les librairies Doctrine : Supprimer les dépendances à Doctrine inutiles Ting a besoin de PHP 5.5, donc il faut modifier ``composer.json`` et remplacer : Ting remplace Doctrine, il faut donc retirer les références à Doctrine devenues inutiles. Utilisation avec Symfony 2.8 Vous pouvez maintenant utiliser Ting app/config/config.yml char(26) char(3) char(30) char(35) char(52) float(4, 1) int(11) int(3) src/AppBundle/Entity/City.php src/AppBundle/Entity/Country.php src/AppBundle/Entity/CountryLanguage.php src/AppBundle/Repository/City.php src/AppBundle/Repository/Country.php src/AppBundle/Repository/CountryLanguage.php Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-06-22 15:35+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: fr <LL@li.org>
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 City Code Configuration de la connexion à la base de données Configuration pour indiquer l'emplacement des repository Country CountryCode CountryLanguage Création des entitées Création des repository Création du repository City Création du repository Country Création du repository CountryLanguage Dans ``DefaultController::indexAction`` : Dans ``app/config/config.yml`` supprimer tout le bloc de configuration Doctrine : Dans cet exemple nous ne prenons pas toutes les colonnes des tables pour alléger le guide Dans le fichier ``app/AppKernel.php`` supprimer la ligne ``new Doctrine\Bundle\DoctrineBundle\DoctrineBundle()`` ID Il faut ensuite register les bundles dans ``app/AppKernel.php`` : Initialisation Initialisation de la base de données Installer Ting La base de données ``world database`` à trois tables composées ainsi : Language Lorsque l'on a créé les repository, on a indiqué avec quel entité il travaille : ``$metadata->setEntity('AppBundle\Entity\Country');`` On va donc maintenant créer une entité pour chaque repository. Name Nous supposerons dans ce guide que vous avez déjà installé `Symfony installer <http://symfony.com/download>`_, ainsi que `composer <https://getcomposer.org/>`_ Commencer par créer un nouveau projet : ``symfony new world_site 2.8`` On a maintenant les repository et les entitées correspondantes, on va pouvoir faire des requêtes. On configure l'emplacement des repository. On nomme ici la connexion ``main`` on va l'utiliser ci-dessous lors de la configuration des repository. On peut maintenant installer Ting Bundle, qui permet d'utiliser Ting sur Symfony : ``composer require ccmbenchmark/ting_bundle`` Par Percentage Population Pour ce guide on utilise `world database <http://downloads.mysql.com/docs/world.sql.gz>`_ qu'il faut installer dans une base de données MySQL. Vous pouvez vous référer au `guide officiel <https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html>`_ pour savoir comment procéder Region Retirer les librairies Doctrine : Supprimer les dépendances à Doctrine inutiles Ting a besoin de PHP 5.5, donc il faut modifier ``composer.json`` et remplacer : Ting remplace Doctrine, il faut donc retirer les références à Doctrine devenues inutiles. Utilisation avec Symfony 2.8 Vous pouvez maintenant utiliser Ting app/config/config.yml char(26) char(3) char(30) char(35) char(52) float(4, 1) int(11) int(3) src/AppBundle/Entity/City.php src/AppBundle/Entity/Country.php src/AppBundle/Entity/CountryLanguage.php src/AppBundle/Repository/City.php src/AppBundle/Repository/Country.php src/AppBundle/Repository/CountryLanguage.php 