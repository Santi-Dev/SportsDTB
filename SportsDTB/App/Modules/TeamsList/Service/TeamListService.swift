//
//  TeamListService.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 20/06/22.
//

import Foundation

class TeamListService {
    
    func getTeams(url: String, onComplete: @escaping ([Team]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: url) { response in
            switch response{
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        let teamResponse = try decoder.decode(TeamResponse.self, from: data)
                        onComplete(teamResponse.teams)
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
