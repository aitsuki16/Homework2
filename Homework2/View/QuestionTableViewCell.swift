//
//  stackOverflowCell.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with repository: Question) {
        print("Configuring cell with: \(repository)")
        titleLabel.text = repository.title
        scoreLabel.text = "Score: \(repository.score)"
        tagsLabel.text = "Tags: \(repository.tags.joined(separator: ", "))"
        if let dateString = formatDate(from: repository.creationDate) {
            dateLabel.text = "Created on: \(dateString)"
        }
    }

    private func formatDate(from timestamp: Int) -> String? {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
