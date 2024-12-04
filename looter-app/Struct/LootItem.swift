//
//  LootItem.swift
//  looter-app
//
//  Created by Thomas on 13/11/2024.
//

import SwiftUICore

struct LootItem: Identifiable {
    var id : UUID = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
}

enum ItemType: String {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

enum Rarity: String, CaseIterable, Identifiable {
    case common = "Common"
    case uncommon = "Uncommon"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case unique = "Unique"
    
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
            case .common:
                return .gray
            case .uncommon:
                return .green
            case .rare:
                return .blue
            case .epic:
                return .purple
            case .legendary:
                return .orange
            case .unique:
                return .red
        }
    }
}

