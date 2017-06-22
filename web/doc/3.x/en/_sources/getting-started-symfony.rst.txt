.. sectnum::
    :start: 2

Utilisation avec Symfony 2.8
============================

Initialisation
--------------
Nous supposerons dans ce guide que vous avez déjà installé `Symfony installer <http://symfony.com/download>`_, ainsi que `composer <https://getcomposer.org/>`_
Commencer par créer un nouveau projet : ``symfony new world_site 2.8``

Supprimer les dépendances à Doctrine inutiles
---------------------------------------------
Ting remplace Doctrine, il faut donc retirer les références à Doctrine devenues inutiles.

Dans le fichier ``app/AppKernel.php`` supprimer la ligne ``new Doctrine\Bundle\DoctrineBundle\DoctrineBundle()``

Dans ``app/config/config.yml`` supprimer tout le bloc de configuration Doctrine :

.. code-block:: yaml

    # Doctrine Configuration
    doctrine:
        dbal:
            driver:   pdo_mysql
            host:     "%database_host%"
            port:     "%database_port%"
            dbname:   "%database_name%"
            user:     "%database_user%"
            password: "%database_password%"
            charset:  UTF8
            # if using pdo_sqlite as your database driver:
            #   1. add the path in parameters.yml
            #     e.g. database_path: "%kernel.root_dir%/data/data.db3"
            #   2. Uncomment database_path in parameters.yml.dist
            #   3. Uncomment next line:
            #     path:     "%database_path%"

        orm:
            auto_generate_proxy_classes: "%kernel.debug%"
            naming_strategy: doctrine.orm.naming_strategy.underscore
            auto_mapping: true

Retirer les librairies Doctrine :

.. code-block:: text

    composer remove doctrine/orm
    composer remove doctrine/doctrine-bundle


Installer Ting
--------------
Ting a besoin de PHP 5.5, donc il faut modifier ``composer.json`` et remplacer :

.. code-block:: json

    {
        "platform": {
            "php": "5.3.9"
        }
    }

Par

.. code-block:: json

    {
        "platform": {
            "php": "5.5"
        }
    }

On peut maintenant installer Ting Bundle, qui permet d'utiliser Ting sur Symfony :
``composer require ccmbenchmark/ting_bundle``

Il faut ensuite register les bundles dans ``app/AppKernel.php`` :

.. code-block:: php

    new Doctrine\Bundle\DoctrineCacheBundle\DoctrineCacheBundle(),
    new CCMBenchmark\TingBundle\TingBundle(),


Initialisation de la base de données
------------------------------------

Pour ce guide on utilise `world database <http://downloads.mysql.com/docs/world.sql.gz>`_ qu'il faut
installer dans une base de données MySQL.
Vous pouvez vous référer au `guide officiel <https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html>`_ pour savoir comment procéder

Création des repository
-----------------------

La base de données ``world database`` à trois tables composées ainsi :

+------------------------+
| City                   |
+=============+==========+
| ID          | int(11)  |
+-------------+----------+
| Name        | char(35) |
+-------------+----------+
| CountryCode | char(3)  |
+-------------+----------+
| Population  | int(11)  |
+-------------+----------+

+-----------------------+
| Country               |
+============+==========+
| Code       | int(3)   |
+------------+----------+
| Name       | char(52) |
+------------+----------+
| Region     | char(26) |
+------------+----------+
| Population | int(11)  |
+------------+----------+

+---------------------------+
| CountryLanguage           |
+=============+=============+
| CountryCode | char(3)     |
+-------------+-------------+
| Language    | char(30)    |
+-------------+-------------+
| Percentage  | float(4, 1) |
+-------------+-------------+

.. note::

    Dans cet exemple nous ne prenons pas toutes les colonnes des tables pour alléger le guide

Création du repository City
---------------------------

.. code-block:: php
    :caption: src/AppBundle/Repository/City.php

    <?php

    namespace AppBundle\Repository;

    use CCMBenchmark\Ting\Exception;
    use CCMBenchmark\Ting\Repository\Metadata;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Serializer\SerializerFactoryInterface;

    class City extends Repository implements MetadataInitializer
    {

        /**
         * @param SerializerFactoryInterface $serializerFactory
         *
         * @return Metadata
         * @throws Exception
         */
        public static function initMetadata(SerializerFactoryInterface $serializerFactory, array $options = [])
        {
            $metadata = new Metadata($serializerFactory);
            $metadata->setEntity(\AppBundle\Entity\City::class);
            $metadata->setConnectionName($options['connection']);
            $metadata->setDatabase($options['database']);
            $metadata->setTable('City');

            $metadata
                ->addField([
                    'primary'       => true,
                    'autoincrement' => true,
                    'fieldName'     => 'id',
                    'columnName'    => 'ID',
                    'type'          => 'int'
                ])
                ->addField([
                    'fieldName'  => 'name',
                    'columnName' => 'Name',
                    'type'       => 'string'
                ])
                ->addField([
                    'fieldName'  => 'countryCode',
                    'columnName' => 'CountryCode',
                    'type'       => 'string'
                ])
                ->addField([
                    'fieldName'  => 'population',
                    'columnName' => 'Population',
                    'type'       => 'int'
                ]);

            return $metadata;
        }
    }


