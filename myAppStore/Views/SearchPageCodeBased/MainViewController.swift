//  MainViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

//BaseViewController를 상속하고 있는 뷰컨임
class MainViewController: BaseViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
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
        
        viewModel.isChanged = { isChangedTrue in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
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
    }
    
    func fetchUserSearchKeywordAndRequestAPI(text: String) {

        guard let text = mySearchController.searchBar.text else {
            viewModel.reset()
            return}
        if text.isEmpty {
            viewModel.reset()
        } else {
            viewModel.requestData(term: text) { _ in
            }
        }
    }
 
    override func configureAutolayouts() {
        view.addSubview(tableView)
        tableView.edges(self.safeArea)
    }
    
    private func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        //tableView Cell register
        tableView.register(FirstSearchPageTableViewCell.self,
                           forCellReuseIdentifier: FirstSearchPageTableViewCell.identifier)
    }
}

extension MainViewController: UITableViewDelegate {
}

extension MainViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstSearchPageTableViewCell.identifier,
                                                 for: indexPath) as! FirstSearchPageTableViewCell
        let model = viewModel.models[indexPath.row]
            cell.setData(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let model = viewModel.models[indexPath.row]
        let vc: DetailViewController = DetailViewController(with: model)
//        vc.data = model
        navigationController?.pushViewController(vc, animated: true)
    }
}

