//
//  PlayerView.swift
//  iPod U2 AudioPlayer
//
//  Created by APPLE on 14.03.2023.
//

import UIKit

final class PlayerView: UIView {
    
    private let innerShadow = CALayer()
    
    private let heightProgressBar: CGFloat = 20
    
    private let heightStateView: CGFloat = 35
    
    private let indent: CGFloat = 15
    
    private let horizontalIndent: CGFloat = 10
    
    private let borderWidth: CGFloat = 0.7
    
    private let topIndentProgressBar: CGFloat = 20
    
    private let borderColor = Colors.borderDisplayColor
        
    private let progressBar = ProgressBar(frame: .zero)
    
    private let labelCount = UILabel()
        .setMyStyle(font: Fonts.countTrack)
    
    private let labelNameTrack = UILabel()
        .setMyStyle(font: Fonts.nameTrack)
    
    private let labelNameOwner = UILabel()
        .setMyStyle(font: Fonts.general)
    
    private let labelNameAlbum = UILabel()
        .setMyStyle(font: Fonts.general)
    
    private let labelCurrentTime = UILabel()
        .setMyStyle(font: Fonts.general)
    
    private let labelDurationTime = UILabel()
        .setMyStyle(font: Fonts.general)
    
    private let imageTrack = UIImageView()
        .setMyStyle()
    
    private let mainStackView = UIStackView()
        .myStyleStack(
            spacing: 10,
            aligment: .fill,
            axis: .vertical,
            distribution: .equalSpacing,
            userInteraction: false)
    
    private func setupView() {
        self.backgroundColor = Colors.newDisplayColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarhies()
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewHierarhies() {

        self.addSubview(labelCount)
        self.addSubview(imageTrack)
        self.addSubview(mainStackView)
        mainStackView.addArrangedSubview(labelNameTrack)
        mainStackView.addArrangedSubview(labelNameAlbum)
        mainStackView.addArrangedSubview(labelNameOwner)
        self.addSubview(progressBar)
        self.addSubview(labelCurrentTime)
        self.addSubview(labelDurationTime)
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            labelCount.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: indent),
            labelCount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indent)
        ])
        
        NSLayoutConstraint.activate([
            imageTrack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            imageTrack.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            imageTrack.topAnchor.constraint(equalTo: labelCount.bottomAnchor, constant: indent),
            imageTrack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: indent)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: imageTrack.centerYAnchor),
            mainStackView.leftAnchor.constraint(equalTo: imageTrack.rightAnchor, constant: indent),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -horizontalIndent)
        ])
        
        NSLayoutConstraint.activate([
            progressBar.heightAnchor.constraint(equalToConstant: heightProgressBar),
            progressBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            progressBar.topAnchor.constraint(equalTo: imageTrack.bottomAnchor, constant: topIndentProgressBar),
            progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelCurrentTime.leftAnchor.constraint(equalTo: progressBar.leftAnchor),
            labelCurrentTime.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: horizontalIndent)
        ])
        
        NSLayoutConstraint.activate([
            labelDurationTime.rightAnchor.constraint(equalTo: progressBar.rightAnchor),
            labelDurationTime.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: horizontalIndent)
        ])
    }
    
    override func draw(_ rect: CGRect) {
        self.addInnerShadow(layer: innerShadow)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.progressBar.layer.cornerRadius = 2
        self.imageTrack.layer.cornerRadius = 2
    }
    
//    private func setStateCurrent(state: StatePlayer) {
////        switch state {
////        case .pause:
////            self.imageCurrentState.image = Images.pause
////        case .play:
////            self.imageCurrentState.image = Images.play
////        }
//    }

    public func updateProgressView(model: ModelProgressTrack) {
        self.labelCurrentTime.text = model.currentTime.stringFromTimeInterval()
        self.labelDurationTime.text = "-\(model.currentDuration.stringFromTimeInterval())"
        self.progressBar.convertValue(value: model.progress)
//        setStateCurrent(state: model.stateCurrent)
    }
}
extension PlayerView: ConfigurableView {
    func configure(with model: ModelPlayTrackDisplay) {
        self.labelCurrentTime.text = model.currentTime
        self.labelDurationTime.text = model.durationTime
        self.labelNameTrack.text = model.nameTrack
        self.labelNameOwner.text = model.namePerformer
        self.labelNameAlbum.text = model.nameAlbum
        self.imageTrack.image = model.imageTrack
        self.labelCount.text = ("\(model.countTrack.0) of \(model.countTrack.1)")
    }
    
    typealias Model = ModelPlayTrackDisplay
}
