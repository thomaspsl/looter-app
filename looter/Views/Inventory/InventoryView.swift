import SwiftUI

struct InventoryView: View {
    @EnvironmentObject var inventory: Inventory
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot, id: \.id) { item in
                    NavigationLink (destination: LootDetailView(item: item)) {
                        VStack (alignment: .leading) {
                            HStack {
                                Circle()
                                    .fill(item.rarity.color)
                                    .frame(width: 12, height: 12)
                                Text(item.name)
                                    .bold()
                                Spacer()
                                Text("\(item.type.rawValue)")
                            }
                            HStack {
                                 Text("Quantité : \(item.quantity)")
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView()
            })
            .navigationBarTitle("👝 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
    }
}

#Preview {
    InventoryView()
        .environmentObject(Inventory())
}
