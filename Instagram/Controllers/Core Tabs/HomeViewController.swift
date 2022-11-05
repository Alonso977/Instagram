//
//  ViewController.swift
//  Instagram
//
//  Created by Alonso Alas on 29/8/22.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.indentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()

    }
    
    private func handleNotAuthenticated() {
        
        //Check auth status
        if Auth.auth().currentUser == nil {
            // Show Login
            
            let loginVC = LoginViewController()
            
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.indentifier, for: indexPath) as! IGFeedPostTableViewCell
        
        return cell
        
    }
    
}
