.. sectnum::
    :start: 3

L'unitOfWork
============

Au sujet de l'unitOfWork
------------------------
L'unitOfWork a pour rôle de tracker les changements des objets afin de les persister en base de données.

Fonctionnement interne
~~~~~~~~~~~~~~~~~~~~~~
L'unitOfWork initialise dans tous les objets "managed" une propriétée tingUUID qui ne doit en aucun cas être altérée
par l'utilisateur. Un objet "managed" est un objet qui existe déjà en base et qui provoquera une requête UPDATE
lorsque l'on demandera à ce qu'il soit persisté.

Remarques pour les batchs
-------------------------
Lors de traitement sur un grand nombre d'objet il est impératif de détacher les objets dont on a plus l'usage afin
que l'unitOfWork libère de la mémoire :

.. code-block:: php

    $unitOfWork->detach($entity);

On peut aussi détacher tous les objets lorsque ceux-ci ont été persistés :

.. code-block:: php

    $unitOfWork->detachAll();
