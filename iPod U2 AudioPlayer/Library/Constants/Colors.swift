//
//  Colors.swift
//  iPod U2 AudioPlayer
//
//  Created by APPLE on 14.03.2023.
//

import UIKit

enum Colors {
    
    static let displayColor: UIColor = #colorLiteral(red: 0.1035038212, green: 0.3966653317, blue: 0.9954437594, alpha: 1)
    
    static let newDisplayColor: UIColor = #colorLiteral(red: 0.9477133579, green: 0.9920332414, blue: 1, alpha: 1)
    
    static let shadowDisplayColor: CGColor = #colorLiteral(red: 0.3312136776, green: 0.3538864809, blue: 0.3218994991, alpha: 1).cgColor

    static let shadowKeyBoardButtonColor: UIColor = #colorLiteral(red: 0.2768285479, green: 0.2830350164, blue: 0.2745786159, alpha: 1)

    static let borderDisplayColor: CGColor = UIColor.white.cgColor

    static let borderColor: UIColor = #colorLiteral(red: 0.1829668087, green: 0.2217157496, blue: 0.3078191764, alpha: 1)

    // Color for gradientLayer
    static let backTop: CGColor = #colorLiteral(red: 0.8064520055, green: 0.8064520055, blue: 0.8064520055, alpha: 1).cgColor
    
    static let backWhite: CGColor = UIColor.white.cgColor
    
    static let backMiddle: CGColor = #colorLiteral(red: 0.8460944521, green: 0.8460944521, blue: 0.8460944521, alpha: 1).cgColor
    
    static let backBottom: CGColor = UIColor.white.cgColor

    static let progreesTop: CGColor = #colorLiteral(red: 0, green: 0.2532890872, blue: 0.7186652602, alpha: 1).withAlphaComponent(0.7).cgColor
    
    static let progressWhite: CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    
    static let progressMiddle: CGColor = #colorLiteral(red: 0.1624934885, green: 0.465655829, blue: 0.7104727751, alpha: 1).withAlphaComponent(0.8).cgColor
    
    static let progressBottom: CGColor = #colorLiteral(red: 0.1624934885, green: 0.465655829, blue: 0.7104727751, alpha: 1).withAlphaComponent(0.8).cgColor
    
}