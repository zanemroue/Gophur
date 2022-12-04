//
//  PostPreviewTableViewCell.swift
//  Gophur
//
//  Created by Zane Mroue on 03/12/2022.
//

import UIKit

class PostPreviewTableCellViewModel{
    let title: String
    let imageUrl: URL?
    var imageData: Data?
    
    init(title: String, imageUrl: URL? ){
        self.title = title
        self.imageUrl = imageUrl
    }
}

class PostPreviewTableViewCell: UITableViewCell {
    static let identifier = "PostPreviewTableViewCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let postTitleLabel: UILabel = {//creates the label for the post
        let label = UILabel()
        label.numberOfLines = 0 //allows for line wrap
        label.font = .systemFont(ofSize: 20, weight: .medium)//size and boldness of font
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(postImageView)//adds subview
        contentView.addSubview(postTitleLabel)//adds subview
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    override func layoutSubviews() {//creates frame of post preview view
        super.layoutSubviews()
        postImageView.frame = CGRect(x: separatorInset.left,
                                     y: 5,
                                     width: contentView.fs_height-10,
                                     height: contentView.fs_height-10)
        postTitleLabel.frame = CGRect(x: separatorInset.right,
                                      y: 5,
                                      width: 5,
                                      height: 5)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        postTitleLabel.text = nil
        postImageView.image = nil
    }
    func configure(with viewModel: PostPreviewTableCellViewModel){
        postTitleLabel.text = viewModel.title
        if let data = viewModel.imageData{
            postImageView.image = UIImage(data: data)
        }else if let url = viewModel.imageUrl{
            //Fetch image and cache it
            let task = URLSession.shared.dataTask(with: url){[weak self]data, _,_
                in guard let data = data else{
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.postImageView.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