Création du repository Country
------------------------------

.. code-block:: php
    :caption: src/AppBundle/Repository/Country.php

    <?php

    namespace AppBundle\Repository;

    use CCMBenchmark\Ting\Exception;
    use CCMBenchmark\Ting\Repository\Metadata;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Serializer\SerializerFactoryInterface;

    class Country extends Repository implements MetadataInitializer
    {

        /**
         * @param SerializerFactoryInterface $serializerFactory
         *
         * @return Metadata
         * @throws Exception
         */
        public static function initMetadata(SerializerFactoryInterface $serializerFactory, array $options = [])
        {
            $metadata = new Metadata($serializerFactory);
            $metadata->setEntity(\AppBundle\Entity\Country::class);
            $metadata->setConnectionName($options['connection']);
            $metadata->setDatabase($options['database']);
            $metadata->setTable('Country');

            $metadata
                ->addField([
                    'primary'       => true,
                    'fieldName'     => 'code',
                    'columnName'    => 'Code',
                    'type'          => 'string'
                ])
                ->addField([
                    'fieldName'  => 'name',
                    'columnName' => 'Name',
                    'type'       => 'string'
                ])
                ->addField([
                    'fieldName'  => 'region',
                    'columnName' => 'Region',
                    'type'       => 'string'
                ])
                ->addField([
                    'fieldName'  => 'population',
                    'columnName' => 'Population',
                    'type'       => 'int'
                ]);

            return $metadata;
        }
    }

Création du repository CountryLanguage
--------------------------------------

.. code-block:: php
    :caption: src/AppBundle/Repository/CountryLanguage.php

    <?php

    namespace AppBundle\Repository;

    use CCMBenchmark\Ting\Exception;
    use CCMBenchmark\Ting\Repository\Metadata;
    use CCMBenchmark\Ting\Repository\MetadataInitializer;
    use CCMBenchmark\Ting\Repository\Repository;
    use CCMBenchmark\Ting\Serializer\SerializerFactoryInterface;

    class CountryLanguage extends Repository implements MetadataInitializer
    {

        /**
         * @param SerializerFactoryInterface $serializerFactory
         *
         * @return Metadata
         * @throws Exception
         */
        public static function initMetadata(SerializerFactoryInterface $serializerFactory, array $options = [])
        {
            $metadata = new Metadata($serializerFactory);
            $metadata->setEntity(\AppBundle\Entity\Country::class);
            $metadata->setConnectionName($options['connection']);
            $metadata->setDatabase($options['database']);
            $metadata->setTable('CountryLanguage');

            $metadata
                ->addField([
                    'fieldName'     => 'countryCode',
                    'columnName'    => 'CountryCode',
                    'type'          => 'string'
                ])
                ->addField([
                    'fieldName'  => 'language',
                    'columnName' => 'Language',
                    'type'       => 'string'
                ])
                ->addField([
                    'fieldName'  => 'percentage',
                    'columnName' => 'Percentage',
                    'type'       => 'double'
                ]);

            return $metadata;
        }
    }

Configuration de la connexion à la base de données
--------------------------------------------------

.. code-block:: yaml
    :caption: app/config/config.yml

    ting:
        connections:
            main:
                namespace: CCMBenchmark\Ting\Driver\Mysqli
                master:
                    host:     localhost
                    user:     root
                    password: ""
                    port:     3306

.. note::

    On nomme ici la connexion ``main`` on va l'utiliser ci-dessous lors de la configuration des repository.

Configuration pour indiquer l'emplacement des repository
--------------------------------------------------------

On configure l'emplacement des repository.

.. code-block:: yaml
    :caption: app/config/config.yml

    ting:
        repositories:
            World:
                namespace: AppBundle\Repository
                directory: "@AppBundle/Repository"
                options:
                    default:
                        connection: main
                        database: world

Création des entitées
---------------------

Lorsque l'on a créé les repository, on a indiqué avec quel entité il travaille : ``$metadata->setEntity('AppBundle\Entity\Country');``
On va donc maintenant créer une entité pour chaque repository.

