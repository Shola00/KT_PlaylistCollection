//
//  AlbumLibrary.h
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const kAlbumName;
extern NSString *const kYear;
extern NSString *const kGenre;
extern NSString *const kArtist;
extern NSString *const kDuration;
extern NSString *const kSongs;

@interface AlbumLibrary : NSObject

@property (nonatomic, strong) NSArray *library;

+(id) sharedInstance;

@end
