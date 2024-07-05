//
//  ConnectionAlert+Localization.swift
//  App
//
//  Created by MGAbouarab on 14/01/2024.
//

import Foundation

extension String {
    var connectionAlertLocalizable: String {
        return NSLocalizedString(self, tableName: "ConnectionAlertLocalizable", bundle: Bundle.main, value: "", comment: "")
    }
}
