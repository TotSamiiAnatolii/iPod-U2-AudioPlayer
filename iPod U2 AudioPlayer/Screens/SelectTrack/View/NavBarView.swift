//
//  NavBarView.swift
//  iPod U2 AudioPlayer
//
//  Created by APPLE on 14.03.2023.
//

import UIKit

final class NavBarView: UIView {
    
    private let hieghtBorder: CGFloat = 1
    
    private let indent: CGFloat = 10
    
    private let borderView = UIView()
        .setMyStyle(color: Colors.borderColor)
    
    private let header = UILabel()
        .setMyStyle(font: Fonts.heder)

    private let battary: UIImageView = UIImageView()
        .setMyStyle()
        .setImage(image: Images.battery)
    
    init(header: String) {
        self.header.text = header
        super.init(frame: .zero)
        setupGradientView()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private func setupGradientView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let gradientView = self.layer as? CAGradientLayer else {
            return;
        }
        gradientView.colors = [Colors.topColorNavBar, Colors.bottomColorNavBar]
        gradientView.locations = [0.0, 1.0]
        gradientView.frame = self.bounds
    }
    
    private func setViewHierarhies() {
        self.addSubview(borderView)
        self.addSubview(header)
        self.addSubview(battary)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            borderView.widthAnchor.constraint(equalTo: self.widthAnchor),
            borderView.heightAnchor.constraint(equalToConstant: hieghtBorder),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            header.topAnchor.constraint(equalTo: self.topAnchor, constant: indent)
        ])
        
        NSLayoutConstraint.activate([
            battary.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            battary.widthAnchor.constraint(equalTo: battary.heightAnchor),
            battary.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -indent),
            battary.centerYAnchor.constraint(equalTo: header.centerYAnchor)
        ])
    }
}
