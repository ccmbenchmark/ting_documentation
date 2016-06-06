.. sectnum::
<<<<<<< HEAD
    :start: 3
=======
    :start: 1
>>>>>>> master

Les entités
===========


Au sujet des entités
--------------------
L'entité est un simple objet PHP sans aucun héritage nécessaire pour fonctionner avec Ting.

Les entités et l'UnitOfWork
---------------------------
Cependant pour que l':doc:`UnitofWork <unitofwork>` puisse persister l'objet il doit savoir ce qui a été modifié dans l'objet
depuis la dernière récupération en base de données afin de mettre à jour uniquement les colonnes nécessaires.

Votre entité doit donc implémenter le pattern Observateur pour notifier l':doc:`UnitofWork <unitofwork>` des changements.

Ting fourni le trait ``CCMBenchmark\Ting\Entity\NotifyProperty`` pour faciliter le travail.

.. code-block:: php

    use CCMBenchmark\Ting\Entity\NotifyProperty;

    class User implements NotifyPropertyInterface
    {
        use NotifyProperty;

        /**
         * @var string
         */
        private $name = '';

        /**
         * @param string $name
         */
        public function setIdContentIndexRoot($name)
        {
            $name = (string) $name;
            $this->propertyChanged('name', $this->name, $name);
            $this->name = $name;
        }

        // ...

A chaque fois qu'une propriété est changée on notifie l':doc:`UnitofWork <unitofwork>` via la méthode ``propertyChanged``.
