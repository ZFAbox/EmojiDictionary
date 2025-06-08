//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Федор Завьялов on 30.05.2025.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiView: UILabel!
    @IBOutlet weak var emoojiNamw: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
    
    func update(with emoji: EmojiModel) {
        emojiView.text = emoji.symbol
        emoojiNamw.text = emoji.name
        emojiDescription.text = emoji.description
    }

}
