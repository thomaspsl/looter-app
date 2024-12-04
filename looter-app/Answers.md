# Cours Swift

## 2-App-Basics

### Exercice 1

*Essayez de lancer l’application (ou de la visualiser dans la preview), XCode devrait vous afficher une erreur. Que manque-t-il ? Et pourquoi ?*

Dans le code il manque une partie concernant l'id dans le foreach.
Cette sécurité doit être présente pour que chaque object ait un id.

```
ForEach(loot, id: \.self) { item in
    Text(item)
}
```

### Exercice 2

*Expliquez le changement que j’ai effectué par rapport à l’exemple précédent.*

On a juste ajouté une fonction qui insère au tableau loot, un nouvel item et on a ajouté un bouton qui appel cette fonction.

*Pourquoi utiliser un ForEach ? Quel est son rôle ? Et pourquoi séparer le bouton du ForEach ?*

Le but du foreach est de pouvoir boucler sur les données d'un tableau.
Le button a été séparé du foreach puisqu'au sinon il y aurait eu autant de button que de ligne dans le tableau. 

### Exercice 3

*Testez ce code, fonctionne-t-il ? Pourquoi ?*

Le nom de la fonction n'est pas bon dans l'appel.

```
addLoot() -> addItem()
```

*Expliquez pourquoi maintenant cela fonctionne ?*

Il faut ajouter @State la variable loot pour qu'elle devienne mutable.
La vue qui utilise le state a été automatiquement actualisé.

```
@State var loot = ...
```

## 4-Ajout-Item

### Exercice 1

*Cliquez sur le bouton “Ajouter”, que se passe-t-il ? Pourquoi celane marche pas ?*

Parce que l'inventory n'est pas Statable. Les 
