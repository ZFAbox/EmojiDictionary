import Foundation

struct EmojiGroupModel: Codable {
    var name: String
    var emojis: [EmojiModel]
    
    static var archiveURL = {
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = directoryPath.appendingPathComponent("emoji_groups").appendingPathExtension("plist")
        return archiveURL
    }()
    
    static func saveToFile(emojiGroups: [EmojiGroupModel]){
        let propertyListEncoder = PropertyListEncoder()
        let url = archiveURL
        do {
            let emojiGroupData = try propertyListEncoder.encode(emojiGroups)
            try emojiGroupData.write(to: url, options: .noFileProtection)
        } catch {
            print("Failed to save emoji groups: \(error)")
        }
    }
    
    static func loadFromFile() -> [EmojiGroupModel] {
        let propertyListDecoder = PropertyListDecoder()
        let url = archiveURL
        if let emojiFroupData = try? Data(contentsOf: url),
           let emojiGrops = try? propertyListDecoder.decode([EmojiGroupModel].self, from: emojiFroupData){
            return emojiGrops
        } else {
            return []
        }
    }
    
    static func sampleEmojis() -> [EmojiGroupModel] {
        return EmojiList.emijiGroupList
    }
}
