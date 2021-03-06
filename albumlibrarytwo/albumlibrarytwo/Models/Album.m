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
        _songs = [NSArray arrayWithArray:[albumDictionary objectForKey:kSongs]];
        _duration = [albumDictionary objectForKey:kDuration];
        NSString *albumArtURL = (NSString *)[albumDictionary objectForKey:kAlbumArt];
        NSString *albumArtLocalImgName = (NSString *)[albumDictionary objectForKey:kAlbumLocalImage];
        _albumArtURL = ( albumArtURL == nil || albumArtURL.length == 0) ? @"" : albumArtURL;
        _albumArtLocalImgName = (albumArtLocalImgName == nil || albumArtLocalImgName.length == 0) ? @"" : albumArtLocalImgName;
        
    }
    return self;
    
}

-(void)getAlbumWithIndex:(NSInteger)index{
    
    self.currentSong = [[NSString alloc] initWithString:self.songs[index]];
    
    self.songNumber = [NSString stringWithFormat:@"%ld",index +1];
    
}


-(UIImage *)getAlbumImage {
    
    UIImage *albumImage = nil;
    
    if (self.albumArtURL && self.albumArtURL.length > 0) {
        albumImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: self.albumArtURL]]];
    }
    else if(self.albumName && self.albumName.length > 0){
        albumImage = [UIImage imageNamed:self.albumName];
    }
    else {
        albumImage = [UIImage imageNamed:@"DEFAULT IMAGE"];
    }
    
    return albumImage;
}

@end
