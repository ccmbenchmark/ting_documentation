��          �               �  '   �  "   �  !   �     
  #   "     F  $   \  =   �  �   �       �   �  �   <     �     �  #     �   )  M   �       �   !  �   �  w   �  g     A   o  w  �     )
     H
     ^
     s
     �
     �
     �
  2   �
  �        �  �   �  �   S  
   �     �       s     )   �     �  �   �  �   L  r     d   �  ;   �   Compter les éléments d'une collection Effectuer une requête d'écriture Effectuer une requête de lecture Erreur sur une requête Explication sur le format retourné Exécuter la requête Exécuter une requête sur le master Format de retour simplifié pour des requêtes sans jointures Il faut savoir qu'une Collection implémente l'interface standard Countable. Vous pouvez donc savoir combien elle a d'éléments comme vous le faites pour un tableau PHP : count($collection); L'objet Query La logique reste la même que pour une requête de lecture, à quelques différences près. Il faut appeler la méthode "execute" sur l'objet CCMBenchmark\\Ting\\Query\\Query La méthode "query" retourne un objet CCMBenchmark\\Ting\\Repository\\Collection. Cet objet est un Iterator, vous pouvez donc récupérer les résultats de cette façon : Les paramètres Les requêtes Pour ce faire il suffit d'appeler : Pour mettre des paramètres dynamiques dans la requête il faut utiliser la méthode "setParams" qui prend en argument un tableau associatif : Pour retourner les données de lecture il faut utiliser la méthode "query" : Récupérer les résultats Si la requête exécutée ne se termine pas correctement, une exception du type CCMBenchmark\\Ting\\Driver\\QueryException sera levée Une requête de lecture s'effectuera par défaut sur un des slaves configurés (si des slaves ont été configurés), si vous avez besoin d'effectuer votre requête sur le master, alors il faut appeler la méthode "selectMaster" : Une requête s'effectue en récupérant l'objet CCMBenchmark\\Ting\\Query\\Query via le :doc:`Repository <repository>`. Voir la documentation concernant l':ref:`hydration pour un seul objet <l-hydrateur-pour-un-seul-objet>` Voir la documentation concernant les :doc:`hydrateurs <hydrator>` Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-06-15 12:06+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 Counting items in a collection Perform a write query Perform a read query Error on a query Details about the output format Perform the query Perform a query on the master Simplified output format for queries without joins Knowing that a Collection implements the standard interface Countable. You can find how many elements it contains just as you would do for a PHP array: count($collection);  The Query object The logic is the same as for a read request. Except that you need to call the method "execute" on the object CCMBenchmark\\Ting\\Query\\Query The "query" method returns an object CCMBenchmark\\Ting\\Repository\\Collection. This object is an Iterator, you can retrieve the results with an iteration: Parameters Queries To do this, just call: To define dynamic parameters in the query call the method "setParams" which takes as argument an associative array: To fetch the data use the method "query": Get the output If the query executed does not complete successfully, an exception of type CCMBenchmark\\Ting\\Driver\\QueryException will be raised A read query will be made by default on one of the configured slaves (when some slaves have been configured), if you need to perform your query on the master, then you must call the method "selectMaster": A query is done by retrieving the object CCMBenchmark\\Ting\\Query\\Query from the :doc:`Repository <repository>`. See the documentation about the :ref:`hydrator for a single object <l-hydrateur-pour-un-seul-objet>` See the documentation about the :doc:`hydrators <hydrator>` 