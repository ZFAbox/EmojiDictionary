import Foundation

struct EmojiList {
//    static var emojies: [EmojiModel] = [
//        EmojiModel(symbol: "😀", name: "Grinning Face",
//           description: "A typical smiley face.", usage: "happiness"),
//        EmojiModel(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
//        EmojiModel(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
//        EmojiModel(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
//        EmojiModel(symbol: "🐢", name: "Turtle", description:
//           "A cute turtle.", usage: "something slow"),
//        EmojiModel(symbol: "🐘", name: "Elephant", description:
//           "A gray elephant.", usage: "good memory"),
//        EmojiModel(symbol: "🍝", name: "Spaghetti",
//           description: "A plate of spaghetti.", usage: "spaghetti"),
//        EmojiModel(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
//        EmojiModel(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
//        EmojiModel(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
//        EmojiModel(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
//        EmojiModel(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
//        EmojiModel(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
//       ]
    
    static var emijiGroupList: [EmojiGroupModel] {[
        EmojiGroupModel(name: "Smiles&People", emojis: [
            EmojiModel(symbol: "😀", name: "Grinning Face",
               description: "A typical smiley face.", usage: "happiness"),
            EmojiModel(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            EmojiModel(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
            EmojiModel(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming")
        ]),
        EmojiGroupModel(name: "Animals&Nature", emojis: [
            EmojiModel(symbol: "🐢", name: "Turtle", description:
               "A cute turtle.", usage: "something slow"),
            EmojiModel(symbol: "🐘", name: "Elephant", description:
               "A gray elephant.", usage: "good memory")
        ]),
        EmojiGroupModel(name: "Food&Drink", emojis: [
            EmojiModel(symbol: "🍝", name: "Spaghetti",
               description: "A plate of spaghetti.", usage: "spaghetti")
        ]),
        EmojiGroupModel(name: "Activity", emojis: [
            EmojiModel(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            EmojiModel(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying")
        ]),
        EmojiGroupModel(name: "Travel&Places", emojis: [
            EmojiModel(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")
        ]),
        EmojiGroupModel(name: "Object,Symbols and Flags", emojis: [
            EmojiModel(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
            EmojiModel(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
            EmojiModel(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
        ])
        ]
    }
}
