//
//  WBFloatingSearchBar.swift
//  WillBrandin-WeatherChallenge
//
//  Created by William Brandin on 4/24/18.
//  Copyright © 2018 William Brandin. All rights reserved.
//

import UIKit

class WBFloatingSearchBar: UIView, CornerRoundable, Shadowable {

    //MARK: - UI Elements
    lazy var imgView: UIImageView! = {
        let imageView = UIImageView()
        imageView.image = WBImages.search
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var textField: UITextField! = {
        let textField = UITextField()
        textField.placeholder = "Search a City"
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.textColor = WBColors.darkBlue
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    ///Used in order to resize search bar without effecting img.
    lazy var searchBarStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(imgView)
        stackView.addArrangedSubview(textField)
        stackView.spacing = 8.0
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Init
    func initSearchBar(){
        self.backgroundColor = UIColor.white
        setupStackViewConstraints()
        formatTextField()
        roundCorners()
        makeShadow()
    }
    
    
    //MARK: - Methods
    private func setupStackViewConstraints(){
        addSubview(searchBarStackView)
        searchBarStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0).isActive = true
        searchBarStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0).isActive = true
        searchBarStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
        searchBarStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0).isActive = true
        
        imgView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: searchBarStackView.heightAnchor).isActive = true
    }
    

    private func formatTextField(){
        
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.white
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .search
        textField.contentVerticalAlignment = .center
        textField.textColor = UIColor.black
    }
    
    

}
