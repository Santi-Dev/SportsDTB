//
//  TeamListViewModel.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 20/06/22.
//

import Foundation

class TeamListViewModel {
    
    private var service: TeamListService
    private var teams = [Team]()
    private var delegate: TeamListDelegate
    private var url: String
    
    init(url: String, service: TeamListService, delegate: TeamListDelegate) {
        self.url = url
        self.service = service
        self.delegate = delegate
    }
    
    func getTeams () {
        self.delegate.toogleLoading()
        service.getTeams(url: url) { teams in
            self.teams = teams
            self.delegate.reloadTable()
            self.delegate.loadingSuccess()
        } onError: {
            self.delegate.showError()
        }
    }
    
    func getTeam (at index: Int) -> Team {
        return teams[index]
    }
    
    func getTeamCount () -> Int {
        return teams.count
    }
}
