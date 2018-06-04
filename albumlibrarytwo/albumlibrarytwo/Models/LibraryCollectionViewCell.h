//
//  LibraryCollectionViewCell.h
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 01/06/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Album;
@interface LibraryCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) Album *album;

@end
