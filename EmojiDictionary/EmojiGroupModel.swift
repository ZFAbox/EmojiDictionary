import Foundation

struct EmojiGroupModel: Codable {
    var name: String
    var emojis: [EmojiModel]
    
    static var archiveURL = {
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = directoryPath.appendingPathComponent("emoji_groups").appendingPathExtension("plist")
        return archiveURL
    }
    static func saveToFile(emojiGroups: [EmojiGroupModel]){
        
    }
    
    static func loadFromFile() -> [EmojiGroupModel] {
        return []
    }
}
