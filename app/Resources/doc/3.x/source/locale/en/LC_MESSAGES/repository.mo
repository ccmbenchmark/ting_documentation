��                               7   $     \  E   s  �   �  f   M     �  Q   �  ~     �   �     S  ~   �     R     i  	   v     �  "   �  <   �  J   �  .   ;     j     s  
   �     �     �  
   �  F   �  >   �     -  G   0  w  x     �	  '   
     -
  C   ?
  {   �
  R   �
  
   R  I   ]  f   �  �     ~   �  d   /     �     �     �  	   �  "   �  :   �  F     #   f     �     �  
   �     �     �  
   �  5   �  4   �     2  ?   5   Au sujet du Repository Comme un exemple est plus parlant qu'un long discours : Création des Metadata Documentation disponible sur https://github.com/auraphp/Aura.SqlQuery Il est aussi responsable d'initialiser les ``Metadata`` qui concernent votre entité afin de savoir comment mapper votre objet en base de données. Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles. Le Repository Le Repository fourni plusieurs méthodes afin de faciliter les requêtes simples. Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet ``Query``. Le type ``bool``, ``datetime`` et ``json`` sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent donc d'être sérializés/désérializés via des options : Le type booléen est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque sgbd : On peut avoir besoin de chaîner des requêtes, un QueryBuilder est adapté pour ce cas. Ting le fourni via ``aura/sqlquery``. Quelques précisions : QueryBuilder Requêtes Tous les objets Trouver un objet par clé primaire Un objet d'après une ou plusieurs propriété(s) du modèle Une collection d'objet d'après une ou plusieurs propriété(s) du modèle Vous pouvez injecter votre propre serializer : ``bool`` ``datetime`` ``double`` ``int`` ``json`` ``string`` columnName correspond au nom de la colonne dans votre base de données fieldName correspond au nom de la propriété de votre entité ou type correspond au type de votre variable avec comme valeur possibles : Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-04-22 11:25+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 About the repository As an example speaks louder than words: Creating Metadata Documentation available on https://github.com/auraphp/Aura.SqlQuery It also bear the responsibility to intialize ``Metadata`` related to your entity, to learn how to map your database object. Please take a look at the source code of each Serializer to see available options. Repository The Repository provides several methods to perform common queries easily. The repository is the link between your entity object and your database, through the ``Query`` object. The type ``bool``, ``datetime`` and ``json`` are a bit special because they are dependent of database so they can be serialized / deserialized with some options: The boolean type is considered a complex type, because the way they are stored in the database differs depending on each RDBMS We can need chaining queries, a QueryBuilder can be used. Ting provide it through ``aura/sqlquery``. Some details: QueryBuilder Queries All items Find an object by it's primary key An object according to one or more properties of the model An object collection, according to one or more properties of the model You can inject your own serializer: ``bool`` ``datetime`` ``double`` ``int`` ``json`` ``string`` columnName is the name of the column in your database fieldName is the name of the property of your entity or type is the type of your variable; among one of the following : 