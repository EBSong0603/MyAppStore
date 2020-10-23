//
//  MainViewController.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

//BaseViewController를 상속하고 있는 뷰컨임
class MainViewController: BaseViewController, UISearchControllerDelegate {
    
    var model: AppStoreModel?
    private let tableView: UITableView = UITableView()
    private let mySearchBar: UISearchController = UISearchController()
    
    //didSet: 앞으로 변할 값이 정해지고, 그값이 변할때마다 어떤 것을 하도록 함(didSet 안에 있는 어떤것을 호출하거나 실행하기함)
    //didSet이 적혀있는 이 단하나의 ViewController에서 밖에 못씀
    private var models: [AppStoreModel.ResultsEntry] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAPI()
        mySearchBar.delegate = self
        view.backgroundColor = .white
        prepareTableView()
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setNavigationBar() {
        navigationItem.title = "검색"
        navigationItem.searchController = mySearchBar
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func requestAPI() {
        let url = "https://itunes.apple.com/search?entity=software&country=KR&term=cash"
 
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, reponse, error in
            guard let data = data, error == nil else {
                print("Something Wrong")
                return
            }
            self.bindData(with: data)
            self.updateUI()
        }).resume()
    }
    
    func bindData(with data: Data) {
        var json: AppStoreModel?
        
        do {
            json = try JSONDecoder().decode(AppStoreModel.self, from: data)
        } catch {
            print("error: \(error)")
        }
        guard let result = json else {return}
        self.model = result
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //BaseViewController를 인풋했기때문에 그 뷰컨안에서 정의해 놓은 것들은 override로 써야 함
    //이미 삽입한 뷰컨에서 configureAutolayouts 가 func으로 있기 때문에 이건 override 된것임
    //그리고 그 삽입한 뷰컨안에서 이미 viewdidload안에 configure- 가 호출된게 이미 셋팅되어 있기 때문에
    //그 뷰컨을 삽입한 이 MainViewController에서는 따로 또 호출해줄 필요 없음!
    override func configureAutolayouts() {
        view.addSubview(tableView)
        
        tableView.edges(self.safeArea)
        //extension중 Date extension 과 string extension 확인하기 위해 쓴 코드(아래)
        let now: Date = Date()
        let str: String = now.dateToString(format: "yyyy-MM-dd")
        print("now = \(str)")
        print("nowDate = \(str.stringToDate(format: "yyyy-MM-dd"))")
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension MainViewController: UITableViewDataSource {
    // todo: 오로레이아웃 잡고 이 함수는 삭제할 것
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        300
    //    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstSearchPageTableViewCell.identifier,
                                                 for: indexPath) as! FirstSearchPageTableViewCell
        if let model = model?.results {
            cell.setData(with: model[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: DetailViewController = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//private extension UIViewController {
//    func setNaviCustomColor(_ color: UIColor, shadowAlpha: CGFloat = 0.5) {
//
//    }
//}
