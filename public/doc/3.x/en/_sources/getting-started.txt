.. sectnum::
    :start: 1

Utilisation sans framework
==========================

Initialisation
--------------

Nous supposerons dans ce guide que vous avez déjà installé `composer <https://getcomposer.org/>`_.
Les sources pour cet example se situerons dans ``src/VendorName/ApplicationName`` il faut donc penser à bien ajouter
ce chemin dans l'autoload du composer.json :

.. code-block:: json

    {
        "autoload": {
            "psr-4": { "VendorName\\ApplicationName\\": "src/VendorName/ApplicationName"}
        }
    }

Installer Ting
--------------

Il suffit d'ajouter en tant que dépendance Ting à notre projet :
``composer require ccmbenchmark/ting``

Initialisation de la base de données
------------------------------------

Pour ce guide on utilise `world database <http://downloads.mysql.com/docs/world.sql.gz>`_ qu'il faut
installer dans une base de données MySQL.
Vous pouvez vous référer au `guide officiel <https://dev.mysql.com/doc/world-setup/en/world-setup-installation.html>`_ pour savoir comment procéder.

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
    :caption: src/VendorName/ApplicationName/Repository/City.php

    <?php

    namespace VendorName\ApplicationName\Repository;

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
            $metadata->setEntity(\VendorName\ApplicationName\Entity\City::class);
            $metadata->setConnectionName('main');
            $metadata->setDatabase('world');
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
    :caption: src/VendorName/ApplicationName/Repository/Country.php

    <?php

    namespace VendorName\ApplicationName\Repository;

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
            $metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);
            $metadata->setConnectionName('main');
            $metadata->setDatabase('world');
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
    :caption: src/VendorName/ApplicationName/Repository/CountryLanguage.php

    <?php

    namespace VendorName\ApplicationName\Repository;

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
            $metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);
            $metadata->setConnectionName('main');
            $metadata->setDatabase('world');
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

.. code-block:: php
    :caption: src/VendorName/ApplicationName/bootstrap.php

    <?php

    namespace VendorName\ApplicationName;

    require __DIR__ . '/../../../vendor/autoload.php';

    $services = new \CCMBenchmark\Ting\Services();
    $services->get('ConnectionPool')->setConfig([
        'main' => [
            'namespace' => '\CCMBenchmark\Ting\Driver\Mysqli',
            'master' => [
                'host'      => 'localhost',
                'user'      => 'root',
                'password'  => '',
                'port'      => 3306,
            ]
        ]
    ]);

Configuration pour indiquer l'emplacement des repository
--------------------------------------------------------

On configure l'emplacement des repository en complétant le fichier ``bootstrap.php``

.. code-block:: php
    :caption: src/VendorName/ApplicationName/bootstrap.php

    <?php

    $services
        ->get('MetadataRepository')
        ->batchLoadMetadata('VendorName\ApplicationName\Repository', __DIR__ . '/Repository/*.php');

Création des entitées
---------------------

Lorsque l'on a créé les repository, on a indiqué avec quelle entité il travaille : ``$metadata->setEntity(\VendorName\ApplicationName\Entity\Country::class);``
On va donc maintenant créer une entité pour chaque repository.

.. code-block:: php
    :caption: src/VendorName/ApplicationName/Entity/City.php

    <?php

    namespace VendorName\ApplicationName\Entity;

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
    :caption: src/VendorName/ApplicationName/Entity/Country.php

    <?php

    namespace VendorName\ApplicationName\Entity;

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
    :caption: src/VendorName/ApplicationName/Entity/CountryLanguage.php

    <?php

    namespace VendorName\ApplicationName\Entity;

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

.. code-block:: php
    :caption: src/VendorName/ApplicationName/bootstrap.php

    $debug = new \CCMBenchmark\Ting\Util\Debug();

    $cityRepository = $services->get('RepositoryFactory')
        ->get(\VendorName\ApplicationName\Repository\City::class);

    $debug->dump($cityRepository->get(3));
