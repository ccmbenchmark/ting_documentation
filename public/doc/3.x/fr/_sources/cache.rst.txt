.. sectnum::
    :start: 8

Le cache
========

Au sujet du cache
-----------------
Le résultat d'une requête effectuée avec les objets de cache sera soit récupéré depuis le cache si l'entrée y existe déjà,
soit récupéré depuis la base de données puis inséré dans le cache.

Le résultat de la requête stockée dans le cache n'est pas dépendant du système d'hydration utilisé.

Requête simple
--------------
Une requête destiné à utiliser le cache s'effectue en récupérant l'objet ``CCMBenchmark\Ting\Query\Cached\Query`` via le :doc:`Repository <repository>`.

Pour ce faire il suffit d'appeler l'objet et de préciser la durée de mise en cache et la clé de cache:

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;

    class SampleRepository extends Repository implements MetadataInitializer
    {

        public function getUsers()
        {
            $query = $this->getCachedQuery('SELECT ...');
            $query->setTtl(300); // 5mn
            $query->setCacheKey('listOfUser');

            // ...

Requête préparée
----------------
Pour une requête préparée il faut récupérer l'objet ``CCMBenchmark\Ting\Query\Cached\PreparedQuery`` via le :doc:`Repository <repository>`.

Pour ce faire il suffit d'appeler l'objet et de préciser la durée de mise en cache et la clé de cache:

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;

    class SampleRepository extends Repository implements MetadataInitializer
    {

        public function getUsers()
        {
            $query = $this->getCachedPreparedQuery('SELECT ...');
            $query->setTtl(300); // 5mn
            $query->setCacheKey('listOfUser');

            // ...
