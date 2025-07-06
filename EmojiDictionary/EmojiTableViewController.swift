import UIKit

class EmojiTableViewController: UITableViewController {
    
//    var emojis: [EmojiModel] = EmojiList.emojies
    
    var emojiGroups: [EmojiGroupModel] = [] {
        didSet {
            EmojiGroupModel.saveToFile(emojiGroups: emojiGroups)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        let loadedEmojiGroups = EmojiGroupModel.loadFromFile()
        emojiGroups = loadedEmojiGroups.isEmpty
        ? EmojiGroupModel.sampleEmojis()
        : loadedEmojiGroups
    }
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> UITableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            print("touch cell")
            let selectedEmoji = emojiGroups[indexPath.section].emojis[indexPath.row]
            let selectedCategory = emojiGroups[indexPath.section].name
            return AddEditEmojiTableViewController(emoji: selectedEmoji,category: selectedCategory, coder: coder)
        }
        return AddEditEmojiTableViewController(emoji: nil, category: nil, coder: coder)
    }
    
    @IBAction func unwindToEmojiTableViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind", let sourceViewController = segue.source as? AddEditEmojiTableViewController, let emoji = sourceViewController.emoji, let category = sourceViewController.category  else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow, emojiGroups[selectedIndexPath.section].name == category  {
            emojiGroups[selectedIndexPath.section].emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            if let oldIndexEmoji = tableView.indexPathForSelectedRow {
                emojiGroups[oldIndexEmoji.section].emojis.removeAll { oldEmoji in
                    oldEmoji == emoji
                }
                if emojiGroups[oldIndexEmoji.section].emojis.isEmpty {
                    emojiGroups.remove(at: oldIndexEmoji.section)
                }
            }
                if let newIndex = emojiGroups.firstIndex(where: { $0.name == category }) {
                emojiGroups[newIndex].emojis.append(emoji)
                } else {
                    let newEmojiGroup = EmojiGroupModel(name: category, emojis: [emoji])
                    emojiGroups.append(newEmojiGroup)
                }
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return emojiGroups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojiGroups[section].emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojiGroups[indexPath.section].emojis[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.text = "\(emoji.symbol) - \(emoji.name)"
//        content.secondaryText = emoji.description
//        cell.contentConfiguration = content
        cell.update(with: emoji)
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojiGroups[sourceIndexPath.section].emojis.remove(at: sourceIndexPath.row)
        emojiGroups[destinationIndexPath.section].emojis.insert(movedEmoji, at: destinationIndexPath.row)
    }
    
    //Шаг 1. Разрешение редактировать строку, можно поставить запрет н а редактирование определенной строки. Если нужно редактировать все строки метод можно опустить.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Шаг 2. Выбор способа редактирования
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //Шаг3. Удаление строки таблицы
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.emojiGroups[indexPath.section].emojis.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic )
        } else if editingStyle == .insert {
    
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let emoji = emojis[indexPath.row]
//        print("\(emoji.symbol) - \(indexPath)")
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return emojiGroups[section].name
    }

}
