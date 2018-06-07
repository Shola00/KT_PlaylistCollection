//
//  SongsTableViewCell.m
//  albumlibrarytwo
//
//  Created by Shola Emmanuel on 06/06/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "SongsTableViewCell.h"
#import "Album.h"

@interface SongsTableViewCell()

@property (nonatomic, strong) UILabel *songNameLabel;
@property (nonatomic, strong) UILabel *songNumberLabel;

@end


@implementation SongsTableViewCell
//@synthesize songLabel = _songLabell;


-(void)setAlbumSong:(Album *)albumSong {
    albumSong = _albumSong;
    
    if (!self.songNameLabel) {
        self.songNameLabel = [[UILabel alloc]init];
        self.songNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    self.songNameLabel.text = _albumSong.currentSong;
    
    if (!self.songNameLabel.superview) {
        [self.contentView addSubview:self.songNameLabel];
    }
    
    if (!self.songNumberLabel) {
        self.songNumberLabel = [[UILabel alloc]init];
        self.songNumberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    self.songNumberLabel.text = _albumSong.songNumber;
    
    if (!self.songNumberLabel.superview) {
        [self.contentView addSubview:self.songNumberLabel];
    }
    
}




//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}


-(void)layoutSubviews {
    [super layoutSubviews];
    
    [self.songNameLabel. widthAnchor constraintEqualToAnchor:self.songNameLabel.superview.widthAnchor multiplier:0.85].active = YES;
    //[self.songNameLabel.rightAnchor constraintEqualToAnchor:self.songNameLabel.superview.rightAnchor].active = YES;
    [self.songNameLabel.topAnchor constraintEqualToAnchor:self.songNameLabel.superview.topAnchor].active = YES;
    
    
//    [self.songNumberLabel.widthAnchor constraintEqualToAnchor:self.songNumberLabel.superview.widthAnchor multiplier:0.15].active = YES;
//    [self.songNumberLabel.leftAnchor constraintEqualToAnchor:self.songNumberLabel.superview.leftAnchor].active = YES;
//    [self.songNumberLabel.topAnchor constraintEqualToAnchor:self.songNumberLabel.superview.topAnchor].active = YES;
}

@end
