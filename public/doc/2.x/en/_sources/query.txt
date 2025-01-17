.. sectnum::
    :start: 1

Les requêtes
============

Effectuer une requête de lecture
--------------------------------


L'objet Query
~~~~~~~~~~~~~
Une requête s'effectue en récupérant l'objet CCMBenchmark\\Ting\\Query\\Query
via le :doc:`Repository <repository>`.

Pour ce faire il suffit d'appeler :

.. code-block:: php

  $query = $this->getQuery('SELECT ...');


Les paramètres
~~~~~~~~~~~~~~
Pour mettre des paramètres dynamiques dans la requête il faut utiliser la méthode
"setParams" qui prend en argument un tableau associatif :

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

La méthode "query" retourne un objet CCMBenchmark\\Ting\\Repository\\Collection.
Cet objet est un Iterator, vous pouvez donc récupérer les résultats de cette façon :

.. code-block:: php

  $query = $this->getQuery('SELECT id, name FROM user WHERE name = :name');
  $query->setParams(['name' => 'Sylvain']);
  $collection = $query->query();
  foreach ($collection as $data) {
      print_r($data);
  }


Explication sur le format retourné
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Voir la documentation concernant les :doc:`hydrateurs <hydrator>`

Format de retour simplifié pour des requêtes sans jointures
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Voir la documentation concernant l':ref:`hydration pour un seul objet <l-hydrateur-pour-un-seul-objet>`

Compter les éléments d'une collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Il faut savoir qu'une Collection implémente l'interface standard Countable. Vous pouvez donc savoir combien elle a d'éléments comme vous le faites pour un tableau PHP : count($collection);


Exécuter une requête sur le master
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Une requête de lecture s'effectuera par défaut sur un des slaves configurés (si des slaves ont été configurés), si vous avez besoin
d'effectuer votre requête sur le master, alors il faut appeler la méthode "selectMaster" :

.. code-block:: php

  $query = $this->getQuery('SELECT ...');
  $query->selectMaster(true);


Erreur sur une requête
~~~~~~~~~~~~~~~~~~~~~~

Si la requête exécuté ne se termine pas correctement, une exception du type CCMBenchmark\\Ting\\Driver\\QueryException sera levée


Effectuer une requête d'écriture
--------------------------------

La logique reste la même que pour une requête de lecture, à quelques différences près.
Il faut appeler la méthode "execute" sur l'objet CCMBenchmark\\Ting\\Query\\Query

.. code-block:: php

  $query = $this->getQuery('INSERT INTO ...');
  $query->execute();
