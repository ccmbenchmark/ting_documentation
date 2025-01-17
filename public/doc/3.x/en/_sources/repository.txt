.. sectnum::
    :start: 5

Le Repository
=============


Au sujet du Repository
----------------------
Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet ``Query``.

Il est aussi responsable d'initialiser les ``Metadata`` qui concernent votre entité afin de savoir comment mapper
votre objet en base de données.


Création des Metadata
---------------------
Comme un exemple est plus parlant qu'un long discours :

.. code-block:: php

    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Serializer\SerializerFactoryInterface;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;

    class SampleRepository extends Repository implements MetadataInitializer
    {
        public static function initMetadata(SerializerFactoryInterface $serializerFactory, array $options = [])
        {
            $metadata = new Metadata($serializerFactory);

            $metadata->setEntity(Sample\Model\City::class);
            $metadata->setConnectionName('main');
            $metadata->setDatabase('world');
            $metadata->setTable('t_city_cit');

            $metadata
                ->addField([
                    'primary'       => true,
                    'autoincrement' => true,
                    'fieldName'     => 'id',
                    'columnName'    => 'cit_id',
                    'type'          => 'int'
                ])
                ->addField([
                    'fieldName'  => 'name',
                    'columnName' => 'cit_name',
                    'type'       => 'string'
                ]);

            return $metadata
        }

Quelques précisions :
    - fieldName correspond au nom de la propriété de votre entité
    - columnName correspond au nom de la colonne dans votre base de données
    - type correspond au type de votre variable avec comme valeur possibles :
        - ``int``
        - ``double``
        - ``string``
        - ``bool``
        - ``datetime``
        - ``json``

Les types ``bool``, ``datetime`` et ``json`` sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent
donc d'être sérializés/désérializés via les options du serializer


Le Serializer
-------------

Au sujet du serializer
~~~~~~~~~~~~~~~~~~~~~~
La serialisation est l'opération qui permet de passer d'une donnée PHP vers une donnée au format SGBD.
La déserialisation est l'opération inverse.

Le serializer permet de gérer les types complexes tels que les types suivants ``bool``, ``datetime`` et ``json``.

Le type booléen est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque SGBD :
    - ``CCMBenchmark\Ting\Driver\Pgsql\Serializer\Boolean``
    - ``CCMBenchmark\Ting\Driver\Mysqli\Serializer\Boolean``

Le type datetime est considéré comme complexe car il permet de transformer un objet DateTime dans un format compréhensible pour le SGBD.

Le type json est complexe car il permet de transformer un tableau de données en chaîne de caractère compréhensible par le SGBD.


Configuration du serializer
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Le serializer peut être configurer via la clé ``serializer_options``

.. code-block:: php

    addField([
        'fieldName'          => 'tags',
        'columnName'         => 'tags_name',
        'type'               => 'json',
        'serializer_options' => [
            'unserialize' => ['assoc' => true]
        ]
    ]);

Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possibles.

Ecrire un serializer
~~~~~~~~~~~~~~~~~~~~~

Vous pouvez écrire vos propres serializers et les injecter dans la définition du repository via la clé ``serializer``.

Le serializer doit implémenter l'interface ``CCMBenchmark\Ting\Serializer\SerializeInterface`` et/ou ``CCMBenchmark\Ting\Serializer\UnserializeInterface``.
Si l'on souhaite implémenter les 2 interfaces, on préfèrera utiliser ``CCMBenchmark\Ting\Serializer\SerializerInterface``


L'interface ``CCMBenchmark\Ting\Serializer\SerializeInterface`` permet de transformer une valeur en donnée stockable en base de donnée.
L'interface ``CCMBenchmark\Ting\Serializer\UnserializeInterface`` permet de faire l'opération inverse.


.. code-block:: php

    addField([
        'fieldName'  => 'tags',
        'columnName' => 'tags_name',
        'type'       => 'json',
        'serializer' => Bouh\Awesome\Serializer::class
    ]);


QueryBuilder
------------

On peut avoir besoin de chaîner des requêtes, un QueryBuilder est adapté pour ce cas.
Ting le fourni via ``aura/sqlquery``.

.. code-block:: php

    $repository->getQueryBuilder(Repository::QUERY_SELECT);

ou

.. code-block:: php

    $repository->getQueryBuilder(Repository::QUERY_INSERT);

ou

.. code-block:: php

    $repository->getQueryBuilder(Repository::QUERY_UPDATE);

ou

.. code-block:: php

    $repository->getQueryBuilder(Repository::QUERY_DELETE);

Documentation disponible sur https://github.com/auraphp/Aura.SqlQuery

Requêtes
--------

Le Repository fourni plusieurs méthodes afin de faciliter les requêtes simples.

Trouver un objet par clé primaire
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: php

    $repository->get(['id' => 3])

Tous les objets
~~~~~~~~~~~~~~~

.. code-block:: php

    $repository->getAll()

Un objet d'après une ou plusieurs propriété(s) du modèle
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: php

    $repository->getOneBy(['propertyName' => 'Sylvain']);

Une collection d'objet d'après une ou plusieurs propriété(s) du modèle
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: php

    $repository->getBy(['propertyName' => 'Sylvain']);
