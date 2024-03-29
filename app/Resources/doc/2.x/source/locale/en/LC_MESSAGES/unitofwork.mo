��          �                         6     M  j   Z  �   �  �   Q  �   �  m   �  �   D  N   �          &  c   /     �  �   �  w  @     �     �  
   �  M   �  y   7  r   �  �   $	  N   �	  s   
  E   �
  	   �
  	   �
  N   �
     -  y   E   Au sujet de l'unitOfWork Fonctionnement interne L'unitOfWork L'unitOfWork a pour rôle de tracker les changements des objets afin de les persister en base de données. L'unitOfWork initialise dans tous les objets "managed" une propriété tingUUID qui ne doit en aucun cas être altérée par l'utilisateur. Lors d'un traitement sur un grand nombre d'objets il est impératif de détacher les objets dont on a plus l'usage afin que l'unitOfWork libère de la mémoire : Lors de l'insertion d'une entité, si celle-ci à une propriété de configuré via les metadata en tant que autoincrement alors l'entité aura cette valeur d'initialisé avec l'autoincrement délivré par la base de données. On demande à l'unitOfWork de persister les données, que ça soit pour une mise à jour, ou une suppression. On empile généralement les ordres dans la file d'attente de l'unitOfWork puis on lui demande de traiter l'ensemble d'une traite. On peut aussi détacher tous les objets lorsque ceux-ci ont été persistés : Particularités Principe Que ça soit pour persister la mise à jour ou l'insertion d'une entité il faut utiliser pushSave. Remarques pour les batchs Un objet "managed" est un objet qui existe déjà en base et qui provoquera une requête UPDATE lorsque l'on demandera à ce qu'il soit persisté. Project-Id-Version: ting 1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-06-15 12:06+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 About the unitofwork Internal process UnitOfWork The UnitOfWork's role is to track object changes to persist it into database. The UnitOfWork initializes in all objects "managed" a property tingUUID which must not in any way be altered by the user. When processing a large number of items it is imperative to detach items that we don't use anymore to free memory: Upon insertion of an entity which has an autoincrement property (configured in metadata) the autoincrement issued by the database will be set in the entity. We ask the UnitOfWork to persist the data. It can be an update, or a deletion. The orders are generally stacked in the queue of UnitOfWork then you ask it to treat the whole in a single process. We are also able to detach all objects when they have been persisted: Specifity Principle Whether it's to persist updating or inserting an entity you must use pushSave. Notes for batch process  A "managed" object is an object that already exists in base and will cause UPDATE query when you ask it to be persisted. 