//
//  Album.h
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Album : NSObject

@property (strong, nonatomic) NSString *albumName;
@property (strong, nonatomic) NSNumber *year;
@property (strong, nonatomic) NSString *genre;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSNumber *duration;
@property (strong, nonatomic) NSArray *songs;
@property (nonatomic, strong) NSString *albumArtURL;
@property (nonatomic, strong) NSString *albumArtLocalImgName;

- (instancetype)initWithDictionary:(NSDictionary *)albumDictionary;
-(UIImage *)getAlbumImage;

@end
