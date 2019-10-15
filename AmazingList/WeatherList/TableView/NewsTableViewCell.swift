//
//  NewsTableViewCell.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit
import SDWebImage

final class NewsTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.frame = CGRect(
            x: 8,
            y: 8,
            width: bounds.height - 16,
            height: bounds.height - 16
        )

        titleLabel.frame = CGRect(
            x: iconImageView.frame.maxX + 8,
            y: 8,
            width: bounds.width - iconImageView.frame.maxX - 16,
            height: 25
        )

        contentLabel.frame = CGRect(
            x: iconImageView.frame.maxX + 8,
            y: titleLabel.frame.maxY,
            width: bounds.width - iconImageView.frame.maxX - 16,
            height: 50
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.sd_cancelCurrentImageLoad()
        iconImageView.image = nil
    }

    private func setupUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(contentLabel)
    }
}
