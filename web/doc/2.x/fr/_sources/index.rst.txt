.. ting documentation master file, created by
   sphinx-quickstart on Tue Jan 20 08:55:41 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Ting - Documentation
====================

* **Simple**: pas de magie : simplement des requêtes SQL
* **Rapide**: pas de magie donc pas d'overhead à ce sujet
* **Supporte** Mysql et PostgreSQL

**Pourquoi un autre datamapper pour PHP ?**

Il existe déjà des bon datamapper pour MySQL et PostgreSQL. Cependant les plus connus sont compliqués : courbe d'apprentissage longue, besoin de nouvelles connaissances pour requêter la base, ou d'ennuyants fichiers xml pour la décrire. Ting a été créé avec comme état d'esprit de rester simple

Ting n'est pas un ORM, parce qu'il ne supporte pas un système de relation entre les objets. Mais vous pouvez facilement construire des requêtes avec des jointures et récupérer tous les objets impliqués dans votre requête.


.. toctree::
   :maxdepth: 3

   query
   repository
   hydrator
   unitofwork
   cache
   composant-cache


