.. sectnum::

.. contents:: Repository
:depth: 1

Repository
==========

Au sujet du Repository
----------------------
Le Repository va faire le lien entre votre objet entité et votre base de données, par l'intermédiaire de l'objet Query.
Il est aussi responsable d'initialiser les Metadata qui concerne votre entité afin de savoir comment mapper
votre objet en base de données.

Création des Metadata
---------------------
Comme un exemple est plus parlant qu'un long discours :

.. code-block:: php

    public static function initMetadata(SerializerFactoryInterface $serializerFactory, array $options = [])
    {
        $metadata = new Metadata($serializerFactory);

        $metadata->setEntity('sample\src\model\City');
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

Quelques précisions :
    - fieldName correspond au nom de la propriété de votre entité
    - columnName au nom de la colonne dans votre base de données
    - type au type de votre variable avec comme valeurs possibles :
        - int
        - string
        - bool
        - datetime
        - json

Le type bool, datetime et json sont un peu particulier, car il s'agit de types considérés complexes et qui acceptent
donc d'être sérializé/désérializé via des options :

.. code-block:: php

    addField([
        'fieldName'          => 'tags',
        'columnName'         => 'tags_name',
        'type'               => 'json',
        'serializer_options' => [
            'unserialize' => ['assoc' => true]
        ]
    ]);

Je vous invite à regarder le code source de chaque Serializer pour voir les configurations possible.

Vous pouvez injecter votre propre serializer :

.. code-block:: php

    addField([
        'fieldName'  => 'tags',
        'columnName' => 'tags_name',
        'type'       => 'json',
        'serializer' => '\Bouh\Awesome\Serializer'
    ]);

Le type bool est considéré comme un type complexe, car la façon de le stocker en base est différent selon les sgbd :
    - \CCMBenchmark\Ting\Driver\Pgsql\Serializer\Bool'
    - \CCMBenchmark\Ting\Driver\Mysqli\Serializer\Bool'
