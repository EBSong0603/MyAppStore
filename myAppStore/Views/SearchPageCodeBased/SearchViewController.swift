//  MainViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class SearchViewController: BaseViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    private let tableView: UITableView = UITableView()
    private let mySearchController: UISearchController = UISearchController()
    
    private let viewModel: AppStoreViewModel = AppStoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchController.delegate = self
        mySearchController.searchBar.delegate = self
        view.backgroundColor = .white
        prepareTableView()
        setNavigationBar()
        
        mySearchController.obscuresBackgroundDuringPresentation = false
        
        viewModel.isChanged = { isChangedTrue in
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setNavigationBar() {
        navigationItem.title = "검색"
        navigationItem.searchController = mySearchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchUserSearchKeywordAndRequestAPI(text: searchBar.text!)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.titleView?.isHidden = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.reset()
    }
    
    func fetchUserSearchKeywordAndRequestAPI(text: String) {
        
        guard let text = mySearchController.searchBar.text else {
            viewModel.reset()
            return}
        if text.isEmpty {
            viewModel.reset()
        } else {
            viewModel.requestData(term: text)
        }
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
}

extension SearchViewController: UITableViewDelegate {
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outPut.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier,
                                                 for: indexPath) as! SearchTableViewCell
        let model = viewModel.outPut.models[indexPath.row]
        cell.setData(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //지금 선택된 하나의 인덱스페스 데이터만 input 데이터에 넣어서 보내기
        let model = viewModel.outPut.models[indexPath.row]
        viewModel.inPut.selectedModel = model
        
        //다음 뷰컨트롤러 이니셜라이즈로 viewModel 넘기기
        let vc: DetailViewController = DetailViewController(with: viewModel)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

