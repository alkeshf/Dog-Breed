//
//  ViewController.swift
//  Interview
//
//  Created by Alkesh Fudani on 12/10/20.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    // MARK: IBOutlets/Variables
    var viewModel: ViewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var dogs = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assigning sort button action
        self.sortButton.target = self.viewModel
        self.sortButton.action = #selector(self.viewModel.sortPressed)
        
        viewModel.viewController = self
        self.viewModel.fetchData()
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell") as? ViewControllerCell else {
            return UITableViewCell()
        }
        cell.setupData(shareobj: self.dogs[indexPath.row])
        return cell
    }
}
