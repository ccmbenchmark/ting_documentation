��          �               �  '   �  "   �  !   �     
  #   "     F  $   \  =   �  �   �       �   �  �   <     �     �  #     �   )  M   �       �   !  �   �  w   �  g     A   n  h  �     
     8
     P
     e
  "   x
     �
     �
  2   �
  �   �
     �  �   �  �   >  
   �     �     �  p     .   v  
   �  �   �  �   5  r     i   v  9   �   Compter les éléments d'une collection Effectuer une requête d'écriture Effectuer une requête de lecture Erreur sur une requête Explication sur le format retourné Exécuter la requête Exécuter une requête sur le master Format de retour simplifié pour des requêtes sans jointures Il faut savoir qu'une Collection implémente l'interface standard Countable. Vous pouvez donc savoir combien elle a d'éléments comme vous le faites pour un tableau PHP : count($collection); L'objet Query La logique reste la même que pour une requête de lecture, à quelques différences près. Il faut appeler la méthode "execute" sur l'objet CCMBenchmark\\Ting\\Query\\Query La méthode "query" retourne un objet CCMBenchmark\\Ting\\Repository\\Collection. Cet objet est un Iterator, vous pouvez donc récupérer les résultats de cette façon : Les paramètres Les requêtes Pour ce faire il suffit d'appeler : Pour mettre des paramètres dynamiques dans la requête il faut utiliser la méthode "setParams" qui prend en argument un tableau associatif : Pour retourner les données de lecture il faut utiliser la méthode "query" : Récupérer les résultats Si la requête exécuté ne se termine pas correctement, une exception du type CCMBenchmark\\Ting\\Driver\\QueryException sera levée Une requête de lecture s'effectuera par défaut sur un des slaves configurés (si des slaves ont été configurés), si vous avez besoin d'effectuer votre requête sur le master, alors il faut appeler la méthode "selectMaster" : Une requête s'effectue en récupérant l'objet CCMBenchmark\\Ting\\Query\\Query via le :doc:`Repository <repository>`. Voir la documentation concernant l':ref:`hydration pour un seul objet <l-hydrateur-pour-un-seul-objet>` Voir la documentation concernant les :doc:`hydrateurs <hydrator>` Project-Id-Version: ting 1
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
 Counting items in a collection Perform a write request Perform a read query Error on a request Explanation of the format returned Execute the query Run a query on the master Simplified return format for queries without joins You should know that Collection implements the standard interface Countable. So you can find out how many elements your collection contains as an array PHP: count($collection); The Query object The logic is the same as for a read request. Except must call the method "execute" on the object CCMBenchmark\\Ting\\Query\\Query The "query" method returns an object CCMBenchmark\\Ting\\Repository\\Collection. This object is an Iterator, you can retrieve the results with an iteration Parameters Queries To do this simply call: To set dynamic parameters in the query call the method "setParams" which takes as argument an associative array: To fetch the data data use the method "query": Get result If the query executed does not complete successfully, an exception of type CCMBenchmark\\Ting\\Driver\\QueryException will be raised A read request will be made by default on one of the configured slaves (when some slaves has been configured), if you need to perform your query on the master, then you must call the method "selectMaster": A query is done by retrieving the object CCMBenchmark\\Ting\\Query\\Query from the :doc:`Repository <repository>`. See the documentation concerning the :ref:`hydrator for a single object <l-hydrateur-pour-un-seul-objet>` See the documentation for the :doc:`hydrators <hydrator>` 