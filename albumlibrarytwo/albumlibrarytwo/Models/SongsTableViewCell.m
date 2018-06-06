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

@property (nonatomic, strong) UILabel *songLabel;
@property (nonatomic, strong) UILabel *songNumber;

@end


@implementation SongsTableViewCell
@synthesize songLabel = _songLabell;

-(void)setIndex:(NSInteger *)index {
    
    self.songLabel = [[UILabel alloc] init];
    self.songLabel.text = _albumSong.songs;
    
    self.songNumber = [[UILabel alloc] init];
    self.songNumber.text = [NSString stringWithFormat:@"%d", index +1];
    
    [self.contentView addSubview:self.songNumber];
    [self.contentView addSubview:self.songLabel];
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews {
    [self.songNumber.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.songNumber.leftAnchor constraintEqualToAnchor:self.superview.leftAnchor].active = YES;
    [self.songLabel.leftAnchor constraintEqualToAnchor:self.songNumber.rightAnchor constant:10].active = YES;
}

@end
