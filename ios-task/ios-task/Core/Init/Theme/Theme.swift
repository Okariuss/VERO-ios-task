//
//  Theme.swift
//  ios-task
//
//  Created by Okan Orkun on 2.02.2024.
//

import Foundation

struct Theme {
    let themeFont: ThemeFont
}

extension Theme {
    static var defaultTheme: Theme {
        return Theme(
            themeFont: ThemeFont(
                headlineFont: FontSize.headline.toFont.boldVersion,
                bodyFont: FontSize.body.toFont.boldVersion,
                subtitleFont: FontSize.subtitle.toFont
            )
        )
    }
}
