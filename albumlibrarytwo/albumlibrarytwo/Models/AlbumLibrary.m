//
//  AlbumLibrary.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "AlbumLibrary.h"

NSString *const kAlbumName = @"albumName";
NSString *const kYear = @"year";
NSString *const kGenre = @"genre";
NSString *const kArtist = @"artist";
NSString *const kDuration = @"duration";
NSString *const kSongs = @"songs";

@implementation AlbumLibrary


+(id) sharedInstance {
    
    static AlbumLibrary *library = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        library = [[self alloc] init];
    });
    return library;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _library = @[@{kAlbumName: @"ADELE 21",
                       kYear: @"2011",
                       kGenre: @"Pop",
                       kArtist: @"Adele",
                       kDuration: @"4.45",
                       kSongs: @[
                               @"Rolling In The Deep",@"Rumour Has It",@"Turning Tables",@"Don't You Remember", @"Set Fire To The Rain", @"He Won't Go", @"Take It All", @"I'll Be Waiting", @"One And Only", @"Lovesong", @"Someone Like You", @"I Found A Boy"
                               ]
                    },@{kAlbumName: @"DAMN",
                        kYear: @"2017",
                        kGenre: @"Hip-hop/Rap",
                        kArtist: @"Kendrick Lamar",
                        kDuration: @"58.08",
                        kSongs: @[
                               @"BLOOD",@"DNA",@"YAH", @"ELEMENT", @"FEEL", @"LOYALTY", @"PRIDE", @"HUMBLE",
                               @"LUST", @"LOVE", @"XXX",@"FEAR",@"GOD",@"DUCKWORTH"
                                ]
                    },
                     @{kAlbumName: @"4:44",
                       kYear: @"2017",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"JAY-Z",
                       kDuration: @"36.45",
                       kSongs: @[
                               @"Kill Jay Z",@"The Story of O.J",@"Smile (feat. Gloria Carter)",@"Caught Their Eyes (feat. Frank Ocean)", @"4:44", @"Family Feud (feat. Beyoncé)", @"Bam (feat. Damian Jr. Gong Marley)", @"Moonlight", @"Marcy Me", @"Legacy"
                               ]
                   },
                     @{kAlbumName: @"More Life",
                       kYear: @"2011",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"Drake",
                       kDuration: @"1.21",
                       kSongs: @[
                               @"Free Smoke",@"No Long Talk (feat. Giggs)",@"Passionfruit",@"Jorja Interlude", @"Get It Together (feat. Black Coffee & Jorja Smith)", @"Madiba Riddim", @"Blem", @"Gyalchester", @"Portland (feat. Quavo & Travis Scott)"
                               ]
                   },@{kAlbumName: @"Pretty Girls Like Trap Music",
                       kYear: @"2017",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"2 Chainz",
                       kDuration: @"1.10",
                       kSongs: @[
                               @"Saturday Night",@"Riverdale Rd",@"Good Drank (feat. Gucci Mane & Quavo)",@"4 AM (feat. Travis Scott)", @"Door Swangin", @"Realize (feat. Nicki Minaj)", @"Big Amount (feat. Drake)", @"It's a Vibe (feat. Ty Dolla $ign, Trey Songz & Jhené Aiko)", @"Rolls Royce Bitch"
                               ]
                   },@{kAlbumName: @"Issa Album",
                       kYear: @"2017",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"21 Savage",
                       kDuration: @"56.00",
                       kSongs: @[
                               @"Famous",@"Close My Eyes",@"Bank Account", @"Bad Business", @"Baby Girl", @"Thug Life", @"FaceTime", @"Nothin New", @"Numb", @"Dead People"
                               ]
                   },@{kAlbumName: @"Wins & Losses",
                       kYear: @"2017",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"Meek Mill",
                       kDuration: @"1.65",
                       kSongs: @[
                               @"Wins & Losses",@"Heavy Heart",@"F**k That Check Up (feat. Lil Uzi Vert)",@"Whatever You Need (feat. Chris Brown & Ty Dolla $ign)", @"1942 Flows", @"Issues", @"We Ball (feat. Young Thug)", @"These Scars (feat. Future & Guordan Banks)", @"Connect the Dots (feat. Yo Gotti & Rick Ross)", @"Fall Thru"
                               ]
                   },@{kAlbumName: @"True to Self",
                       kYear: @"2017",
                       kGenre: @"R&B/Soul",
                       kArtist: @"Bryson Tiller",
                       kDuration: @"58.45",
                       kSongs: @[
                               @"Rain On Me (Intro)",@"No Longer Friends",@"Don't Get Too High",@"Blowing Smoke", @"We Both Know", @"You Got It", @"In Check", @"Self-Made", @"Run Me Dry", @"High Stakes"
                               ]
                   },@{kAlbumName: @"Birds in the Trap Sing McKnight",
                       kYear: @"2016",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"Travis Scott",
                       kDuration: @"53.45",
                       kSongs: @[
                               @"the ends",@"way back",@"coordinate",@"through the late night", @"beibs in the trap", @"sweet sweet", @"outside", @"goosebumps", @"first take", @"pick up the phone", @"lose", @"guidance"
                               ]
                   },@{kAlbumName: @"4 Your Eyez Only",
                       kYear: @"2016",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"J. Cole",
                       kDuration: @"44.45",
                       kSongs: @[
                               @"For Whom the Bell Tolls",@"Immortal",@"Deja Vu",@"Ville Mentality", @"She's Mine, Pt. 1", @"Change", @"Neighbors", @"Foldin Clothes", @"She's Mine, Pt. 2", @"4 Your Eyez Only"
                               ]
                   },@{kAlbumName: @"Slime Season 3",
                       kYear: @"2016",
                       kGenre: @"Hip-Hop",
                       kArtist: @"Young Thug",
                       kDuration: @"28.45",
                       kSongs: @[
                               @"With Them",@"Memo",@"Drippin'",@"Slime S**t (feat. Yak Gotti, Duke & Peewee Roscoe)", @"Digits", @"Worth It", @"Tattoos", @"Problem"
                               ]
                   },@{kAlbumName: @"ANTI ",
                       kYear: @"2016",
                       kGenre: @"Pop",
                       kArtist: @"Rihanna",
                       kDuration: @"52.05",
                       kSongs: @[
                               @"Consideration (feat. SZA)",@"James Joint",@"Kiss It Better",@"Work (feat. Drake)", @"Desperado", @"Woo", @"Needed Me", @"Yeah, I Said It", @"Same Ol’ Mistakes", @"Never Ending"
                               ]
                   },@{kAlbumName: @"I Told You",
                       kYear: @"2016",
                       kGenre: @"Hip-Hop",
                       kArtist: @"Tory Lanez",
                       kDuration: @"1.18",
                       kSongs: @[
                               @"I Told You / Another One",@"Guns and Roses",@"Flex",@"To D.R.E.A.M", @"4am Flex", @"Friends with Benefits", @"Cold Hard Love", @"High", @"Dirty Money", @"Question Is"
                               ]
                   },@{kAlbumName: @"Lemonade",
                       kYear: @"2016",
                       kGenre: @"Pop",
                       kArtist: @"Adele",
                       kDuration: @"1.51",
                       kSongs: @[
                               @"Pray You Catch Me",@"Hold Up",@"Don't Hurt Yourself (feat. Jack White)",@"Sorry", @"6 Inch (feat. The Weeknd)", @"Daddy Lessons", @"Love Drought", @"Sandcastles", @"Forward (feat. James Blake)", @"Freedom (feat. Kendrick Lamar)"
                               ]
                   },@{kAlbumName: @"Starboy",
                       kYear: @"2016",
                       kGenre: @"Pop",
                       kArtist: @"The Weeknd",
                       kDuration: @"4.45",
                       kSongs: @[
                               @"Starboy (feat. Daft Punk)",@"Party Monster",@"False Alarm",@"Reminder", @"Rockin’", @"Secrets", @"True Colors", @"Stargirl Interlude (feat. Lana Del Rey)", @"Sidewalks (feat. Kendrick Lamar)", @"Six Feet Under"
                               ]
                   },@{kAlbumName: @"Know-It-All",
                       kYear: @"2015",
                       kGenre: @"Pop",
                       kArtist: @"Alessia Cara",
                       kDuration: @"47.45",
                       kSongs: @[
                               @"Seventeen",@"Here",@"Outlaws",@"I'm Yours", @"Four Pink Walls", @"Wild Things", @"Stone (feat. Sebastian Kole)", @"Overdoseg", @"Stars", @"Scars to Your Beautiful"
                               ]
                   },@{kAlbumName: @"The Life of Pablo",
                       kYear: @"2011",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"Kanye West",
                       kDuration: @"1.45",
                       kSongs: @[
                               @"Ultralight Beam",@"Pt. 2",@"Famous",@"Feedback", @"Low Lights", @"Highlights", @"Freestyle 4", @"I Love Kanye", @"Waves", @"FML"
                               ]
                   },@{kAlbumName: @"DS2 (Deluxe)",
                       kYear: @"2015",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"Future",
                       kDuration: @"1.05",
                       kSongs: @[
                               @"Thought It Was a Drought",@"I Serve the Base",@"Where Ya At (feat. Drake)",@"Groupies", @"Lil One", @"Stick Talk", @"Freak Hoe", @"Rotation", @"Slave Master", @"Blow a Bag"
                               ]
                   },@{kAlbumName: @"KOD",
                       kYear: @"2018",
                       kGenre: @"Hip-Hop/Rap",
                       kArtist: @"J. Cole",
                       kDuration: @"42.45",
                       kSongs: @[
                               @"Intro",@"Photograph",@"The Cut Off (feat. kiLL edward)",@"ATM", @"Motiv8", @"Kevin's Heart", @"Brackets", @"once an Addict (Interlude)", @"Friends (feat. kiLL edward)", @"Window Pain (Outro)", @"1985 (Intro to The Fall Off)"
                               ]
                   }];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
