//
//  LeagueListViewController.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 17/06/22.
//

import UIKit

protocol LeagueListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}

class LeagueListViewController: UIViewController {
    private var service = LeagueListService()
    private var viewModel: LeagueListViewModel?
    
    private var tableView: UITableView = {
        let leaguesTable = UITableView()
        leaguesTable.translatesAutoresizingMaskIntoConstraints = false
        return leaguesTable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LeagueListViewModel(service: service, delegate: self)
        viewModel?.getLeagues()
        
        setupView()
        setupConstraints()
        
    }
    
    private func setupView () {
        title = "Ligas"
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        navigationController?.navigationBar.prefersLargeTitles  = true
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(LeagueListTableCell.self, forCellReuseIdentifier: String(describing: LeagueListTableCell.self))
        
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
    }
}

extension LeagueListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamList = self.viewModel?.getLeague(at: indexPath.row)

        let strLeagueSelected = teamList?.strLeague ?? "No tenemos ligas" // Liga Seleccionada
        let newStrLeagues = strLeagueSelected.replacingOccurrences(of: " ", with: "_") // Remplazo Espacio de las ligas
       
        let vc = TeamListViewController()
        vc.url = Constants().teamsListURL + newStrLeagues // Anido para completar la URL

        self.navigationController?.pushViewController(vc, animated: true)

    }
}

extension LeagueListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getLeagueCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LeagueListTableCell.self)) as? LeagueListTableCell else {
            return UITableViewCell()
        }
        
        let league = viewModel?.getLeague(at: indexPath.row)
        cell.name = league?.strLeague
        
        return cell
    }
    
}

extension LeagueListViewController: LeagueListDelegate {
    
    func toogleLoading() {
        print("Loading League List")
    }

    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showError() {
        print("Error en League List")
    }
    
}
