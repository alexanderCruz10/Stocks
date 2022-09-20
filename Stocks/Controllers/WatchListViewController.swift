//
//  ViewController.swift
//  Stocks
//
//  Created by Alex Cruz on 2022-09-19.
//

import UIKit

class WatchListViewController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        setUpSearchController()
        setUpTitleView()
    }
    
    //MARK: - Functions
    
    private func setUpSearchController(){
        
        let resultVC = SearchResultViewController()
        let searchVC  = UISearchController(searchResultsController: resultVC)
        
        resultVC.delegate = self
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    private func setUpTitleView(){
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height))
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 40, weight: .medium)
        titleView.addSubview(label)
        
        navigationItem.titleView = titleView
    }

}

//MARK: - Search Bar Extension

extension WatchListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text, let resultsVC = searchController.searchResultsController as? SearchResultViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        
        resultsVC.update(with: ["GOOG"])
        print(query)
    }
}

extension WatchListViewController: SearchResultViewControllerDelegate{
    
    func SearchResultViewControllerDidSelect(searchResult: String) {
        
    }
    
    
}
