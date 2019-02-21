//
//  ExpandableView.swift
//  World
//
//  Created by APCMBP001 on 18/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

protocol ExpandleHeaderViewDelegate {
    func toggleSection(header:ExpandableView,section: Int)
}

class ExpandableView: UITableViewHeaderFooterView {


    var titleLabel = UILabel()
    var arrowLabel = UILabel()

    var delegate : ExpandleHeaderViewDelegate?
    var section  : Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowLabel)


        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc func selectHeaderAction(gesture : UITapGestureRecognizer){
        let cell = gesture.view as! ExpandableView
        delegate?.toggleSection(header: self, section: cell.section)
    }

    func customInit(title: String, section: Int, delegate: ExpandleHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let views = [
            "titleLabel" : titleLabel,
            "arrowLabel" : arrowLabel
        ]

        titleLabel.textColor = UIColor.white
        arrowLabel.textColor = UIColor.white
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[titleLabel]-[arrowLabel]-20-|",
            options: [],
            metrics: nil,
            views: views
        ))
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[titleLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[arrowLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))


        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
