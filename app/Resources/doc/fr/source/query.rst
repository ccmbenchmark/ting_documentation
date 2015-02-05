.. sectnum::

.. contents:: Query
  :depth: 1

Les requêtes
=====================

Effectuer une requête de lecture
--------------------------------


L'objet Query
~~~~~~~~~~~~~
Une requête s'effectue en récupérant l'objet CCMBenchmark\Ting\Query\Query
via le Repository.

Pour se faire il suff-it d'appeler :

.. code-block:: php

  $query = $this->getQuery('SELECT ...');


Les paramètres
~~~~~~~~~~~~~~
Pour mettre des paramètres dynamique dans la requête il faut utiliser la méthode
"setParams" qui prend un argument un tableau associatif :

.. code-block:: php

  $query = $this->getQuery('SELECT id, name FROM user WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);


Exécuter la requête
~~~~~~~~~~~~~~~~~~~

Pour retourner les données de lecture il faut utiliser la méthode "query" :

.. code-block:: php

  $query = $this->getQuery('SELECT id, name FROM user WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);
  $collection = $query->query();


Récupérer les résultats
~~~~~~~~~~~~~~~~~~~~~~~

La méthode "query" retourne un objet CCMBenchmark\Ting\Repository\Collection
Cet objet est un iterator, vous pouvez donc récupérer les résultats de cette façon :

.. code-block:: php

  $query = $this->getQuery('SELECT id, name FROM user WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);
  $collection = $query->query();
  foreach ($collection as $data) {
      print_r($data);
  }


Explication sur le format retourné
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les données retournée par l'objet Collection sont auparavant hydrater par l'objet
CCMBenchmark\Ting\Repository\Hydrator il retourne toujours un tableau associatif, où la clé est le nom de la table (ou l'alias) et la valeur l'objet dans laquelle la table est mappée, ou un stdClass, pour l'exemple précédent le print_r va donc afficher :
['user' => User# ]

C'est très utile lorsque vous récupérer plusieurs types d'objets différent en même temps (via une jointure), mais pas très pratique lorsque vous récupérez seulement un même type d'objet (comme dans l'exemple précédent)


Avoir un format de retour plus simple pour des requêtes sans jointures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Donc vous pouvez utiliser un autre hydrateur qui sert justement à retourner qu'un type d'objet il s'agit de CCMBenchmark\Ting\Repository\HydratorSingleObject

L'hydrateur est lié à la collection, il s'injecte donc dans la collection.
Il faut donc récupérer une collection et lui injecter l'hydrateur de notre choix, la méthode "getCollection" d'un Repository permet de faire les deux :

.. code-block:: php

  $this->getCollection(new CCMBenchmark\Ting\Repository\HydratorSingleObject())

Il suffit ensuite de demander à l'objet Query d'utiliser cette collection, ça se fait dans la méthode "query", le code final donnera donc :

.. code-block:: php

  $query = $this->getQuery('SELECT id, name FROM user WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);
  $collection = $query->query($this->getCollection(new CCMBenchmark\Ting\Repository\HydratorSingleObject()));
  foreach ($collection as $data) {
      print_r($data);
  }

Et affichera :
User


Compter les éléments d'une collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Il faut savoir qu'une Collection est "countable", vous pouvez donc savoir combien elle a d'éléments comme vous le faites pour un tableau PHP : count($collection);

Une requête de lecture s'effectuera par défaut sur un des slaves configurés (si des slaves ont été configurés), si vous avez besoin
d'effectuer votre requête sur le master, alors il faut appeler la méthode "selectMaster" :

.. code-block:: php

  $query = $this->getQuery('SELECT ...');
  $query->selectMaster(true);

Erreur sur une requête
~~~~~~~~~~~~~~~~~~~~~~

Si la requête exécuté ne se termine pas correctement, une exception du type CCMBenchmark\Ting\Driver\QueryException sera levée


Effectuer une requête d'écriture
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La logique reste la même que pour une requête de lecture, à quelques différences près.
Il faut appeler la méthode "execute" sur l'objet CCMBenchmark\Ting\Query\Query
