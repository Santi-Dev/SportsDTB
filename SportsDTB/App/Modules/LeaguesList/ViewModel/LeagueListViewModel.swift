//
//  LeagueListViewModel.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 17/06/22.
//

import Foundation

class LeagueListViewModel {
    
    private var service: LeagueListService
    private var leagues = [League]()
    private var delegate: LeagueListDelegate
    
    init(service: LeagueListService, delegate: LeagueListDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func getLeagues () {
        self.delegate.toogleLoading()
        service.getLeagues { leagues in
            self.delegate.toogleLoading()
            self.leagues = leagues
            //let leagueCompleteUrl = self.leagues
            self.delegate.reloadTable()
            
        } onError: {
            self.delegate.showError()
        }
    }
    
    func getLeague(at index: Int) -> League {
        return leagues[index]
    }
    
    func getLeagueCount () -> Int {
        return leagues.count
    }
}
