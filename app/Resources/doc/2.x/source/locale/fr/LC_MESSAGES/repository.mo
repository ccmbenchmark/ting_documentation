��          �               �     �  4   �  3   )  7   ]     �  �   �  f   <     �  S   �  z     {   �  �   �     �  	   �     �  "   �  <     J   A  .   �     �  F   �       >        O     S     X  G   _  g  �     	  4   &	  3   [	  7   �	     �	  �   �	  f   n
     �
  S   �
  z   7  {   �  �   .     �  	   �       "     <   6  J   s  .   �     �  F   �     9  >   B     �     �     �  G   �   Au sujet du Repository CCMBenchmark\\Ting\\Driver\\Mysqli\\Serializer\\Bool CCMBenchmark\\Ting\\Driver\\Pgsql\\Serializer\\Bool Comme un exemple est plus parlant qu'un long discours : Création des Metadata Il est aussi responsable d'initialiser les Metadata qui concernent votre entité afin de savoir comment mapper votre objet en base de données. Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles. Le Repository Le Repository fourni plusieurs méthodes afin de faciliter les requêtes courantes. Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet Query. Le type bool est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque sgbd : Le type bool, datetime et json sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent donc d'être sérializés/désérializés via des options : Quelques précisions : Requêtes Tous les objets Trouver un objet par clé primaire Un objet d'après une ou plusieurs propriété(s) du modèle Une collection d'objet d'après une ou plusieurs propriété(s) du modèle Vous pouvez injecter votre propre serializer : bool columnName correspond au nom de la colonne dans votre base de données datetime fieldName correspond au nom de la propriété de votre entité int json string type correspond au type de votre variable avec comme valeur possibles : Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-06-15 12:06+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: fr <LL@li.org>
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 1.3
 Au sujet du Repository CCMBenchmark\\Ting\\Driver\\Mysqli\\Serializer\\Bool CCMBenchmark\\Ting\\Driver\\Pgsql\\Serializer\\Bool Comme un exemple est plus parlant qu'un long discours : Création des Metadata Il est aussi responsable d'initialiser les Metadata qui concernent votre entité afin de savoir comment mapper votre objet en base de données. Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles. Le Repository Le Repository fourni plusieurs méthodes afin de faciliter les requêtes courantes. Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet Query. Le type bool est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque sgbd : Le type bool, datetime et json sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent donc d'être sérializés/désérializés via des options : Quelques précisions : Requêtes Tous les objets Trouver un objet par clé primaire Un objet d'après une ou plusieurs propriété(s) du modèle Une collection d'objet d'après une ou plusieurs propriété(s) du modèle Vous pouvez injecter votre propre serializer : bool columnName correspond au nom de la colonne dans votre base de données datetime fieldName correspond au nom de la propriété de votre entité int json string type correspond au type de votre variable avec comme valeur possibles : 