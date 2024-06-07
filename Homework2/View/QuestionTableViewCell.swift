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

    func configure(with question: Question) {
        print("Configuring cell with: \(question)")
        titleLabel.text = question.title
        scoreLabel.text = "Score: \(question.score)"
        tagsLabel.text = "Tags: \(question.tags.joined(separator: ", "))"
        if let dateString = formatDate(from: question.creationDate) {
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
