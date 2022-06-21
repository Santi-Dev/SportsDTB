//
//  TeamListTableCell.swift
//  SportsDTB
//
//  Created by Santiago Barragan Leon on 20/06/22.
//

import UIKit

class TeamListTableCell: UITableViewCell {
    
    var urlLogo: String = ""
    
    var name: String? {
        didSet {
            teamName.text = name
        }
    }
    var stadium: String? {
        didSet {
            stadiumName.text = stadium
        }
    }
    var year: String? {
        didSet {
            yearFoundation.text = year
        }
    }
    
    var urlL: String? {
        didSet {
            urlLogo = urlL!
            let urlIm = URL(string: urlLogo)
            aImage.load(url: urlIm!)
        }
    }
    

    private lazy var teamName: UILabel = {
        let teamLabel = UILabel()
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.textColor = .darkGray
        return teamLabel
    }()
    
    private lazy var stadiumName: UILabel = {
        let stadiumName = UILabel()
        stadiumName.translatesAutoresizingMaskIntoConstraints = false
        stadiumName.textColor = .darkGray
        return stadiumName
    }()
    
    private lazy var yearFoundation: UILabel = {
        let yearFoundation = UILabel()
        yearFoundation.translatesAutoresizingMaskIntoConstraints = false
        yearFoundation.textColor = .darkGray
        return yearFoundation
    }()
    
    private lazy var aImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.contentMode = .scaleAspectFit
        return aImage
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
        contentView.addSubview(teamName)
        contentView.addSubview(stadiumName)
        contentView.addSubview(yearFoundation)
        contentView.addSubview(aImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            aImage.heightAnchor.constraint(equalToConstant: 65),
            aImage.widthAnchor.constraint(equalToConstant: 65),
            aImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            aImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            teamName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            teamName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            teamName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        
            stadiumName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            stadiumName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stadiumName.topAnchor.constraint(equalTo: teamName.topAnchor, constant: 22),
        
            yearFoundation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            yearFoundation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            yearFoundation.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            yearFoundation.topAnchor.constraint(equalTo: stadiumName.topAnchor, constant: 22),])
        
    }
}

