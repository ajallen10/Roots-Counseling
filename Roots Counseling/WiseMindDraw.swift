//
//  WiseMindDraw.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 9/14/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit

class WiseMindDraw: UIView {

    override func draw(_ rect: CGRect) {
        // Get the Graphics Context
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0);
            
            // Create Circle
            let center = CGPoint(x: (frame.size.width/2) - 75, y: frame.size.height/2)
            let radius = (frame.size.width - 160)/2
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
                
            // Draw
            context.strokePath()
        }
        
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0);
            
            // Create Circle
            let center = CGPoint(x: (frame.size.width/2) + 75, y: frame.size.height/2)
            let radius = (frame.size.width - 160)/2
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
                
            // Draw
            context.strokePath()
        }
    }

}
