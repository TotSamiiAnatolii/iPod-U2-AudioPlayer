//
//  PlayerBaseViewController.swift
//  iPod U2 AudioPlayer
//
//  Created by APPLE on 23.09.2023.
//

import UIKit

protocol ControlActionable {
    func onAction(sender: ButtonPlayer)
}

class PlayerBaseViewController<ContentView: UIView>: UIViewController, ControlActionable {
            
    open var contentView: ContentView {
        guard let view = self.view as? ContentView else { return ContentView()}
        return view
    }
    
    override func loadView() {
        super.loadView()
        self.view = PlayerView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureNavigationBar(letftItem: UIImage?, header: String) {
        guard let navControl = self.navigationController as? IPodNavigationController else { return
        }
        navControl.setupNavigationBar(leftItem: letftItem, header: header)
    }
    
    open func switchButton(sender: ButtonPlayer)  {
        
    }
    
    open func prepareView() {
        self.view.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func onAction(sender: ButtonPlayer) {
        
    }
}

