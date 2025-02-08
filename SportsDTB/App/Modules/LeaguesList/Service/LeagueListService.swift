//
//  LeagueListService.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 17/06/22.
//

import Foundation

class LeagueListService {
    
    func getLeagues(onComplete: @escaping ([League]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: Constants().leagueListURL) { response in
            switch response{
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        let leagueResponse = try decoder.decode(LeagueResponse.self, from: data)
                        onComplete(leagueResponse.leagues)
                    }
                } catch {
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
    }
    
}
