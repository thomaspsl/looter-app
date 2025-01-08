import Foundation

struct Game: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: nil),
    Game(name: "Skyrim", genre: .rpg, coverName: nil),
    Game(name: "WoW", genre: .mmorpg, coverName: nil),
    Game(name: "CS2", genre: .fps, coverName: "CS2"),
    Game(name: "Diablo IV", genre: .looter, coverName: nil)
]
