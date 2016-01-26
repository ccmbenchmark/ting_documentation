.. sectnum::
    :start: 6

Le composant cache
==================

Configuration
-------------
Il faut injecter la configuration via la méthode setConfig
Elle est structurée de la façon suivante:

.. code-block:: php

  $cache->setConfig([
    'servers' => [
        ['host' => '127.0.0.1', 'port' => 11211]
    ],
    'options' => [
        // Cache driver specific options
    ],
    'persistent_id' => 'ting.test' // Memcache persistent id
  ]);


Sauvegarder dans le cache
-------------------------
.. code-block:: php

  $cache->store($key, $value, $ttl);

Sauvegarder dans le cache plusieurs valeurs
-------------------------------------------
.. code-block:: php

  $cache->storeMulti($associativeArray, $ttl);

Effacer une valeur du cache
---------------------------
.. code-block:: php

  $cache->delete($key);

Effacer plusieurs valeurs du cache
----------------------------------
.. code-block:: php

  $cache->deleteMulti($keys);

Remplacer une valeur dans le cache
----------------------------------
.. code-block:: php

  $cache->replace($key, $value, $ttl);

Sauvegarder de manière infinie
------------------------------
Il suffit de mettre un ttl de 0 pour sauvegarder de manière infinie
