//
//  EmojiCustomCellView.swift
//  EmojiDictionary
//
//  Created by Федор Завьялов on 04.06.2025.
//

import UIKit

class EmojiCustomCellView: UITableViewCell {
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "😄"
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var emojiName: UILabel = {
        let label = UILabel()
        label.text = "Smiling face with open mouth"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private lazy var emojiDescription: UILabel = {
        let label = UILabel()
        label.text = "Smiling face with open mouth"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        hStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hStack)
        [emojiLabel, vStack].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            hStack.addArrangedSubview(view)
        }
        [emojiName,emojiDescription].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            vStack.addArrangedSubview(view)
        }
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func update(with emoji: EmojiModel) {
        emojiLabel.text = emoji.symbol
        emojiName.text = emoji.name
        emojiDescription.text = emoji.description
    }

}
