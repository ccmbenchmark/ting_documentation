.. sectnum::
    :start: 3

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

  $query = $this->getQuery('SELECT id, name, c.text FROM user LEFT JOIN comment c ON (c.user_id = user.id) WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);
  $collection = $query->query();
  foreach ($collection as $data) {
    // ...
  }

$data contiendra comme structure :

.. code-block:: php

  $data =
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

Données sans metadata
---------------------
Si vous effectuez une requête qui retourne des données qui ne correspondent à aucune metadata, que ce soit une colonne
d'aggrégation comme SUM(price) ou une colonne qui n'a pas été mappée comme my_extra_column l'hydrateur va créer un objet
stdClass avec des propriétés correspondant à ces colonnes.

Cet objet stdClass est accessible dans la clée 0 du tableau retourné.

.. code-block:: php

  $query = $this->getQuery('SELECT name, my_extra_column, SUM(price) as total FROM article');
  $collection = $query->query();
  foreach ($collection as $data) {
    // ...
  }

$data contiendra comme structure :

.. code-block:: php

  $data =
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
Dans le cas où on à une colonne d'aggrégation on peut avoir envie de la mapper dans un objet.
Pour mapper la colonne "nb_books" dans mon model User via la méthode "setNbBooks" il suffit de faire :

.. code-block:: php

  $query = $this->getQuery('SELECT name, SUM(has_book.id) as nb_books FROM user INNER JOIN has_book ON (user.id = has_book.user_id)');
  $hydrator = $services->get('Hydrator');
  $hydrator->mapAliasTo('nb_books', 'user', 'setNbBooks')
  $collection = $query->query(new Collection($hydrator));
  foreach ($collection as $data) {
    // ...
  }

$data contiendra comme structure :

.. code-block:: php

  $data =
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
Datetime.

.. code-block:: php

  $query = $this->getQuery('SELECT title, NOW() as fetchedDate FROM article');
  $hydrator = $services->get('Hydrator');
  $hydrator->unserializeAliasWith('fetchedDate', $services->get('SerializerFactory')->get('CCMBenchmark\Ting\Serializer\Datetime'))
  $collection = $query->query(new Collection($hydrator));
  foreach ($collection as $data) {
    // ...
  }

$data contiendra comme structure :

.. code-block:: php

  $data =
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
Pour mapper l'objet Country (qui a l'alias "co") dans mon model City (qui a l'alias "cit") via la méthode "setCountry" il suffit de faire :

.. code-block:: php

  $query = $this->getQuery('SELECT cit.name, co.cou_name FROM city cit INNER JOIN t_country_cou co ON (c.cou_code = co.cou_code)');
  $hydrator = $services->get('Hydrator');
  $hydrator->mapObjectTo('co', 'c', 'setCountry')
  $collection = $query->query(new Collection($hydrator));
  foreach ($collection as $data) {
    // ...
  }

$data contiendra comme structure :

.. code-block:: php

  $data =
    [
      'cit' => City(
        [name] => "Palaiseau",
        [country] => Country(
          [name] = "France"
        )
      )
    ]

.. _l-hydrateur-pour-un-seul-objet:

L'hydrateur pour un seul objet
------------------------------
L'hydrateur par défaut est optimisé pour retourner plusieurs objets, lorsque l'on fait une requête qui n'a pour but que de retourner
un objet, il n'est pas des plus appropriés.

Vous pouvez injecter l'HydratorSingleObject qui conviendra mieux à votre besoin.

.. code-block:: php

  $query = $this->getQuery('SELECT id, name, c.text FROM user WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);
  $collection = $query->query($this->getCollection(new HydratorSingleObject()));
  foreach ($collection as $user) {
    // ...
  }

Dans ce cas $user est un objet User.
