.. sectnum::
    :start: 6

Les hydrateurs
==============


Au sujet des hydrateurs
-----------------------
L'hydrateur va être chargé de transformer le résultat d'une requête SQL dans les objets qui ont été configurés dans les metadata
par l'intermédiaire du :doc:`Repository <repository>`


L'hydrateur par défaut
----------------------
L'hydrateur par défaut va retourner pour chaque ligne un tableau associatif avec pour clé le nom de la table (ou l'alias utilisé)
et pour valeur l'objet qu'il a réussi à créer par rapport aux metadata.

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getCommentForSylvain()
        {
            $query = $this->getQuery('SELECT id, name, c.text FROM user LEFT JOIN comment c ON (c.user_id = user.id) WHERE name = :name');
            $query->setParams(['name' => 'Sylvain']);

            return $query->query();
        }

        // ...

La collection retournée est composée de lignes structurées ainsi :

.. code-block:: php

  $row =
    [
      'user' => User(
        [id] => 3,
        [name] => "Sylvain"
      ),
      'c' => Comment(
        [text] => "Bonjour tout le monde"
      )
    ]

Jointure avec aucune donnée
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lorsque la jointure ne retourne aucune donnée, la clé 'c' aura pour valeur null

.. _l-hydrateur-pour-un-seul-objet:

L'hydrateur pour un seul objet
------------------------------
L'hydrateur par défaut est optimisé pour retourner plusieurs objets, lorsque l'on fait une requête qui n'a pour but que de retourner
un objet, il n'est pas des plus appropriés.

Vous pouvez injecter ``CCMBenchmark\Ting\Repository\HydratorSingleObject`` qui conviendra mieux à votre besoin.

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\CollectionInterface;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getUserSylvain()
        {
            $query = $this->getQuery('SELECT id, name, FROM user WHERE name = :name');
            $query->setParams(['name' => 'Sylvain']);

            return $query->query($this->getCollection(new CCMBenchmark\Ting\Repository\HydratorSingleObject()));
        }

        // ...

La collection retournée est une collection d'objet User.

.. _l-hydrateur-d-aggregation:

L'hydrateur d'aggrégation
-------------------------

.. note::

    Disponible uniquement à partir de la version 3.3

Celui-ci permet d'aggréger un ensemble de résultats, par exemple retourner une collection d'objet User et que chaque objet User ai la liste de tous les livres possédés par ce dernier.

