��    !      $              ,     -  7   D     |  E   �  �   �  f   m     �  Q   �  ~   4     �  �   3  ~   �     t     �  	   �     �  "   �  <   �  J     .   ]  6   �  5   �     �       
             "  
   +  F   6  >   }     �  G   �  v  	     ~
  7   �
     �
  E   �
  �   *  f   �     %  Q   3  ~   �       �   �  ~   F     �     �  	   �     �  "     <   &  J   c  .   �  6   �  5        J     S  
   `     k     s  
   |  F   �  >   �       G      Au sujet du Repository Comme un exemple est plus parlant qu'un long discours : Création des Metadata Documentation disponible sur https://github.com/auraphp/Aura.SqlQuery Il est aussi responsable d'initialiser les ``Metadata`` qui concernent votre entité afin de savoir comment mapper votre objet en base de données. Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles. Le Repository Le Repository fourni plusieurs méthodes afin de faciliter les requêtes simples. Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet ``Query``. Le type booléen est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque sgbd : Les types ``bool``, ``datetime`` et ``json`` sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent donc d'être sérializés/désérializés via des options : On peut avoir besoin de chaîner des requêtes, un QueryBuilder est adapté pour ce cas. Ting le fourni via ``aura/sqlquery``. Quelques précisions : QueryBuilder Requêtes Tous les objets Trouver un objet par clé primaire Un objet d'après une ou plusieurs propriété(s) du modèle Une collection d'objet d'après une ou plusieurs propriété(s) du modèle Vous pouvez injecter votre propre serializer : ``CCMBenchmark\Ting\Driver\Mysqli\Serializer\Boolean`` ``CCMBenchmark\Ting\Driver\Pgsql\Serializer\Boolean`` ``bool`` ``datetime`` ``double`` ``int`` ``json`` ``string`` columnName correspond au nom de la colonne dans votre base de données fieldName correspond au nom de la propriété de votre entité ou type correspond au type de votre variable avec comme valeur possibles : Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-04-22 11:25+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: fr <LL@li.org>
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 Au sujet du Repository Comme un exemple est plus parlant qu'un long discours : Création des Metadata Documentation disponible sur https://github.com/auraphp/Aura.SqlQuery Il est aussi responsable d'initialiser les ``Metadata`` qui concernent votre entité afin de savoir comment mapper votre objet en base de données. Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles. Le Repository Le Repository fourni plusieurs méthodes afin de faciliter les requêtes simples. Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet ``Query``. Le type booléen est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque sgbd : Les types ``bool``, ``datetime`` et ``json`` sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent donc d'être sérializés/désérializés via des options : On peut avoir besoin de chaîner des requêtes, un QueryBuilder est adapté pour ce cas. Ting le fourni via ``aura/sqlquery``. Quelques précisions : QueryBuilder Requêtes Tous les objets Trouver un objet par clé primaire Un objet d'après une ou plusieurs propriété(s) du modèle Une collection d'objet d'après une ou plusieurs propriété(s) du modèle Vous pouvez injecter votre propre serializer : ``CCMBenchmark\Ting\Driver\Mysqli\Serializer\Boolean`` ``CCMBenchmark\Ting\Driver\Pgsql\Serializer\Boolean`` ``bool`` ``datetime`` ``double`` ``int`` ``json`` ``string`` columnName correspond au nom de la colonne dans votre base de données fieldName correspond au nom de la propriété de votre entité ou type correspond au type de votre variable avec comme valeur possibles : 