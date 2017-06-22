��    -      �              �     �       7        S     o  1   �  E   �     �  �     f   �  �     �         �  Q   �  ~   �     w    �  r   �  F   	     Y	  �   �	  �   e
  �   �
  ~   �     6     M  	   Z     d  "   t  <   �  J   �  y        �     �  
   �     �     �  
   �  F   �  >     U   \     �  U   �  G     w  S     �     �  '   �          6     H  C   d     �  {   �  R   9  �   �  �   h  
   �  I   �  f   I  
   �    �  R   �  7     ~   I  s   �  \   <  �   �  d   <     �     �     �  	   �  "   �  :   �  F   ,  k   s     �     �  
   �             
     5     4   R  Q   �     �  Q   �  ?   .   Au sujet du Repository Au sujet du serializer Comme un exemple est plus parlant qu'un long discours : Configuration du serializer Création des Metadata Disponible uniquement à partir de la version 3.2 Documentation disponible sur https://github.com/auraphp/Aura.SqlQuery Ecrire un serializer Il est aussi responsable d'initialiser les ``Metadata`` qui concernent votre entité afin de savoir comment mapper votre objet en base de données. Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles. L'interface ``CCMBenchmark\Ting\Serializer\SerializeInterface`` permet de transformer une valeur en donnée stockable en base de donnée. L'interface ``CCMBenchmark\Ting\Serializer\UnserializeInterface`` permet de faire l'opération inverse. La serialisation est l'opération qui permet de passer d'une donnée PHP vers une donnée au format SGBD. La déserialisation est l'opération inverse. Le Repository Le Repository fourni plusieurs méthodes afin de faciliter les requêtes simples. Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet ``Query``. Le Serializer Le serializer doit implémenter l'interface ``CCMBenchmark\Ting\Serializer\SerializeInterface`` et/ou ``CCMBenchmark\Ting\Serializer\UnserializeInterface``. Si l'on souhaite implémenter les 2 interfaces, on préfèrera utiliser ``CCMBenchmark\Ting\Serializer\SerializerInterface`` Le serializer permet de gérer les types complexes tels que les types suivants ``bool``, ``datetime`` et ``json``. Le serializer peut être configurer via la clé ``serializer_options`` Le type booléen est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque SGBD : Le type datetime est considéré comme complexe car il permet de transformer un objet DateTime dans un format compréhensible pour le SGBD. Le type json est complexe car il permet de transformer un tableau de données en chaîne de caractère compréhensible par le SGBD. Les types ``bool``, ``datetime`` et ``json`` sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent donc d'être sérializés/désérializés via les options du serializer On peut avoir besoin de chaîner des requêtes, un QueryBuilder est adapté pour ce cas. Ting le fourni via ``aura/sqlquery``. Quelques précisions : QueryBuilder Requêtes Tous les objets Trouver un objet par clé primaire Un objet d'après une ou plusieurs propriété(s) du modèle Une collection d'objet d'après une ou plusieurs propriété(s) du modèle Vous pouvez écrire vos propres serializers et les injecter dans la définition du repository via la clé ``serializer``. ``bool`` ``datetime`` ``double`` ``int`` ``json`` ``string`` columnName correspond au nom de la colonne dans votre base de données fieldName correspond au nom de la propriété de votre entité getter permet de redéfinir le nom du getter (par defaut, le getter est getFieldName) ou setter permet de redéfinir le nom du setter (par defaut, le setter est setFieldName) type correspond au type de votre variable avec comme valeur possibles : Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2017-06-22 11:59+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.4.0
 About the repository About the serializer As an example speaks louder than words: Serializer configuration Creating Metadata Available since version 3.2 Documentation available on https://github.com/auraphp/Aura.SqlQuery Writing a serializer It also bear the responsibility to intialize ``Metadata`` related to your entity, to learn how to map your database object. Please take a look at the source code of each Serializer to see available options. The interface ``CCMBenchmark\Ting\Serializer\SerializeInterface`` transform a value into a data understandable by DMBS. The interface ``CCMBenchmark\Ting\Serializer\UnserializeInterface`` authorize the reverse operation Serialization is the operation which transform PHP data into understandable data for RDBMS. The reverse operation is called unserialization Repository The Repository provides several methods to perform common queries easily. The repository is the link between your entity object and your database, through the ``Query`` object. Serializer The serializer must implements interface ``CCMBenchmark\Ting\Serializer\SerializeInterface`` and/or ``CCMBenchmark\Ting\Serializer\UnserializeInterface``. If you want implents both interfaces, you must use ``CCMBenchmark\Ting\Serializer\SerializerInterface`` Serializer allow complex type management like ``bool``, ``datetime`` and ``json``. Serializer is configured by ``serializer_options``  key The boolean type is considered a complex type, because the way they are stored in the database differs depending on each RDBMS The datetime type is considered as complex because it transform DateTime object into understandable format by RDBMS The json type is complex because it translate data array into string understandable by RDBMS The types ``bool``, ``datetime`` and ``json`` are a bit special because they are dependent of database so they can be serialized / deserialized with some options: We can need chaining queries, a QueryBuilder can be used. Ting provide it through ``aura/sqlquery``. Some details: QueryBuilder Queries All items Find an object by it's primary key An object according to one or more properties of the model An object collection, according to one or more properties of the model You can write your own serializers and inject it into the repository definition by using ``serializer`` key ``bool`` ``datetime`` ``double`` ``int`` ``json`` ``string`` columnName is the name of the column in your database fieldName is the name of the property of your entity the getter key allows to change name of the getter, by default it is getFieldName or the setter key allows to change name of the setter, by default it is setFieldName type is the type of your variable; among one of the following : 