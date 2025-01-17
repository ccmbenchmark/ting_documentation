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
      'user' => User(3, "Sylvain"),
      'c' => Comment("Bonjour tout le monde")
    ]

Jointure avec aucune donnée
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Lorsque la jointure ne retourne aucune donnée, la clé 'c' aura pour valeur null

Données sans metadata
~~~~~~~~~~~~~~~~~~~~~
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
      'article' => Article("Stylo"),
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

Dans ce cas $user contient directement un objet User.
