import SwiftUI

enum Rarity: String, CaseIterable, Identifiable {
    case common = "Common"
    case uncommon = "Uncommon"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case unique = "Unique"
    
    var id: String { self.rawValue }
}

struct AddItemView: View {
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases) { rarity in
                        Text(rarity.rawValue.capitalized).tag(rarity)
                    }
                }
            }
            Button(action: {}, label: {
                Text("Ajouter")
            })
        }
    }
}

#Preview {
    AddItemView()
}
