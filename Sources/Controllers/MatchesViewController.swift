//
//  Matches.swift
//  
//
//  Created by Kegham Karsian on 20/06/2021.
//

import Foundation
import UIKit

public class MatchesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    public static let storyboardVC = UIStoryboard(name: "matches", bundle: Bundle.module).instaintiateInitialViewController()!
    
    public override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MatchTableViewCell", bundle: Bundle.module), forCellWithReuseIdentifier: "matchecell")
        
        reloadData()
        
    }
    
    func reloadData() {
        MatchesDataCenter.shared.loadMatchesWithDelegate(self)
    }
}

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let matches = MatchesDataCenter.shared.matches else {return 0}
        
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "matchcell", for: indexPath) as? MatchTableViewCell else { return UITableViewCell() }
        
        guard let match = MatchesDataCenter.shared.matches[indexPath.row] else { return UITableViewCell() }
        
        cell.homeImgView.loadImageUsingCache(withUrl: match.homeImgUrl)
        cell.awayImgView.loadImageUsingCache(withUrl: match.awayImgUrl)
        cell.homelbl.text = match.homeTeam
        cell.awaylbl.text = match.awayTeam
        cell.location.text = match.location
        
        return cell
        
    }
}

extension MatchesViewController: OperationDelegate {
    
    func didCancelOperation(_ operationID: OperationID) {
        
    }
    
    func didFinishOperation(_ operationID: OperationID) {
        
        switch operationID {
        case .Matches:
            self.tableView.reloadData()
        default:
            break
        }
        
    }
    
    func didFinishOperation(_ operationID: OperationID, object: AnyObject) {
        
    }
    
    func didRecieveErrorForOperation(_ operationID: OperationID, andWithError errorMessage: String?) {
        switch operationID {
        case .Matches:
            print("ERROR: ", errorMessage)
        default:
            break
        }
        
    }
    
    
}

