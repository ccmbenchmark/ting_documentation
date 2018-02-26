.. sectnum::
    :start: 7

L'unitOfWork
============

Au sujet de l'unitOfWork
------------------------
L'unitOfWork a pour rôle de tracker les changements des objets afin de les persister en base de données.

Fonctionnement interne
~~~~~~~~~~~~~~~~~~~~~~
L'unitOfWork initialise dans tous les objets "managed" une propriété ``tingUUID`` qui ne doit en aucun cas être altérée
par l'utilisateur.

Un objet "managed" est un objet qui existe déjà en base et qui provoquera une requête UPDATE lorsque l'on demandera à ce qu'il soit persisté.

Principe
--------
On demande à l'unitOfWork de persister les données, que ça soit pour une mise à jour, ou une suppression.

On empile généralement les ordres dans la file d'attente de l'unitOfWork puis on lui demande de traiter l'ensemble d'une
traite.

.. code-block:: php

    $unitOfWork->pushSave($user1);
    $unitOfWork->pushSave($user2);
    $unitOfWork->pushDelete($user3);
    $unitOfWork->process();

Particularités
~~~~~~~~~~~~~~
Que ça soit pour persister la mise à jour ou l'insertion d'une entité il faut utiliser ``pushSave``.

Lors de l'insertion d'une entité, si celle-ci à une propriété de configuré via les metadata en tant que autoincrement
alors l'entité aura cette valeur d'initialisé avec l'autoincrement délivré par la base de données.

Remarques pour les batchs
-------------------------
Lors d'un traitement sur un grand nombre d'objets il est impératif de détacher les objets dont on a plus l'usage afin
que l'unitOfWork libère de la mémoire :

.. code-block:: php

    $unitOfWork->detach($entity);

On peut aussi détacher tous les objets lorsque ceux-ci ont été persistés :

.. code-block:: php

    $unitOfWork->detachAll();
