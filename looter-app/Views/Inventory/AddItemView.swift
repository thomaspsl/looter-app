import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss

    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    @State private var game: Game = Game.emptyGame
    @State private var quantity: Int = 1
    @State private var type: ItemType = .magic
    @State private var attack = false
    @State private var attackStrength: Int = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rareté", selection: $rarity) {
                        ForEach(Rarity.allCases) { rarity in
                            Text(rarity.rawValue.capitalized).tag(rarity)
                        }
                    }
                }
                Section {
                    Picker("Jeu", selection: $game) {
                        Text("Non spécifié").tag(Game.emptyGame)
                        ForEach(availableGames) { game in
                            Text(game.name.capitalized).tag(game)
                        }
                    }
                    Stepper("Combien : \(quantity)", value: $quantity, in: 1...20)
                }
                Section {
                    HStack {
                        Text("Type")
                        Spacer()
                        Text(type.rawValue)
                    }
                    Picker("Type", selection: $type) {
                        ForEach(ItemType.allCases, id: \.self) { type in
                            Text(type.rawValue.capitalized).tag(type)
                        }
                    }
                    .pickerStyle(.palette)
                }
                Section {
                    Toggle("Item d'attaque ?", isOn: $attack)
                    
                    if(attack)
                    {
                        Stepper("Force d'attaque : \(attackStrength)", value: $attackStrength, in: 0...20)
                    }
                }
                Button(action: {
                    let item = LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attackStrength: attackStrength, game: game)
                    inventory.addItem(item: item)
                    dismiss()
                }, label: {
                    Text("Ajouter l'objet")
                })
            }
            .navigationBarTitle(Text("Ajouter un loot"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {dismiss()}) {
                Text("Fermer")
            })
        }
    }
}

#Preview {
    AddItemView()
}
