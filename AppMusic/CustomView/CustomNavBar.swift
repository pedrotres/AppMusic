//
//  CustomNavBar.swift
//  AppMusic
//
//  Created by pedro tres on 29/03/22.
//

import UIKit

class CustomNavBar: UIView {
    
    lazy var categoryTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    lazy var categorySubtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    lazy var featureLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        return l
    }()
    
    lazy var cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black.withAlphaComponent(0.7)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(cardImage)
        self.addSubview(overlayView)
        self.addSubview(categoryTitle)
        self.addSubview(categorySubtitle)
        self.addSubview(featureLabel)
    }
    
    private func setupConstraints(){
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.categorySubtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.categorySubtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.categorySubtitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor, constant: 5),
            
            self.featureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.featureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.featureLabel.topAnchor.constraint(equalTo: self.categorySubtitle.bottomAnchor, constant: 5),
        ])
    }
    
    public func setupView(data: CardViewModel){
        self.categoryTitle.text = data.categoryName
        self.categorySubtitle.text = data.cardTitle
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
    
    
    
}
