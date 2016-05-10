��          �               |     }  K   �     �  �   �     �  (   �     �       �   +  �   �     �  �   �  E   �  9   �       Q     !   o    �  �   �  A  �  p   �	  v  8
     �  K   �       �   '     �  (   �     (     E  �   ]  �        �  �     E   �  9        @  Q   O  !   �    �  �   �  A  �  p   �   Au sujet des hydrateurs Cet objet ``stdClass`` est accessible dans la clée 0 du tableau retourné. Composition d'objet Dans le cas d'une colonne d'aggrégation, on peut souhaiter la mapper dans un objet. Pour mapper la colonne ``nb_books`` dans mon model User via la méthode ``setNbBooks`` il suffit de faire : Données sans metadata Déserializer des données sans metadata Jointure avec aucune donnée L'hydrateur par défaut L'hydrateur par défaut est optimisé pour retourner plusieurs objets, lorsque l'on fait une requête qui n'a pour but que de retourner un objet, il n'est pas des plus appropriés. L'hydrateur par défaut va retourner pour chaque ligne un tableau associatif avec pour clé le nom de la table (ou l'alias utilisé) et pour valeur l'objet qu'il a réussi à créer par rapport aux metadata. L'hydrateur pour un seul objet L'hydrateur va être chargé de transformer le résultat d'une requête SQL dans les objets qui ont été configurés dans les metadata par l'intermédiaire du :doc:`Repository <repository>` La collection retournée est composée de lignes structurées ainsi : La collection retournée est une collection d'objet User. Les hydrateurs Lorsque la jointure ne retourne aucune donnée, la clé 'c' aura pour valeur null Mapper des données sans metadata On peut vouloir faire de la composition d'objet, injecter un objet dans un autre et ce sur plusieurs niveaux. Pour mapper l'objet ``Country`` (qui a l'alias ``co``) dans mon model ``City`` (qui a l'alias ``cit``) via la méthode ``setCountry`` il suffit de faire : Pour rappel l'action de déserializer consiste à transformer un type de base données dans un type PHP. Par exemple si on récupère une date qui n'est pas dans des metadata, on peut vouloir transformer la date en objet ``Datetime``. Si vous effectuez une requête qui retourne des données qui ne correspondent à aucune metadata, que ce soit une colonne d'aggrégation comme ``SUM(price)`` ou une colonne qui n'a pas été mappée comme ``my_extra_column`` l'hydrateur va créer un objet ``stdClass`` avec des propriétés correspondant à ces colonnes. Vous pouvez injecter ``CCMBenchmark\Ting\Repository\HydratorSingleObject`` qui conviendra mieux à votre besoin. Project-Id-Version: ting 1
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
Generated-By: Babel 2.2.0
 Au sujet des hydrateurs Cet objet ``stdClass`` est accessible dans la clée 0 du tableau retourné. Composition d'objet Dans le cas d'une colonne d'aggrégation, on peut souhaiter la mapper dans un objet. Pour mapper la colonne ``nb_books`` dans mon model User via la méthode ``setNbBooks`` il suffit de faire : Données sans metadata Déserializer des données sans metadata Jointure avec aucune donnée L'hydrateur par défaut L'hydrateur par défaut est optimisé pour retourner plusieurs objets, lorsque l'on fait une requête qui n'a pour but que de retourner un objet, il n'est pas des plus appropriés. L'hydrateur par défaut va retourner pour chaque ligne un tableau associatif avec pour clé le nom de la table (ou l'alias utilisé) et pour valeur l'objet qu'il a réussi à créer par rapport aux metadata. L'hydrateur pour un seul objet L'hydrateur va être chargé de transformer le résultat d'une requête SQL dans les objets qui ont été configurés dans les metadata par l'intermédiaire du :doc:`Repository <repository>` La collection retournée est composée de lignes structurées ainsi : La collection retournée est une collection d'objet User. Les hydrateurs Lorsque la jointure ne retourne aucune donnée, la clé 'c' aura pour valeur null Mapper des données sans metadata On peut vouloir faire de la composition d'objet, injecter un objet dans un autre et ce sur plusieurs niveaux. Pour mapper l'objet ``Country`` (qui a l'alias ``co``) dans mon model ``City`` (qui a l'alias ``cit``) via la méthode ``setCountry`` il suffit de faire : Pour rappel l'action de déserializer consiste à transformer un type de base données dans un type PHP. Par exemple si on récupère une date qui n'est pas dans des metadata, on peut vouloir transformer la date en objet ``Datetime``. Si vous effectuez une requête qui retourne des données qui ne correspondent à aucune metadata, que ce soit une colonne d'aggrégation comme ``SUM(price)`` ou une colonne qui n'a pas été mappée comme ``my_extra_column`` l'hydrateur va créer un objet ``stdClass`` avec des propriétés correspondant à ces colonnes. Vous pouvez injecter ``CCMBenchmark\Ting\Repository\HydratorSingleObject`` qui conviendra mieux à votre besoin. 