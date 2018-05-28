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


- (instancetype)init
{
    self = [super init];
    if (self) {
        AlbumLibrary *albumLibrary = [AlbumLibrary sharedInstance];
        NSArray *libraryArray = albumLibrary.library;
        NSDictionary *albumDictionary = libraryArray[0];
        
        _albumName = [albumDictionary objectForKey:kAlbumName];
        _artist = [albumDictionary objectForKey:kArtist];
        _genre = [albumDictionary objectForKey:kGenre ];
        _year = [albumDictionary objectForKey:kYear];
        _songs = [albumDictionary objectForKey:kSongs];
        _duration = [albumDictionary objectForKey:kDuration];
        
        
        
        
        
        
        
    }
    return self;
}


@end
