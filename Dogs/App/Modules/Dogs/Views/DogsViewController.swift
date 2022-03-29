//
//  DogsViewController.swift
//  Dogs
//
//  Created by Jesus Loaiza Herrera on 26/03/22.
//

import UIKit
import Alamofire
import AlamofireImage

class DogsViewController: UIViewController, LoaderPresentable, Storyboarded{
  
  @IBOutlet weak var tableView: UITableView!
  
  private var viewModel: DogsViewModel?
  
  
  var dogs: [Dogs] = [Dogs]()
  
  
  private weak var coordinator: DogsCoordinator?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTableView()
    Validations.isApiAlreadyCallOnce() == true ? getDataFromDB() : sendService()
    bind()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    self.title = "Dogs We Love"
    let imageLeft = UIImage(named: "leftArrow")
    let leftBarButtonItem = UIBarButtonItem.init(image: imageLeft?.resized(to: CGSize(width: 22, height: 22)), style: .plain, target: self, action: #selector(closeApp))
    self.navigationController?.navigationBar.topItem?.leftBarButtonItem = leftBarButtonItem
  }
  
  @objc func closeApp(){
    coordinator?.returnToPreviousController()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        exit(0)
      }
    }
  }
  
  
  func setup(coordinator : DogsCoordinator, viewModel: DogsViewModel){
    self.viewModel = viewModel
    self.coordinator = coordinator
  }
  
  func setTableView(){
    tableView.delegate = self
    tableView.dataSource = self
    
    let nib = UINib(nibName: "ItemDogsTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "dogsCell")
    tableView.isScrollEnabled = true
    tableView.separatorStyle = .none
  }
  
  func sendService(){
    self.presentLoader {
      self.viewModel?.serviceDogs()
    }
  }
  
  func getDataFromDB(){
    self.presentLoader { [self] in
      let realm = RealmService.shared.realm
      dismissLoader { [self] in
        dogs = Array(realm.objects(Dogs.self))
        tableView.reloadData()
      }
      
    }
  }
  
  func bind(){
    self.viewModel?.dogs.bind({  dogs in
      self.dismissLoader {
        self.dogs = dogs
        for item in dogs {
          let saveDogs = Dogs()
          saveDogs.dogName = item.dogName
          saveDogs.dogDescription = item.dogDescription
          saveDogs.age = item.age
          saveDogs.image = item.image
          RealmService.shared.create(saveDogs)
        }
        
        self.tableView.reloadData()
      }
    })
    viewModel?.requestAnswer.bind({ error in
      self.dismissLoader {
        self.showMessage(body: error.error?.localizedTitle ?? "Error", title: "Test iOS")
      }
    })
  }
  
  
  
}

extension DogsViewController: UITableViewDataSource, UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  dogs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dogsCell", for: indexPath) as! ItemDogsTableViewCell
    
    let itemDog = dogs[indexPath.row]
    
    
    
    let urlImg = URL(string: itemDog.image) ?? URL(fileURLWithPath: "")
    
    let placeholderImage = UIImage(named: "placeholder")!
    
    
    let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
      size: cell.optionDog.imgView.frame.size,
      radius: 20.0
    )
    
    cell.optionDog.imgView.af.setImage(
      withURL: urlImg,
      placeholderImage: placeholderImage,
      filter: filter,
      imageTransition: .crossDissolve(0.2)
    )
    cell.optionDog.nameLbl.text = itemDog.dogName
    cell.optionDog.descriptionLbl.text = itemDog.dogDescription
    cell.optionDog.ageLbl.text = "Almost \(itemDog.age) years"
    
    
    
    return cell
  }
  
}
