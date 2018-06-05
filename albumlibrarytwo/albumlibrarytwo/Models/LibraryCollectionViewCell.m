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
@property (nonatomic, strong) UIImage *myAlbumImage;
@property (nonatomic, strong) UILabel *albumTitleLabel;
@property (nonatomic, strong) UILabel *artistNameLabel;

@end

@implementation LibraryCollectionViewCell
@synthesize myAlbumImage = _myAlbumImage;
//@synthesize albumTitleLabel = _albumTitleLabel;




-(void)setAlbum:(Album *)album {
    
    _album = album;
    
    //if the album art has a URL
    if (_album.albumArtURL && _album.albumArtURL.length > 0) {
        //set the image to pull from the URL for the imageView
        self.myAlbumImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_album.albumArtURL]]];
    }
    else if (_album.albumArtLocalImgName)//otherwise use the local image stored
    {
        self.myAlbumImage = [UIImage imageNamed: _album.albumName];
    }
    else {
        self.myAlbumImage = [UIImage imageNamed:@"shuffle-button.png"];
    }
    
    if (!self.albumTitleLabel) {
        self.albumTitleLabel = [[UILabel alloc] init];
        self.albumTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    //this sets the content/text of the label
    self.albumTitleLabel.text = _album.albumName;
    if (!self.albumTitleLabel.superview) {
        [self.contentView addSubview:self.albumTitleLabel];
    }
    
   
    if (!self.artistNameLabel) {
        self.artistNameLabel = [[UILabel alloc] init];
        self.artistNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    //this sets the content/text of the label
    self.artistNameLabel.text = _album.artist;
    
    if (!self.artistNameLabel.superview) {
        [self.contentView addSubview:self.artistNameLabel];
    }
    
    
}


//declaring a setter method which gets called anytime the property is changed
-(void)setMyAlbumImage:(UIImage *)myAlbumImage {
    _myAlbumImage = myAlbumImage;
    _albumImageView = [[UIImageView alloc] initWithImage: _myAlbumImage];
    _albumImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_albumImageView];
}



-(void)layoutSubviews {
    
    
    
    [super layoutSubviews];
    [self.albumImageView constrainToFillSuperViewWithHeightMultiplier:0.79];
    
    [self.albumTitleLabel.widthAnchor constraintEqualToAnchor:self.albumTitleLabel.superview.widthAnchor].active = YES;
//    [self.albumTitleLabel.heightAnchor constraintEqualToConstant:10].active = YES;
    [self.albumTitleLabel.topAnchor constraintEqualToAnchor:self.albumImageView.bottomAnchor constant:3].active = YES;
    [self.artistNameLabel.topAnchor constraintEqualToAnchor:self.albumTitleLabel.bottomAnchor constant:3].active = YES;
    [self.artistNameLabel.widthAnchor constraintEqualToAnchor:self.artistNameLabel.superview.widthAnchor].active = YES;
    
//    [self.artistNameLabel.heightAnchor constraintEqualToConstant:10].active = YES;
    
}


@end
