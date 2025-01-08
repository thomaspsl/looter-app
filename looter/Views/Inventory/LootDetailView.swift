import SwiftUI

struct LootDetailView: View {
    let item: LootItem
    
    @State private var mousePosition = CGSize(width: 0, height: 0)
    @State private var rotation = CGSize(width: 0, height: 0)
    @State private var radius: CGFloat = 0
    @State private var firstRotation: CGFloat = 0

    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                Text(item.type.rawValue)
                    .font(.system(size: 55))
                    .padding(30)
                    .background(
                        Rectangle()
                            .fill(item.rarity.color)
                            .cornerRadius(25)
                    )
                    .rotation3DEffect(
                        .degrees(rotation.width),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .rotation3DEffect(
                        .degrees(rotation.height),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .rotation3DEffect(
                        .degrees(firstRotation),
                        axis: (x: 1, y: 1, z: 0)
                    )
                    .shadow(
                        color: item.rarity.color,
                        radius: radius,
                        x: 0,
                        y: 0
                    )
                    .task {
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            firstRotation += 360
                        }
                        try? await Task.sleep(for: .seconds(1))
                        withAnimation(.bouncy(duration: 1)) {
                            radius += 30
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let normalizedX = (gesture.location.x / geometry.size.width) * 2 - 1
                                let normalizedY = -(gesture.location.y / geometry.size.height) * 2 + 1

                                withAnimation(.easeOut(duration: 0.5)) {
                                    self.mousePosition = CGSize(width: normalizedX, height: normalizedY)
                                    self.rotation = CGSize(
                                        width: mousePosition.width * 30,
                                        height: mousePosition.height * 30
                                    )
                                }
                            }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    self.rotation = CGSize.zero
                                }
                            }
                    )
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))

    
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(item.rarity.color)
            
            Spacer()
            
            if (item.rarity == Rarity.unique) {
                Text("Item Unique 🏆")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        Rectangle()
                            .fill(item.rarity.color)
                            .cornerRadius(20)
                    )
            }

            Form {
                Section {
                    HStack {
                        if let picture = item.game.coverName {
                            Image(picture)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 58)
                                .cornerRadius(4)
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(width: 45, height: 58)
                                Image(systemName: "rectangle.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.black.opacity(0.4))
                            }
                        }
                        Text("\(item.game.name)")
                    }
                    Text("In-game : \(item.name)")
                    Text("Puissance (ATQ) : \(String(describing: item.attackStrength))")
                    Text("Possédé(s) : \(item.quantity)")
                    Text("Raraté : \(item.rarity)")
                } header: {
                    Text("INFORMATIONS")
                }
            }
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(quantity: 2, name: "Flip Doppler p4 #34", type: ItemType.dagger, rarity: Rarity.unique, game: availableGames[3])
    )
}
