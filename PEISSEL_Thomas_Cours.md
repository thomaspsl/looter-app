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

! Mémo !
State :  (typage variable primitif) Modifie la valeur et réactualise la vue pour les types primitifs
StateObject :  (typage object) Same like ObservableObject mais moins durable dans la mémoire parent/enfant

ObservableObject : (typage de class) Modifie la valeur et réactualise la vue pour des object complexes

Binding : (typage variable primitif) parent/enfant composant parent avec @state et composant enfant avec @binding par référence
Published : (typage au sein de ObservableObject) Item unique modifiable d'un observableObject

Environment : Récupérer une variable d'environnement
EnvironmentObject : Pinia / Redux

*Cliquez sur le bouton “Ajouter”, que se passe-t-il ? Pourquoi cela ne marche pas ?*
et dans un même temps
*Utiliser @StateObject, ObservableObject et @Published pour que l’ajout d’un item fonctionne.*

Quand je clique sur le bouton ajouter, il ne se passe rien.
State ne modifie que les types primitifs, pour pouvoir modifier inventory il faut utiliser StateObject
Il faut donc que Inventory soit ObservableObject et faire en sorte que la liste soit Published pour en termes de réactivité ne refresh que la liste l'objet inventory

### Exercice 2

*Pourquoi utiliser @StateObject plutôt que @ObservedObject ou @State ?*
Parce qu'en termes de mémoire Inventory n'est utilisé que sur cette page, si nous l'utiliserions sur plusieurs vues différentes, il faudrait utiliser @ObservedObject si Object (ou @State si primitifs)

### Exercice 3

J'ai mis le store d'environnement en haut de l'application pour pouvoir l'appeler dans ContentView et AddItemView

```
ContentView()
    .environmentObject(inventory)
```

Puis : 
```
@EnvironmentObject var inventory: Inventory
```

### Exercice 4

```
@Environment(\.dismiss) var dismiss
```

Structure -> Constructeur implicite

## 5-Un meilleur inventaire

### Exercice 2

Il y a une erreur qui parle d'Identifiable parce que les loots n'ont pas d'identifiant (UUID). Pour pouvoir boucler dessus il faut en rajouter un.

## 7-Créer une animation

### Exercice 3 (Bonus)

Pour voir mon animation il faut rester cliquer sur l'icon et faire se balader la souris autour de la card de couleur. C'est une animation qui ressemble à celle pour visualiser des cartes.
