//
//  AddItemView.swift
//  looter-app
//
//  Created by Thomas on 13/11/2024.
//


import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) var dismiss

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
            Button(action: {
//                inventory.addItem(item: name)
                dismiss()
            }, label: {
                Text("Ajouter")
            })
        }
    }
}

#Preview {
    AddItemView()
}
