//
//  YQCatalogModel.swift
//  iFeatures
//
//  Created by yoferzhang on 2018/12/27.
//  Copyright © 2018 yoferzhang. All rights reserved.
//

import UIKit

enum YQCatalogType: Int {
    case UnKnow = 0
    case ImageRecognition = 1
}

class YQCatalogModel {
    
    var catalogType: YQCatalogType
    var title: String
    var summary: String
    
    init(catalogType: YQCatalogType, title: String, summary: String) {
        self.catalogType = catalogType
        self.title = title
        self.summary = summary
    }
    
    convenience init() {
        self.init(catalogType: .UnKnow, title: "", summary: "")
    }

}
