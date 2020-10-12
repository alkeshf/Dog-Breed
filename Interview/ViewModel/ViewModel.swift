//
//  ViewModel.swift
//  Interview
//
//  Created by Alkesh Fudani on 12/10/20.
//

import Foundation
import ObjectMapper

public class ViewModel {
    
    // MARK: Variables
    var viewController:ViewController!
    
    var isAscending: Bool? = false
    
    // MARK: - Initialization
    init() {
    }
    
    //API call
    public func fetchData(){
        APIManager.get(self.APIURL()) { (error, json) in
            self.viewController.spinner.stopAnimating()
            guard let jsonResponse = json else {
                self.displayAPIError(errorMessage: error?.localizedDescription ?? "")
                return
            }
            self.viewController.dogs = Mapper<Model>().mapArray(JSONArray: jsonResponse)
            self.viewController.tableView.reloadData()
        }
    }
    
    //Extracting the API url from the info.plist file
    func APIURL() -> String {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: path)
            if let dict = dictRoot {
                return dict["URL"] as! String
            }
        }
        return ""
    }
    
    //First time pressing the sort button will sort it by ascending order by default
    //and second time will sort it in descending order
    @objc public func sortPressed() {
        // This sorting works on the minimum lifespan value, so if a lifespan in 10-14 years it will consider 10 for comparison
        // we can do it with the max value as well, also the breed with no lifespan value will be sent to the end of the list
        // It would have been easier to not show the breeds with no values and only image but since many of them were having GIFs
        // and the GIFs were cute to not miss
        
        let sortingList = self.viewController.dogs.filter({
            $0.lifeSpanInt != 0
        })
        var sortedList = [Model]()
        if !(isAscending ?? false) {
            sortedList = sortingList.sorted(by: {$0.lifeSpanInt < $1.lifeSpanInt })
            isAscending = true
        }else {
            sortedList = sortingList.sorted(by: {$0.lifeSpanInt > $1.lifeSpanInt })
            isAscending = false
        }
        sortedList.append(contentsOf: self.viewController.dogs.filter({
            $0.lifeSpanInt == 0
        }))
        self.viewController.dogs = sortedList
        self.viewController.tableView.reloadData()
    }
    
    //It will display the error if any while making the API call
    func displayAPIError(errorMessage: String) {
        let alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in }))
        self.viewController.present(alert, animated: true, completion: nil)
    }
    
}
