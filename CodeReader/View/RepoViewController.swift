//
//  RepoViewController.swift
//  CodeReader
//
//  Created by vulgur on 16/5/12.
//  Copyright © 2016年 MAD. All rights reserved.
//

import UIKit
import Bond
import Kingfisher

class RepoViewController: UIViewController {
    
    let descriptionFontSize: CGFloat = 18.0
    let descriptionLabelHeight: CGFloat = 22.0
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var repoNameLabel: UILabel!
    @IBOutlet var repoDescriptionLabel: UILabel!
    
    @IBOutlet var starsLabel: UILabel!
    @IBOutlet var watchersLabel: UILabel!
    @IBOutlet var forksLabel: UILabel!
    @IBOutlet var createdDateLabel: UILabel!
    @IBOutlet var updatedDateLabel: UILabel!
    
    var viewModel: RepoViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()
        viewModel.fetchWatchers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Private methods
    private func setupUI() {
        // Set the text aligment of description label based on string length
        let contraintSize = CGSize(width: CGFloat.max, height: descriptionLabelHeight)
        let fontAttribute = [NSFontAttributeName: UIFont.systemFontOfSize(descriptionFontSize)]
        let stringRect = (viewModel.description.value as NSString).boundingRectWithSize(contraintSize,
                                                                                            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                                                                                            attributes: fontAttribute,
                                                                                            context: nil)
        if CGRectGetWidth(stringRect) > CGRectGetWidth(repoDescriptionLabel.frame) {
            repoDescriptionLabel.textAlignment = .Left
        } else {
            repoDescriptionLabel.textAlignment = .Center
        }
    }
    
    private func bindViewModel() {
        
        viewModel.name.bindTo(repoNameLabel.bnd_text)
        viewModel.name.bindTo(navigationItem.bnd_title)
        viewModel.description.bindTo(repoDescriptionLabel.bnd_text)
        viewModel.stars.map {"\($0)"}.bindTo(starsLabel.bnd_text)
        viewModel.forks.map {"\($0)"}.bindTo(forksLabel.bnd_text)
        viewModel.watchers.map {"\($0)"}.bindTo(watchersLabel.bnd_text)
        viewModel.createdDate.map{ $0.componentsSeparatedByString("T").first }.bindTo(createdDateLabel.bnd_text)
        viewModel.updatedDate.map{ $0.componentsSeparatedByString("T").first }.bindTo(updatedDateLabel.bnd_text)
        
        avatarImageView.kf_setImageWithURL(NSURL(string: viewModel.avatarImageURLString.value)!)
    }
    
}