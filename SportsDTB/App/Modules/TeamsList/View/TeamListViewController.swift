//
//  TeamListViewController.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 20/06/22.
//

import UIKit

protocol TeamListDelegate {
    func toogleLoading()
    func loadingSuccess()
    func reloadTable()
    func showError()
}


class TeamListViewController: UIViewController {
    
    private var service = TeamListService()
    private var viewModel: TeamListViewModel?
    
    let monserratFont = UIFont(name: "Montserrat-VariableFont_wght.ttf", size: UIFont.labelFontSize)
    
    var url: String = ""
    
    private var tableViewTeam: UITableView = {
        let teamsTable = UITableView()
        teamsTable.translatesAutoresizingMaskIntoConstraints = false
        return teamsTable
    }()
    
    private var loadingAnimation: UIActivityIndicatorView = {
        let loadingAnimation = UIActivityIndicatorView()
        loadingAnimation.translatesAutoresizingMaskIntoConstraints = false
        loadingAnimation.style = .medium
        loadingAnimation.color = .systemCyan
        return loadingAnimation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TeamListViewModel(url: url, service: service, delegate: self)
        viewModel?.getTeams()
        
        setupView()
        setupConstraints()
        
    }
    
    private func setupView () {
        title = "Equipos"

        view.backgroundColor = .white
        view.addSubview(tableViewTeam)
        view.addSubview(loadingAnimation)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableViewTeam.dataSource = self
        tableViewTeam.delegate = self
        
        tableViewTeam.register(TeamListTableCell.self, forCellReuseIdentifier: String(describing: TeamListTableCell.self))
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            tableViewTeam.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableViewTeam.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableViewTeam.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableViewTeam.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            loadingAnimation.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingAnimation.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            
            ])
    }
    
    
    
}

extension TeamListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension TeamListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellTeam = tableView.dequeueReusableCell(withIdentifier: String(describing: TeamListTableCell.self)) as? TeamListTableCell else {
            return UITableViewCell()
        }
        
        
        let team = viewModel?.getTeam(at: indexPath.row).strTeam
        let stadium = viewModel?.getTeam(at: indexPath.row).strStadium
        let year = viewModel?.getTeam(at: indexPath.row).intFormedYear
        let urlL = viewModel?.getTeam(at: indexPath.row).strTeamBadge
        
        cellTeam.name = team
        cellTeam.stadium = stadium
        cellTeam.year = year
        cellTeam.urlL = urlL
        
        return cellTeam
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getTeamCount() ?? 0
    }
    
}

extension TeamListViewController: TeamListDelegate {
    func loadingSuccess() {
        tableViewTeam.isHidden = false
        loadingAnimation.isHidden = true
        loadingAnimation.stopAnimating()
    }
    
    
    func toogleLoading() {
        print("HOLAAA")
        tableViewTeam.isHidden = true
        loadingAnimation.isHidden = false
        loadingAnimation.startAnimating()
    }
    
    func reloadTable() {
        tableViewTeam.reloadData()
    }
    
    func showError() {
        print("Error en Team List")
    }
    
    
}
