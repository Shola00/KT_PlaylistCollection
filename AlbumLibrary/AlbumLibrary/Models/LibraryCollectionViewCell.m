//
//  LibraryCollectionViewCell.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 01/06/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "LibraryCollectionViewCell.h"
#import "UIView+ExtraLayout.h"

@interface LibraryCollectionViewCell ()

@property (nonatomic, strong) UIImageView *albumImageView;

@end

@implementation LibraryCollectionViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _artistLabel = [[UILabel alloc] init];
        _albumTitleLabel = [[UILabel alloc] init];
    }
    return self;
}


//declaring a getter method that gets called whenever the myAlbumImage property value is accessed
-(UIImage *)myAlbumImage {
    
    if (_myAlbumImage == nil) {
        _myAlbumImage = [UIImage imageNamed:@"shuffle-button.png"];
        _albumImageView = [[UIImageView alloc] initWithImage: _myAlbumImage];
        [self.backgroundView addSubview:_albumImageView];
        
    }
    
    return self.myAlbumImage;
}


//declaring a setter method which gets called anytime the property is changed
//-(void)setMyAlbumImage:(UIImage *)myAlbumImage {
//
//
//}



@end
