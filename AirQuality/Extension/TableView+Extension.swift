//
//  TableView+Extension.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import UIKit
extension UITableView {
    func index(_ cell : UITableViewCell) -> Int? {
        guard let indexPath = self.indexPath(for: cell) else { return nil}
        return indexPath.row
    }
}
