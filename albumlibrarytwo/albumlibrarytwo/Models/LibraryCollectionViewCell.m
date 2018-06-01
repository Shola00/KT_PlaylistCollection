//
//  LibraryCollectionViewCell.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 01/06/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "LibraryCollectionViewCell.h"
#import "UIView+ExtraLayout.h"
#import "Album.h"

@interface LibraryCollectionViewCell ()

@property (nonatomic, strong) UIImageView *albumImageView;


@end

@implementation LibraryCollectionViewCell
@synthesize myAlbumImage = _myAlbumImage;
@synthesize albumTitleLabel = _albumTitleLabel;


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _artistNameLabel = [[UILabel alloc] init];
//        _albumTitleLabel = [[UILabel alloc] init];
//        [_albumImageView constrainToFillSuperView];
    }
    return self;
}


//declaring a getter method that gets called whenever the myAlbumImage property value is accessed

-(UIImage *)myAlbumImage {
 
    if (_myAlbumImage == nil) {
        _myAlbumImage = [UIImage imageNamed:@"shuffle-button.png"];
        _albumImageView = [[UIImageView alloc] initWithImage: _myAlbumImage];
        [self.contentView addSubview:_albumImageView];
        [_albumImageView constrainToFillSuperView];
 
    }
 
    return self.myAlbumImage;
}


//declaring a setter method which gets called anytime the property is changed
-(void)setMyAlbumImage:(UIImage *)myAlbumImage {
        if ( _myAlbumImage == nil) {
            _myAlbumImage = myAlbumImage;
            _albumImageView = [[UIImageView alloc] initWithImage: myAlbumImage];
            _albumImageView.translatesAutoresizingMaskIntoConstraints = NO;
            [self.contentView addSubview:_albumImageView];
        }
}

-(UILabel *)albumTitleLabel {
    if (_albumTitleLabel == nil) {
        _albumTitleLabel = [[UILabel alloc] init];
        _albumTitleLabel.text = @"artist title";
        _albumTitleLabel.font = [UIFont fontWithName:@"Arial Bold" size:15];
        _albumTitleLabel.numberOfLines = 1;
        _albumTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_albumTitleLabel];
        [self.albumTitleLabel.topAnchor constraintEqualToAnchor:self.albumImageView.bottomAnchor constant:3].active = YES;

    }
    return _albumTitleLabel;
}

-(UILabel *)artistNameLabel {
    if (_artistNameLabel == nil) {
        _artistNameLabel = [[UILabel alloc] init];
        _artistNameLabel.text =  self.album.artist[0];
        _artistNameLabel.font = [UIFont fontWithName:@"Arial Bold" size:15];
        _artistNameLabel.numberOfLines = 1;
        _artistNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_artistNameLabel];
        [self.artistNameLabel.topAnchor constraintEqualToAnchor:self.albumTitleLabel.bottomAnchor constant:3].active = YES;
    }
    return _artistNameLabel;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    if (self.albumImageView && self.albumImageView.superview) {
        [self.albumImageView constrainToFillSuperView];
        
    }
}

-(void)prepareForReuse
{
    [super prepareForReuse];
}

@end
