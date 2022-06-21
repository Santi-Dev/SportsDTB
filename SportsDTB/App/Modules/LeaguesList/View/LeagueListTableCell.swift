//
//  LeagueListTableCell.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 19/06/22.
//

import Foundation
import UIKit

class LeagueListTableCell: UITableViewCell {
    
    var name: String? {
        didSet {
            leagueName.text = name
        }
    }
    
    private lazy var leagueName: UILabel = {
        let leagueLabel = UILabel()
        leagueLabel.translatesAutoresizingMaskIntoConstraints = false
        leagueLabel.textColor = .darkGray
        return leagueLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:= has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(leagueName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leagueName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            leagueName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            leagueName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            leagueName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)])
    }
}

