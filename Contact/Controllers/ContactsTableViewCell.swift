//
//  ContactsTableViewCell.swift
//  Contact
//
//  Created by Mutlu Çalkan on 13.04.2022.
//

import UIKit
import SnapKit

class ContactsTableViewCell: UITableViewCell {
    
    static let identifier = "ContactsTableViewCell"
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.textAlignment = .left
        
        return label
    }()
    
    let jobTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.font = label.font.italic
        label.textAlignment = .center
        return label
    }()
    
    let contactImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        return image
    }()
    
    let flagImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(jobTitleLabel)
        contentView.addSubview(contactImage)
        contentView.addSubview(flagImage)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints(){
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp_centerYWithinMargins)
            make.left.equalTo(contactImage.snp_rightMargin).offset(20)
            make.right.equalTo(flagImage.snp_leftMargin).offset(-20)
        }
        jobTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(contactImage.snp_rightMargin).offset(20)
        }
        contactImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp_centerYWithinMargins)
            make.left.equalTo(contentView.snp_leftMargin).offset(5)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        flagImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp_centerYWithinMargins)
            make.right.equalTo(contentView.snp_rightMargin).offset(-15)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
    
    
}
