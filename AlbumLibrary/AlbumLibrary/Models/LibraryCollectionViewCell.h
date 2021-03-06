//
//  LibraryCollectionViewCell.h
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 01/06/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *myAlbumImage;
@property (nonatomic, strong) UILabel *albumTitleLabel;
@property (nonatomic, strong) UILabel *artistLabel;

@end
