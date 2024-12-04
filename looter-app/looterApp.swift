import SwiftUI

class Inventory : ObservableObject {
    @Published var loot = [
        LootItem(quantity: 2, name: "Flip Doppler p4 #34", type: ItemType.dagger, rarity: Rarity.legendary, game: availableGames[3]),
        LootItem(name: "Flamme", type: ItemType.fire, rarity: Rarity.uncommon, game: availableGames[3]),
        LootItem(name: "Arc Antique", type: ItemType.bow, rarity: Rarity.unique, game: availableGames[3]),
        LootItem(quantity: 4, name: "Soin", type: ItemType.magic, rarity: Rarity.rare, game: availableGames[3]),
        LootItem(quantity: 3, name: "Talisman d'arsenal", type: ItemType.magic, rarity: Rarity.epic, game: availableGames[3]),
        LootItem(quantity: 2, name: "Boost de vitesse", type: ItemType.magic, rarity: Rarity.common, game: availableGames[3]),
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

@main
struct looterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Inventory())

        }
    }
}

struct AvatarView: View {
    @State private var isSelected = false

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .scaleEffect(isSelected ? 1.2 : 1.0)
                .onTapGesture {
                    withAnimation(.spring()) {
                        isSelected.toggle()
                    }
                }
            Text(isSelected ? "Sélectionné" : "Non sélectionné")
        }
    }
}
