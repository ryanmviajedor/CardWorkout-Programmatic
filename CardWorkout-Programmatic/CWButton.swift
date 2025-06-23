//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Ryan Viajedor on 6/23/25.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(color: UIColor, title: String, systemImageName: String) {
        super.init(frame: .zero)
        
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.cornerStyle = .medium
        
        // Set image with custom size
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium) // Adjust size & weight
        configuration?.image = UIImage(systemName: systemImageName, withConfiguration: symbolConfig)
        configuration?.imagePadding = 4
        configuration?.imagePlacement = .leading
        
        // Make the Title Bold
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: UIFont.buttonFontSize)
            return outgoing
        }
        
        translatesAutoresizingMaskIntoConstraints = false // use auto layout
    }

}
