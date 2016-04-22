.. sectnum::
    :start: 2

Le Repository
=============


Au sujet du Repository
----------------------
Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet Query.

Il est aussi responsable d'initialiser les Metadata qui concernent votre entité afin de savoir comment mapper
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

            $metadata->addField(array(
                'primary'       => true,
                'autoincrement' => true,
                'fieldName'     => 'id',
                'columnName'    => 'cit_id',
                'type'          => 'int'
            ));

            $metadata->addField(array(
                'fieldName'  => 'name',
                'columnName' => 'cit_name',
                'type'       => 'string'
            ));

            return $metadata
        }

Quelques précisions :
    - fieldName correspond au nom de la propriété de votre entité
    - columnName correspond au nom de la colonne dans votre base de données
    - type correspond au type de votre variable avec comme valeur possibles :
        - int
        - double
        - string
        - bool
        - datetime
        - json

Le type bool, datetime et json sont un peu particuliers, car il s'agit de types considérés complexes et qui acceptent
donc d'être sérializés/désérializés via des options :

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

Vous pouvez injecter votre propre serializer :

.. code-block:: php

    addField([
        'fieldName'  => 'tags',
        'columnName' => 'tags_name',
        'type'       => 'json',
        'serializer' => Bouh\Awesome\Serializer::class
    ]);

Le type booléen est considéré comme un type complexe, car la façon de le stocker en base est différent selon chaque sgbd :
    - CCMBenchmark\\Ting\\Driver\\Pgsql\\Serializer\\Boolean
    - CCMBenchmark\\Ting\\Driver\\Mysqli\\Serializer\\Boolean

QueryBuilder
------------

On peut avoir besoin de chaîner des requêtes, un QueryBuilder est adapté pour ce cas.
Ting le fourni via `aura/sqlquery`.

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
