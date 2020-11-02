//  MainViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

//BaseViewController를 상속하고 있는 뷰컨임
class MainViewController: BaseViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
//   private var model: AppStoreModel?
    
    private let tableView: UITableView = UITableView()
    private let mySearchController: UISearchController = UISearchController()
    //didSet: 앞으로 변할 값이 정해지고, 그값이 변할때마다 어떤 것을 하도록 함(didSet 안에 있는 어떤것을 호출하거나 실행하기함)
    //didSet이 적혀있는 이 단하나의 ViewController 안에서 밖에 못씀
    private var models: [AppStoreModel.ResultsEntry] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //프라이빗 변수 Bool 값을 만듬 : "이게 클로져의 형태임" (여기서는 private으로 했지만 전역변수 (static)으로 만들어서 다른 뷰컨에서도 접근 가능하게 바꾸기
    //변수 isCompleted는 Bool 값을 가진 클로져 타입! 이라는 뜻임, 이렇게 표현함 -> ((Bool) -> Void)
    //Bool 값이 들어간 그 안에 두가지가 들어갈 수도 있음 Int: Int 이런식?(찾아보기)
    //아마 얘가 숙제의 디테일뷰(두번째뷰)에 넣어져야 할 코드가 아닐까 싶음 ?
    private var isCompleted: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchController.delegate = self
        mySearchController.searchBar.delegate = self
        view.backgroundColor = .white
        prepareTableView()
        setNavigationBar()
   
        //값이 바뀌는것을 주시하고 있다가 값이 바뀌자마자 감지하고 무언가를 해주기 위한 코드 (viewDidLoad같은 곳에 쓴다)
        //값이 바뀐것이 행동된 것은 아래의 URLSession 호출시 isCompleted 값에 false, true 값 각각 넣어준것이 변화가 일어난 순간인 것
        isCompleted = { Bool in
            print("completed = \(Bool)")
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
            models = []
            return}
        if text.isEmpty {
            models = []
        } else {
            
            //이것이 감지기 역할을 할 수 있는 이유는 클로저인 responseData 가 매개변수로 쓰인 함수 requestData를 불러줬기 때문이고 그 안에 있는
            //매개변수 responseData의 값(그 안에 들어있는 값)을 사용해서 뭔갈 해줄수 있는것
            //self.requestData의 함수를 부르면 자동으로 나오고 나오는 매개변수 'response'에 가서 엔터를 눌러 깨면 그 resonseData 값을
            //이용해서 클로져 감지기를 만들수 있게 된다
            //함수안의 매개변수가 클로져 타입이기 때문에 함수를 불러야만 이 클로져 감지기 코드를 만들수 있고 함수안의 매개변수이기 때문에 =이 쓰이지 않는 코드가 된다
            //사실상 내가 정한 models 란 값은 아래의 함수안에서 response에 대입되는 안에 있는 값이라고 할수 있다
            //클로져 감지기 역할을 하려면 전역이든 프라이빗이든 변수가 잇어야 하는데 여긴 없잖아 왜냐면 함수 안에서 썼기 때문에 (response)!
            //그렇기 때문에 escaping 과정을 통해서 하나의 독립적인 존재로 그전함수에서 튀어나왔고, 그걸 가지고 위의 isCompleted 처럼 하나의 독립적인 변수로서
            //클로져 감지기 역할을 할수 있는 코드를 구성할 수있는게 아닐까?
            
            //그리고 [weak self] 약한참조라는 개념으로, 참조할 self 가 존재할 경우, 그 self를 확실하게 참조하지 않고 하지 않을수도 있는 경우의 수를 제공함으로서
            //좀더 안전한 코드를 만드는 것(부담도 적고)
            self.requestData(term: text, responseData: { [weak self] models in
                self?.models = models
                self?.isCompleted?(true)
            })
        }
    }
    //만약 내가 함수 내부의 매개변수를 클로져로 만들고 그것을 escaping 으로 만들지 않는다면 클로져 감지기도 결국 다 함수 안에서 일어나야한다.
    //클로져타입인 매개변수를 만드는 일도, 그 매개변수의 값이 변화하는 일도 그리고 걔의 변화 감지기도 결국 다 함수안에서 일어나게 됨
    //그렇다면 무슨 의미가 있나??? 비동기적 처리를 위해 이 API 통신 함수도 다른데서 불러주는데, 그 안에서 다 해야하면 결국 쓰나마다이다
    //함수의 매개변수로서 다른데서 쓰고싶다면 escaping을 해라!
    //저 밑의 함수 completionHandler도 이미 다른 함수에서 escaping 해서 나와서 다른 함수 (requestData_내가 만듬)에서 쓰일수 있는겨, 클로져 감지기형태로!
    //아래 함수에서 매개변수인 responseData에 값이 들어가는 순간 escaping 될것이고 그것은 클로져 감지기에 감지되어 변화가 감지되는 순간 그 안의 어떤일을 수행할것임
    
    
    //@escaping (탈출)과 Closure(클로져)는 같이 갈수 밖에 없다. 이스케이핑을 쓰려면 클로져는 무조건 써야한다 '탈출클로져' 로서
    //@escaping 을 쓰는 이유는 이 함수에서 값을 완전히 받아와서 아예 다른 함수에서 사용해야 하기 때문에 탈출을 쓸수 밖에없음
    //그리고 @escaping을 여기서 쓰는 이유는 보통 비동기 처리 할때임 = 비동기 처리란? = 여러가지 과정을 거쳐서 오래걸리는 어떤 처리를 할때 씀
    //동기 처리란? = 간단한 함수등 빠르게 끝나는 것
    //이 예제는 클로져를 함수안에서, 매개변수에서 쓴 예임 (그냥 클로져를 따로 쓰는거랑은 방식의 차이가있음)
    //매개변수인 responseData는 탈출, 클로져임
    //클로져인 responseData (타입은 : [AppStoreModel.ResultsEntry]) 가 클로져로서 값을 받아 result.results가 들어가서, 변하고 그것이 위의 클로져 감지기코드에 감지되는 순간! 어떤행위를 해줄것이다~ 라는 코드가 클로져 감지기 코드 안에 들어감
    //클로져감지기 = self.requestData(term: text) 함수의 매개변수 뒤의 코드 { models in } 가 클로져 감지기임
    //그 클로져감지기 안의 in 뒤에 내가 바꿔줄 변화를 넣어줄 수 있다 (뭘 해라! 뭘 바꿔라 등등)
    //위의 작업은 만들어준 변수 models에 클로져감지기로 감지한 responseData의 값을 (내가 지정한 이름 아무거나 (models) 라고 지정하든 뭐든) 그 값을 넣어준다는 행위함
    private func requestData(term: String, responseData: @escaping (([AppStoreModel.ResultsEntry]) -> Void)) {
        let urlSting = "https://itunes.apple.com/search?entity=software&country=KR&term=\(term)"
        guard let target = urlSting.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: target) else {return}
        URLSession.shared.dataTask(with: url,
                                   completionHandler: {data, reponse, error in
                                    guard let data = data, error == nil else {
                                        print("Something Wrong")
                                        self.isCompleted?(false)
                                        return
                                    }
                                    
                                    var json: AppStoreModel?
                                    
                                    do {
                                        json = try JSONDecoder().decode(AppStoreModel.self, from: data)
                                    } catch {
                                        print("error: \(error)")
                                    }
                                    guard let result = json else {return}
                                    responseData(result.results)
        }).resume()
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
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstSearchPageTableViewCell.identifier,
                                                 for: indexPath) as! FirstSearchPageTableViewCell
        let model = models[indexPath.row]
            cell.setData(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: DetailViewController = DetailViewController()
        let model = models[indexPath.row]
        vc.data = model
        navigationController?.pushViewController(vc, animated: true)
    }
}

//private extension UIViewController {
//    func setNaviCustomColor(_ color: UIColor, shadowAlpha: CGFloat = 0.5) {
//
//    }
//}
