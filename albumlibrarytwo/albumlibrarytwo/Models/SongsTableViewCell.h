//
//  SongsTableViewCell.h
//  albumlibrarytwo
//
//  Created by Shola Emmanuel on 06/06/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Album;
@interface SongsTableViewCell : UITableViewCell

@property (strong, nonatomic) Album *albumSong;

-(void)setIndex:(NSInteger *)index;

@end
