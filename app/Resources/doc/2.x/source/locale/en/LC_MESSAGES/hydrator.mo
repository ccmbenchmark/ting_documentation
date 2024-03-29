��          �                 "        @  G   X  5   �     �     �     
  �   "  �   �     �  �   �     �  Q   �  5  �  Q     h  n     �     �  F   �  $   =     b     x     �  �   �  �   4	      �	  �   
     �
  7   �
    �
  ?   �   $data contiendra comme structure : Au sujet des hydrateurs Cet objet stdClass est accessible dans la clée 0 du tableau retourné. Dans ce cas $user contient directement un objet User. Données sans metadata Jointure avec aucune donnée L'hydrateur par défaut L'hydrateur par défaut est optimisé pour retourner plusieurs objets, lorsque l'on fait une requête qui n'a pour but que de retourner un objet, il n'est pas des plus appropriés. L'hydrateur par défaut va retourner pour chaque ligne un tableau associatif avec pour clé le nom de la table (ou l'alias utilisé) et pour valeur l'objet qu'il a réussi à créer par rapport aux metadata. L'hydrateur pour un seul objet L'hydrateur va être chargé de transformer le résultat d'une requête SQL dans les objets qui ont été configurés dans les metadata par l'intermédiaire du :doc:`Repository <repository>` Les hydrateurs Lorsque la jointure ne retourne aucune donnée, la clé 'c' aura pour valeur null Si vous effectuez une requête qui retourne des données qui ne correspondent à aucune metadata, que ce soit une colonne d'aggrégation comme SUM(price) ou une colonne qui n'a pas été mappée comme my_extra_column l'hydrateur va créer un objet stdClass avec des propriétés correspondant à ces colonnes. Vous pouvez injecter l'HydratorSingleObject qui conviendra mieux à votre besoin. Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-06-15 12:06+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 1.3
 $data contain: About hydrators This stdClass object is accessible in the key 0 of the returned array. Dans ce cas $user est un objet User. Data without metadata SQL join with no data Default hydrator The default hydrator is optimized to return multiple objects when we do a query that is intended to return only one item, it is not the best choice. The default hydrator will use the metadata to create the right object and will fill an associative array with, as a key, the table name (or alias used) and the object for as a value The hydrator for a single object The hydrator handles the sql query transformation into the objects that were configured in the metadata through the :doc:`Repository <repository>` About the hydrators When the join returns no data, the key 'c' will be null If you perform a query that returns data that do not match any metadata, whether an aggregation column as SUM(price) or a column that has not been mapped as my_extra_column the hydrator will create a stdClass object with properties corresponding to those columns. You can inject HydratorSingleObject that suit better your needs 