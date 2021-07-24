//
//  CoordinateHistoryDatasource.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import UIKit

class CoordinateHistoryDatasource<Cell: UITableViewCell,ViewModel> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier :String!
    var items :[ViewModel]!
    var configureCell :(Cell,ViewModel) -> ()
    var loadMore:(() -> ())?
    
    init(cellIdentifier :String, items :[ViewModel], configureCell: @escaping (Cell,ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
}