Voici un exemple d'utilisation

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\CollectionInterface;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getUsersWithBooks()
        {
            $query = $this->getQuery('SELECT user.id, user.name, book.id, book.name
                    FROM user
                    INNER JOIN book ON (book.user_id = user.id)
                    ORDER BY user.id');

            $hydratorAggregator = new \CCMBenchmark\Ting\Repository\HydratorAggregator();
            $hydratorAggregator->callableIdIs(function ($result) {
                return $result['user']->getId();
            });

            $hydratorAggregator->callableDataIs(function ($result) {
                return $result['book'];
            });

            $hydratorAggregator->callableFinalizeAggregate(function ($result, $books) {
                $result['user']->setBooks($books);
                return $result['user'];
            });

            return $query->query($this->getCollection($hydratorAggregator));
    }

        // ...

Rentrons un peu dans les détails :

.. code-block:: php

    $hydratorAggregator->callableIdIs(function ($result) {
        return $result['user']->getId();
    });

La closure injectée via ``callableIdIs`` permet de retourner l'identifiant qui sera utilisé comme clée d'aggrégation (ici l'identifiant de l'utilisateur)

.. note::

    Il est très important d'effectuer un tri dans votre requête SQL sur cette clée d'aggrégation sinon vous aurez des résultats partiels.

.. code-block:: php

    $hydratorAggregator->callableDataIs(function ($result) {
        return $result['book'];
    });

La closure injectée via ``callableDataIs`` permet de retourner la donnée qui doit être aggrégée (ici un Livre)

.. code-block:: php

    $hydratorAggregator->callableFinalizeAggregate(function ($result, $books) {
        $result['user']->setBooks($books);
        return $result['user'];
    });

Cette dernière partie est facultative, si elle est omise, le résultat de l'aggrégation se trouvera dans la clée ``aggregate`` de la collection.
Elle vous permet d'effectuer une opération de finalisation et de choisir ce que vous voulez faire des données qui viennent d'être aggrégées, ici
il s'agit d'une liste de livre que nous injectons dans l'utilisateur via la méthode ``setBooks``

La collection retournée est composée de lignes structurées ainsi :

.. code-block:: php

    $row =
      [
        0 => User(
          [id] => 1,
          [name] => 'Sylvain'
          [books] => [
            Book(
              [id] => 1
              [name] => "Tintin au tibet"
            ),
            Book(
              [id] => 2
              [name] => "L'Oreille cassée"
            )
          ]
        )
      ]

Données sans metadata
---------------------
Si vous effectuez une requête qui retourne des données qui ne correspondent à aucune metadata, que ce soit une colonne
d'aggrégation comme ``SUM(price)`` ou une colonne qui n'a pas été mappée comme ``my_extra_column`` l'hydrateur va créer un objet
``stdClass`` avec des propriétés correspondant à ces colonnes.

Cet objet ``stdClass`` est accessible dans la clée 0 du tableau retourné.

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\CollectionInterface;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getArticles()
        {
            $query = $this->getQuery('SELECT name, my_extra_column, SUM(price) as total FROM article');

            return $query->query();
        }

La collection retournée est composée de lignes structurées ainsi :

.. code-block:: php

    $row =
      [
        0 => stdClass(
          [total] => 43,
          [my_extra_column] => 'Bic'
        ),
        'article' => Article(
          [name] => "Stylo"
        )
      ]

Mapper des données sans metadata
--------------------------------
Dans le cas d'une colonne d'aggrégation, on peut souhaiter la mapper dans un objet.
Pour mapper la colonne ``nb_books`` dans mon model User via la méthode ``setNbBooks`` il suffit de faire :

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\CollectionInterface;
    use CCMBenchmark\Ting\Repository\Hydrator;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getUsersWithNbBooks()
        {
            $query = $this->getQuery('SELECT name, SUM(has_book.id) as nb_books FROM user INNER JOIN has_book ON (user.id = has_book.user_id)');
            $hydrator = new Hydrator();
            $hydrator->mapAliasTo('nb_books', 'user', 'setNbBooks')

            return $query->query($this->getCollection($hydrator));
        }

        // ...

La collection retournée est composée de lignes structurées ainsi :

.. code-block:: php

  $row =
    [
      'user' => User(
        [name] => "name",
        [nbBooks] => 3
      )
    ]

Déserializer des données sans metadata
--------------------------------------
Pour rappel l'action de déserializer consiste à transformer un type de base données dans un type PHP.
Par exemple si on récupère une date qui n'est pas dans des metadata, on peut vouloir transformer la date en objet
``Datetime``.

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\CollectionInterface;
    use CCMBenchmark\Ting\Repository\Hydrator;
    use CCMBenchmark\Ting\Serializer;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getArticlesWithFetchedDate()
        {
            $query = $this->getQuery('SELECT title, NOW() as fetchedDate FROM article');
            $hydrator = new Hydrator();
            $hydrator->unserializeAliasWith('fetchedDate', $services->get('SerializerFactory')->get(Serializer\Datetime::class))

            return $query->query($this->getCollection($hydrator));
        }

        // ...

La collection retournée est composée de lignes structurées ainsi :

.. code-block:: php

  $row =
    [
      0 => stdClass(
        [fetchedDate] => Datetime("2016-01-13 10:41:36")
      ),
      'article' => Article(
        [name] => "My Awesome Book",
      )
    ]

Composition d'objet
-------------------
On peut vouloir faire de la composition d'objet, injecter un objet dans un autre et ce sur plusieurs niveaux.
Pour mapper l'objet ``Country`` (qui a l'alias ``co``) dans mon model ``City`` (qui a l'alias ``cit``) via la méthode ``setCountry`` il suffit de faire :

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\CollectionInterface;
    use CCMBenchmark\Ting\Repository\Hydrator;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        /**
         * @return CollectionInterface
         */
        public function getCityWithCountry()
        {
            $query = $this->getQuery('SELECT cit.name, co.cou_name FROM city cit INNER JOIN t_country_cou co ON (c.cou_code = co.cou_code)');
            $hydrator = new Hydrator();
            $hydrator->mapObjectTo('co', 'cit', 'setCountry')

            return $query->query($this->getCollection($hydrator));
        }

        // ...

La collection retournée est composée de lignes structurées ainsi :

.. code-block:: php

  $row =
    [
      'cit' => City(
        [name] => "Palaiseau",
        [country] => Country(
          [name] = "France"
        )
      )
    ]
