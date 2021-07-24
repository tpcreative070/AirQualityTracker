//
//  CoordinateHistoryVC.swift
//  AirQuality
//
//  Created by phong070 on 24/07/2021.
//

import UIKit

class CoordinateHistoryVC : UIViewController {
    
    var dataSource : CoordinateHistoryDatasource<CoordinateHistoryTableViewCell,CoordinateHistoryViewModelProtocol>!
    let viewModel = CoordinateHistoryVCViewModel()
    lazy var tableview : UITableView = {
        let view = UITableView()
        return view
    }()
    
    lazy var closeButton : UIButton = {
        let view = UIButton()
        view.setTitle("Close", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.makeCorner(UIColor.orange.cgColor)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bindTableView()
        bindingEvent()
    }
    
    func bindTableView() {
        self.dataSource = CoordinateHistoryDatasource(cellIdentifier: "cell", items: viewModel.data) { cell, vm in
        cell.set(vm)
        cell.delegate = self
      }
      self.tableview.dataSource = self.dataSource
    }
    
    func bindingEvent(){
        viewModel.onNavigator = {[weak self] data in
            let vc = CoordinateVC(data: data)
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func tappedClose(){
        dismiss(animated: true, completion: nil)
    }
}

