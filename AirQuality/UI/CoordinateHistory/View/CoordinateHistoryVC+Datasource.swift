//
//  CoordinateHistoryVC+Datasource.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import Foundation
extension CoordinateHistoryVC : TableViewCellDelegate {
    func viewSelected(cell: CoordinateHistoryTableViewCell) {
        if let index = tableview.index(cell){
            viewModel.handleItem(position: index)
        }
    }
}

