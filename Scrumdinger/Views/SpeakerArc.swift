//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Ayrmidon Hagraven on 5/13/24.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeakers: Double {
        360.0 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeakers * Double(speakerIndex) + 1.0)
    }
    
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeakers - 1.0)
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 15.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

