//
//  MainViewController.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISearchControllerDelegate {
    
    
    
    private let tableView: UITableView = UITableView()
    private let mySearchBar: UISearchController = UISearchController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySearchBar.delegate = self
        view.backgroundColor = .white
        prepareTableView()
        configureAutoLayouts()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    
    private func setNavigationBar() {
        
        
        navigationItem.title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.searchController = mySearchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    
    
    
    private func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        //tableView Cell register
        tableView.register(FirstSearchPageTableViewCell.self,
                           forCellReuseIdentifier: FirstSearchPageTableViewCell.identifier)
        
        
        
    }
    
    
    private func configureAutoLayouts() {
        view.addSubview(tableView)
        
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
            
        ])
    }
    
    
    
}

extension MainViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstSearchPageTableViewCell.identifier,
                                                 for: indexPath) as! FirstSearchPageTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc: DetailViewController = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