.. code-block:: php
    :caption: src/AppBundle/Entity/City.php

    <?php

    namespace AppBundle\Entity;

    use CCMBenchmark\Ting\Entity\NotifyProperty;
    use CCMBenchmark\Ting\Entity\NotifyPropertyInterface;

    class City implements NotifyPropertyInterface
    {
        use NotifyProperty;

        private $id;
        private $name = '';
        private $countryCode = '';
        private $population = 0;

        /**
         * @param int $id
         */
        public function setId($id)
        {
            $this->propertyChanged('id', $this->id, (int) $id);
            $this->id = (int) $id;
        }

        /**
         * @return int|null
         */
        public function getId()
        {
            return $this->id;
        }

        /**
         * @param string $name
         */
        public function setName($name)
        {
            $this->propertyChanged('name', $this->name, (string) $name);
            $this->name = (string) $name;
        }

        /**
         * @return string
         */
        public function getName()
        {
            return $this->name;
        }

        /**
         * @param string $countryCode
         */
        public function setCountryCode($countryCode)
        {
            $this->propertyChanged('countryCode', $this->countryCode, (string) $countryCode);
            $this->countryCode = (string) $countryCode;
        }

        /**
         * @return string
         */
        public function getCountryCode()
        {
            return $this->countryCode;
        }

        /**
         * @param int $population
         */
        public function setPopulation($population)
        {
            $this->propertyChanged('population', $this->population, (int) $population);
            $this->population = (int) $population;
        }

        /**
         * @return int
         */
        public function getPopulation()
        {
            return $this->population;
        }
    }


.. code-block:: php
    :caption: src/AppBundle/Entity/Country.php

    <?php

    namespace AppBundle\Entity;

    use CCMBenchmark\Ting\Entity\NotifyProperty;
    use CCMBenchmark\Ting\Entity\NotifyPropertyInterface;

    class Country implements NotifyPropertyInterface
    {
        use NotifyProperty;

        private $code = '';
        private $name = '';
        private $region = '';
        private $population = 0;

        /**
         * @param string $code
         */
        public function setCode($code)
        {
            $this->propertyChanged('code', $this->code, (string) $code);
            $this->code = (string) $code;
        }

        /**
         * @return string
         */
        public function getCode()
        {
            return $this->code;
        }

        /**
         * @param string $name
         */
        public function setName($name)
        {
            $this->propertyChanged('name', $this->name, (string) $name);
            $this->name = (string) $name;
        }

        /**
         * @return string
         */
        public function getName()
        {
            return $this->name;
        }

        /**
         * @param string $region
         */
        public function setRegion($region)
        {
            $this->propertyChanged('region', $this->region, (string) $region);
            $this->region = (string) $region;
        }

        /**
         * @return string
         */
        public function getRegion()
        {
            return $this->region;
        }

        /**
         * @param int $population
         */
        public function setPopulation($population)
        {
            $this->propertyChanged('population', $this->population, (int) $population);
            $this->population = (int) $population;
        }

        /**
         * @return int
         */
        public function getPopulation()
        {
            return $this->population;
        }
    }


.. code-block:: php
    :caption: src/AppBundle/Entity/CountryLanguage.php

    <?php

    namespace AppBundle\Entity;

    use CCMBenchmark\Ting\Entity\NotifyProperty;
    use CCMBenchmark\Ting\Entity\NotifyPropertyInterface;

    class CountryLanguage implements NotifyPropertyInterface
    {
        use NotifyProperty;

        private $countryCode = '';
        private $language = '';
        private $percentage = 0.0;

        /**
         * @param string $countryCode
         */
        public function setCountryCode($countryCode)
        {
            $this->propertyChanged('countryCode', $this->countryCode, (string) $countryCode);
            $this->countryCode = (string) $countryCode;
        }

        /**
         * @return string
         */
        public function getCountryCode()
        {
            return $this->countryCode;
        }

        /**
         * @param string $language
         */
        public function setLanguage($language)
        {
            $this->propertyChanged('language', $this->language, (string) $language);
            $this->language = (string) $language;
        }

        /**
         * @return string
         */
        public function getLanguage()
        {
            return $this->language;
        }

        /**
         * @param double $percentage
         */
        public function setPercentage($percentage)
        {
            $this->propertyChanged('percentage', $this->percentage, (double) $percentage);
            $this->percentage = (double) $percentage;
        }

        /**
         * @return double
         */
        public function getPercentage()
        {
            return $this->percentage;
        }
    }

On a maintenant les repository et les entitées correspondantes, on va pouvoir faire des requêtes.

Vous pouvez maintenant utiliser Ting
------------------------------------

Dans ``DefaultController::indexAction`` :

.. code-block:: php

    $debug = new \CCMBenchmark\Ting\Util\Debug();

    $city = $this->get('ting')
        ->get(\AppBundle\Repository\City::class)->get(['name' => 'Paris']);

    $debug->dump($city);
