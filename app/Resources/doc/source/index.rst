.. ting documentation master file, created by
   sphinx-quickstart on Tue Jan 20 08:55:41 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Ting - Documentation
====================

* **Simple**: no magic inside : it's basically SQL queries
* **Fast**: with no magic comes no overhead
* **Supports** Mysql and PostgreSQL

**Why another datamapper for PHP?**

Some great datamapper frameworks for MySQL and PostgreSQL already exists. However the most known tools are just too complicated: hard learning curve, requiring new skills to query databases or boring xml files to describe the database. Ting has been created with the simplicity as state of mind.

Ting is not an ORM, because it doesn't fully support relations between objects. But you can easily build join queries and retrieve every objects involved in your query.


.. toctree::
   :maxdepth: 3

   query
   repository
   hydrator
   unitofwork


