//
//  TableViewCell.swift
//  DuplicatedRepeatingCellsUI
//
//  Created by Kairat on 9/24/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

protocol ReloadDataDelagate {
    func reloadData()
}

class TableViewCell: UITableViewCell {
    
    var delegate: ReloadDataDelagate?
    
    var textImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textImage)
        textImage.translatesAutoresizingMaskIntoConstraints = false
        [textImage.topAnchor.constraint(equalTo: self.topAnchor),
         textImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         textImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         textImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate?.reloadData()
    }
}
