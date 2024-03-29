��    	      d               �   ~   �      ,  �   B  ^   7     �     �  [   �  {     w  �  t        �  �   �  6   H          �  P   �  n   �   A chaque fois qu'une propriété est changée on notifie l':doc:`UnitofWork <unitofwork>` via la méthode ``propertyChanged``. Au sujet des entités Cependant pour que l':doc:`UnitofWork <unitofwork>` puisse persister l'objet il doit savoir ce qui a été modifié dans l'objet depuis la dernière récupération en base de données afin de mettre à jour uniquement les colonnes nécessaires. L'entité est un simple objet PHP sans aucun héritage nécessaire pour fonctionner avec Ting. Les entités Les entités et l'UnitOfWork Ting fourni le trait ``CCMBenchmark\Ting\Entity\NotifyProperty`` pour faciliter le travail. Votre entité doit donc implémenter le pattern Observateur pour notifier l':doc:`UnitofWork <unitofwork>` des changements. Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-04-22 10:54+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 Each time a property is changed we notify the :doc:`UnitofWork <unitofwork>` through the method ``propertyChanged``. About the entities However :doc:`UnitofWork <unitofwork>` needs to know which data have been changed in the object to  persist. Then :doc:`UnitofWork <unitofwork>` can update the columns needed. The entity is a pure PHP object without any heritance. Entities Entities and UnitOfWork Ting provides the trait ``CCMBenchmark\Ting\Entity\NotifyProperty`` to help you. Your entity need to implement the pattern Observer to notify the :doc:`UnitofWork <unitofwork>` about changes. 