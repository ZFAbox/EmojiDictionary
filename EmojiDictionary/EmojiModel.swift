
struct EmojiModel: Codable, Equatable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static func == (lhs: EmojiModel, rhs: EmojiModel) -> Bool {
        return lhs.symbol == rhs.symbol &&
        lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.usage == rhs.usage
    }
}
