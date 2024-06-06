//
//  StackRepoViewController.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import Foundation
import UIKit

class StackRepoViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private let useCase = StackOverflowUseCase()
    private var repositories: [Question] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: QuestionTableViewCell.self), bundle: nil),forCellReuseIdentifier: String(describing: QuestionTableViewCell.self))
        searchBar.delegate = self
    }
    
    private func fetchRepositories(searchQuery: String) {
        useCase.getQuestions(searchQuery: searchQuery) {
            [weak self] result in
            switch result {
            case .success(let repositories):
                print("Fetched repositories: \(repositories)")

                self?.repositories = repositories
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch repositories: \(error)")

            }
        }
    }
}
    
    
extension StackRepoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else {
            return
        }
        searchBar.resignFirstResponder()
        fetchRepositories(searchQuery: query)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            repositories = []
            tableView.reloadData()
        }
    }
}
extension StackRepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuestionTableViewCell.self), for: indexPath) as? QuestionTableViewCell {
            let repository = repositories[indexPath.row]
            cell.configure(with: repository)
                    
            return cell
        }
        return QuestionTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repository = repositories[indexPath.row]
        let detailVC = StackRepoDetailViewController()
        detailVC.repository = repository
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

    

