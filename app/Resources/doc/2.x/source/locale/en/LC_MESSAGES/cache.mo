��    
      l               �      �      �   �   �   i   �  i     �   y     
       �   .  h  �     5     E  �   K  [   �  j   Z  �   �     U     d  �   q   Au sujet du cache Le cache Le résultat d'une requête effectuée avec les objets de cache sera soit récupéré depuis le cache si l'entrée y existe déjà, soit récupéré depuis la base de données puis inséré dans le cache. Le résultat de la requête stockée dans le cache n'est pas dépendant du système d'hydration utilisé. Pour ce faire il suffit d'appeler l'objet et de préciser la durée de mise en cache et la clé de cache: Pour une requête préparée il faut récupérer l'objet CCMBenchmark\\Ting\\Query\\Cached\\PreparedQuery via le :doc:`Repository <repository>`. Requête préparée Requête simple Une requête destiné à utiliser le cache s'effectue en récupérant l'objet CCMBenchmark\\Ting\\Query\\Cached\\Query via le :doc:`Repository <repository>`. Project-Id-Version: ting 1
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
 About the cache Cache The result of a query made with the cache objects will be eitherretrieved from the cache if the entry is already there or recovered from the database and inserted into the cache. The result of the query stored in the cache does not depend on the used hydratation system. To proceed, just call the object and specify the duration it should remain in the cache and the cache key: For a prepared statement you must retrieve the object CCMBenchmark\\Ting\\Query\\Cached\\PreparedQuery from the :doc:`Repository <repository>`. Prepared query Simple query A query intended to use the cache is done by retrieving the object CCMBenchmark\\Ting\\Query\\Cached\\Query from the :doc:`Repository <repository>`. 