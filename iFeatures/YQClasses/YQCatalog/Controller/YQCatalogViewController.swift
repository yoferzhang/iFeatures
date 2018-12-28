//
//  YQCatalogViewController.swift
//  iFeatures
//
//  Created by yoferzhang on 2018/12/27.
//  Copyright © 2018 yoferzhang. All rights reserved.
//

import UIKit

class YQCatalogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var tableView: UITableView!
    var catalogModels: [YQCatalogModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initViews()
    }
    
    func initData() {
        do {
            let catalogModel = YQCatalogModel(catalogType: .ImageRecognition, title: "图像识别-Core ML", summary: "使用 Inception V3 识别物体")
            catalogModels.append(catalogModel)
        }
        
//        do {
//            let catalogModel = YQCatalogModel(catalogType: .ImageRecognition, title: "图像识别-Core ML", summary: "使用 Inception V3 识别物体")
//            catalogModels.append(catalogModel)
//        }
        
    }
    
    func initViews() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        view.addSubview(tableView)
    }
    
    // MARK: - tableViewDelegate & tableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row >= catalogModels.count) {
            return UITableViewCell(style: .default, reuseIdentifier: "UnKnowUITableViewCell")
        }
        
        let catalogModel = catalogModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = catalogModel.title
        cell.detailTextLabel?.text = catalogModel.summary
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if (indexPath.row >= catalogModels.count) {
            return
        }
        
        let catalogModel = catalogModels[indexPath.row]

        switch catalogModel.catalogType {
        case .UnKnow:
            return
        case .ImageRecognition:
            let viewController = YQImageRecognitionViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            fatalError("Failed to deal the select event of table view cell for catalog view controoler")
        }
    }
}
