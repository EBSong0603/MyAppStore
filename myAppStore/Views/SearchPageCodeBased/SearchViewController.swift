//  MainViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class SearchViewController: BaseViewController {
    
    private let tableView: UITableView = UITableView()
    
    private let mySearchController: UISearchController = UISearchController()
    
    public var searchResults: [String] = []
    
    private let viewModel: AppStoreViewModel = AppStoreViewModel()
    
    private var isSearched: Bool = false {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var isNaviTitleHidden: Bool = false {
        didSet {
            mySearchController.isActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        prepareTableView()
        setNavigationBar()
        prespareSearchBar()
        
        viewModel.isChanged = { [weak self] isChangedTrue in
            self?.tableView.reloadData()
        }

        if let result = UserDefaultManager.shared.searchResult {
            if result.count >= 0 {
                isSearched = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setNavigationBar() {
        navigationItem.title = "검색"
        navigationItem.searchController = mySearchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func configureAutolayouts() {
        view.addSubview(tableView)
        tableView.edges(self.safeArea)
    }
    
    private func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        //tableView Cell register
        tableView.register(SearchTableViewCell.self,
                           forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
    
    private func prespareSearchBar() {
        mySearchController.delegate = self
        mySearchController.searchBar.delegate = self
        mySearchController.obscuresBackgroundDuringPresentation = false
    }
}

//MARK: TableView Setting
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let results = UserDefaultManager.shared.searchResult {
            if isSearched {
                return results.count
            }
        }
        return viewModel.outPut.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearched {
            if let results = UserDefaultManager.shared.searchResult {
                let cell = UITableViewCell()
                cell.textLabel?.text = results[indexPath.row]
                cell.textLabel?.textColor = .systemBlue
                cell.textLabel?.font = .systemFont(ofSize: 20)
                return cell
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier,
                                                 for: indexPath) as! SearchTableViewCell
        let model = viewModel.outPut.models[indexPath.row]
        cell.setData(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearched {
            if let result = UserDefaultManager.shared.searchResult {
                let searchText: String = result[indexPath.row]
                viewModel.requestData(term: searchText)
                mySearchController.searchBar.text = searchText
                isSearched = false
                isNaviTitleHidden = true
            }
        } else {
            let model = viewModel.outPut.models[indexPath.row]
            viewModel.inPut.selectedModel = model
            let vc: DetailViewController = DetailViewController(with: viewModel)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: searchViewController Setting
extension SearchViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.navigationBar.prefersLargeTitles = false

        fetchUserSearchKeywordAndRequestAPI(text: searchBar.text!)
        
        switch searchResults.count {
        case 0..<5:
            searchResults.insert(searchBar.text!, at: 0)
            UserDefaultManager.shared.searchResult = searchResults
        default:
            searchResults.remove(at: 4)
            searchResults.insert(searchBar.text!, at: 0)
            UserDefaultManager.shared.searchResult = searchResults
        }
    }
    
    func fetchUserSearchKeywordAndRequestAPI(text: String) {
        guard let text = mySearchController.searchBar.text else {
            viewModel.reset()
            return
        }
        if text.isEmpty {
            viewModel.reset()
        } else {
            viewModel.requestData(term: text)
            isSearched = false
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearched = true
        viewModel.reset()
    }
}
