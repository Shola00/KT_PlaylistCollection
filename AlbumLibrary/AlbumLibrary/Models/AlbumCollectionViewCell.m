//
//  AlbumCollectionViewCell.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 30/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "AlbumCollectionViewCell.h"
#import "UIView+ExtraLayout.h"

@interface AlbumCollectionViewCell()

@property (nonatomic, strong) UIImageView *albumImageView;

@end

@implementation AlbumCollectionViewCell




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _artistLabel = [[UILabel alloc] init];
        _albumTitleLabel = [[UILabel alloc] init];
        
        [self.backgroundView constrainToFillSuperView];
        
    }
    return self;
}

//this method is called whenever someone tries to GET/access the albumImageView property
-(UIImageView *)albumImageView {
    
    if (_albumImageView == nil) {
        
    }
    
    return _albumImageView;
}

//this method is called whenever someone tries to GET/access the albumImage property
-(UIImage *)myAlbumImage {
    
    if ( _myAlbumImage == nil) {
        _myAlbumImage = [UIImage imageNamed:@"shuffle-button.png"];
        _albumImageView = [[UIImageView alloc] initWithImage: _myAlbumImage];
        [self.backgroundView addSubview:_albumImageView];
        [_albumImageView constrainToFillSuperView];
    }
    
    return self.myAlbumImage;
}


-(void)setMyAlbumImage:(UIImage *)myAlbumImage {
    
    _myAlbumImage = myAlbumImage;
    
    if (_albumImageView == nil) {
        _albumImageView = [[UIImageView alloc] initWithImage: _myAlbumImage];
        [self.backgroundView addSubview:_albumImageView];
        [_albumImageView constrainToFillSuperView];
    }
    
}


-(void)prepareForReuse
{
    [super prepareForReuse];
}





@end
