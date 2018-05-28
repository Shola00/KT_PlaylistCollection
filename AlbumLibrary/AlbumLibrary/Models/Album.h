//
//  Album.h
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (strong, nonatomic) NSString *albumName;
@property (strong, nonatomic) NSNumber *year;
@property (strong, nonatomic) NSString *genre;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSNumber *duration;
@property (strong, nonatomic) NSString *songs;

@end
