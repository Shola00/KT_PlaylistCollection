//
//  Album.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "Album.h"
#import "AlbumLibrary.h"

@implementation Album



- (instancetype)initWithDictionary:(NSDictionary *)albumDictionary {
    
    self = [super init];
    
    if (self) {
        
        _albumName = [albumDictionary objectForKey:kAlbumName];
        //       _artist = [albumDictionary objectForKey:kArtist];
        _artist = [albumDictionary objectForKey:kArtist];
        _genre = [albumDictionary objectForKey:kGenre ];
        _year = [albumDictionary objectForKey:kYear];
        _songs = [albumDictionary objectForKey:kSongs];
        _duration = [albumDictionary objectForKey:kDuration];
        NSString *albumArtURL = (NSString *)[albumDictionary objectForKey:kAlbumArt];
        NSString *albumArtLocalImgName = (NSString *)[albumDictionary objectForKey:kAlbumLocalImage];
        _albumArtURL = ( albumArtURL == nil || albumArtURL.length == 0) ? @"" : albumArtURL;
        _albumArtLocalImgName = (albumArtLocalImgName == nil || albumArtLocalImgName.length == 0) ? @"" : albumArtLocalImgName;
        
    }
    return self;
    
}



@end
