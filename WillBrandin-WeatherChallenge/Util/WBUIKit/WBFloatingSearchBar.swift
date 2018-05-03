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
    
    lazy var textFieldTitle: UILabel! = {
        let label = UILabel()
        //label.text = "Search"
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField! = {
        let textField = UITextField()
        textField.placeholder = "Search" //Put in enum
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.textColor = WBColors.darkBlue
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nameStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(textFieldTitle)
        stackView.addArrangedSubview(textField)
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    ///Used in order to resize search bar without effecting img.
    lazy var searchBarStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(imgView)
        stackView.addArrangedSubview(nameStackView)
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
        addSpacer()
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
        //textField.heightAnchor.constraint(equalTo: searchBarStackView.heightAnchor).isActive = true
    }
    
    private func addSpacer(){
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
    }

    private func formatTextField(){
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.white
        textField.autocorrectionType = .yes
        textField.keyboardType = .default
        textField.returnKeyType = .search
        textField.contentVerticalAlignment = .center
        textField.textColor = UIColor.black
    }
    
    /**
     Configures the title appearence for the text field.
     *To be called on textDid(Begin/End)Editing methods*
     
     Cases:
     * isEmpty
        * Title should be "" and placeholder will the "Title".
     * isEditing:
        * Title is "Title" and placeholder is gone cause editing. Title is blue.
     
    */
    func updateTitleForEditingText(){
        if textField.isEditing {
            if let fieldText = textField.text {
                if fieldText.count == 0 {
                    textFieldTitle.fadeTransition(0.4)
                    
                    textFieldTitle.text = "Search"
                    textFieldTitle.textColor = .blue
                    textField.placeholder = ""
                }
            }
        } else {
            if let fieldText = textField.text {
                if fieldText.count == 0 {
                    textFieldTitle?.fadeTransition(0.4)
                    
                    textFieldTitle?.text = ""
                    textField.placeholder = "Search"
                } else {
                    textFieldTitle?.fadeTransition(0.4)
        
                    textFieldTitle?.text = "Search"
                    //textFieldTitle?.textColor = UIColor.lightGray
                    updateTitleColorsForValidation()
                    textField.placeholder = ""
                }
            }
        }
        
    
    }
    
    //TODO: - Add Validation methods with protocol to make this a lot simpler.
    /**
     Called after textFieldDidEndEditing.
     
     Cases:
     * isValid
        * Title will be shade of green.
     * isInValid
        * Title will be red.
    */
    func updateTitleColorsForValidation(searchFailed: Bool = false){
        //Contains
        if textField.text == nil || textField.text == "123456" || searchFailed {
            textFieldTitle.textColor = .red
        } else {
            textFieldTitle.textColor = .green
        }
    }
    
    
    
}






