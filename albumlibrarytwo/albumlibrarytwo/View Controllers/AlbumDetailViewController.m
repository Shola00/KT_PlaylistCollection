//
//  AlbumDetailViewController.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "AlbumDetailViewController.h"
#import "AppDelegate.h"
#import "AlbumLibrary.h"
#import "Album.h"
#import "MainViewController.h"
#import "SongsTableViewCell.h"


@interface AlbumDetailViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *albumArtImageView;
@property (nonatomic, strong) UIImage *albumArtImage;
@property (nonatomic, strong) UILabel *albumNameLabel;
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *genreLabel;
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *shuffleButton;
@property (nonatomic, strong) UIImageView *dotImage;
@property (nonatomic, strong) UIImageView *playButtonImage;
@property (nonatomic, strong) UIImageView *shuffleButtonImage;
@property (nonatomic, strong) UITableView *songsTableView;
@property (nonatomic, strong) UIImageView *line1;
@property (nonatomic, strong) UIImageView *line2;

@end

@implementation AlbumDetailViewController
@synthesize albumArtImage = _albumArtImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    self.songsTableView = [[UITableView alloc] init];
    self.songsTableView.delegate = self;
    self.songsTableView.dataSource = self;
    [self.songsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"songsCell"];
    self.songsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.songsTableView];
    
    
    self.albumArtImageView = [[UIImageView alloc] init];
    self.albumArtImageView.image = [self.album getAlbumImage];
    self.albumArtImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.albumArtImageView.backgroundColor = [UIColor colorWithRed:(248/255.0) green:(247/255.0) blue:(251/255.0) alpha:1];
    self.albumArtImageView.layer.cornerRadius = 10;
    [self.view addSubview:self.albumArtImageView];
    
    //pass the exact album image name, artist name, genre label and year label to the detail view controller
    
    /*
     creating four UIlabels for Album Title, Artist Name, Genre and year.
     */
    
    self.albumNameLabel = [[UILabel alloc] init];
    self.albumNameLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.albumNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.albumNameLabel];
    self.albumNameLabel.text = self.album.albumName;
    
    self.artistLabel = [[UILabel alloc] init];
    self.artistLabel.text = @"artistLabel";
    self.artistLabel.textColor = [UIColor colorWithRed:(246/255.0) green:(71/255.0) blue:(89/255.0) alpha:1];
    self.artistLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.artistLabel];
    self.artistLabel.text = self.album.artist;

    self.genreLabel = [[UILabel alloc] init];
    self.genreLabel.text = @"genreLabel";
    self.genreLabel.textColor = [UIColor colorWithRed:(135/255.0) green:(135/255.0) blue:(138/255.0) alpha:1];
    self.genreLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.genreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.genreLabel];
    self.genreLabel.text = self.album.genre;
    
    self.yearLabel = [[UILabel alloc] init];
    self.yearLabel.text = @"yearLabel";
    self.yearLabel.textColor = [UIColor colorWithRed:(135/255.0) green:(135/255.0) blue:(138/255.0) alpha:1];
    self.yearLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.yearLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.yearLabel];
    self.yearLabel.text = [NSString stringWithFormat:@"%@", self.album.year];

    self.dotImage = [[UIImageView alloc] init];
    self.dotImage.image = [UIImage imageNamed:@"dot"];
    self.dotImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.dotImage];
    
    self.playButton = [UIButton new];
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    [self.playButton setBackgroundColor:[UIColor colorWithRed:(248/255.0) green:(247/255.0) blue:(251/255.0) alpha:1]];
    self.playButton.layer.cornerRadius = 10;
    self.playButton.clipsToBounds = YES;
    [self.playButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal ];
    [self.playButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.playButton = self.playButton;

    UIImageView *playButtonImage = [[UIImageView alloc] init];
    playButtonImage.image = [UIImage imageNamed:@"play-button.png"];
    playButtonImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.playButtonImage = playButtonImage;
    [self.playButton addSubview:self.playButtonImage];


    [self.view addSubview: self.playButton];


    self.shuffleButton = [UIButton new];
    [self.shuffleButton setTitle:@"shuffle" forState:UIControlStateNormal];
    [self.shuffleButton setBackgroundColor:[UIColor colorWithRed:(248/255.0) green:(247/255.0) blue:(251/255.0) alpha:1]];
    self.shuffleButton.layer.cornerRadius = 10;
    self.shuffleButton.clipsToBounds = YES;
    [self.shuffleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.shuffleButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.shuffleButton = self.shuffleButton;

    self.shuffleButtonImage = [[UIImageView alloc] init];
    self.shuffleButtonImage.image = [UIImage imageNamed:@"shuffle-button.png"];
    self.shuffleButtonImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.shuffleButtonImage = self.shuffleButtonImage;
    [self.shuffleButton addSubview:self.shuffleButtonImage];

    [self.view addSubview:self.shuffleButton];
    
    self.line1 = [UIImageView new];
    [self.line1 setBackgroundColor:[UIColor colorWithRed:(222/255.0) green:(222/255.0) blue:(222/255.0) alpha:1]];
    [self.line1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.line1];
    
    self.line2 = [UIImageView new];
    [self.line2 setBackgroundColor:[UIColor colorWithRed:(222/255.0) green:(222/255.0) blue:(222/255.0) alpha:1]];
    [self.line2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.line2];
    

    
// add album songs to the super view
/* how this is going to be done
 create mutiple labels according to the number of songs in array
 
 
  or
 1 create a method
 2 print out multiple songs on new lines from album array
 3 return the songs in that new method
 4 add the method to a label
 
 */
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGSize albumArtImageViewSize = CGSizeMake(156, 156);
    CGSize dotImageSize = CGSizeMake(5, 5);
    
    CGFloat titleButtonWidthMultiplier = 0.43;
    CGFloat titleButtonHeightConstant = 50;
    CGFloat spaceBetweenAlbumAndButtons = 30;
    CGSize playButtonIconSize = CGSizeMake(15, 15);
    CGSize line1HeightSize = CGSizeMake(0.9, 0.9);
    CGFloat spaceBetweenPlayButtonTextAndPlayIcon = -30;
    CGFloat spaceBetweenShuffleButtonAndShuffleIcon = -40;

    
    
    //the left anchor of the albumArtImageView is constraint to the left anchor of the superView constant(N)
        [self.albumArtImageView.leftAnchor constraintEqualToAnchor:self.albumArtImageView.superview.leftAnchor constant:20].active = YES;
    
    //the top anchor of the albumArtImageView is constraint to the top anchor of the superView constant(N)
        [self.albumArtImageView.topAnchor constraintEqualToAnchor:self.albumArtImageView.superview.topAnchor constant:80].active = YES;
    
    //the bottom of the albumArtImageView is constraint to the bottom of the superView constant(N)
    [self.albumArtImageView.heightAnchor constraintEqualToConstant:albumArtImageViewSize.height].active = YES;
    
    //the width anchor of the albumArtImageView is
    [self.albumArtImageView.widthAnchor constraintEqualToConstant:albumArtImageViewSize.width].active = YES;
    
    [self.line1.topAnchor constraintEqualToAnchor:self.albumArtImageView.bottomAnchor constant:15].active = YES;
    [self.line1.widthAnchor constraintEqualToAnchor:self.line1.superview.widthAnchor multiplier:0.9].active = YES;
    [self.line1.leftAnchor constraintEqualToAnchor:self.albumArtImageView.leftAnchor].active = YES;
    [self.line1.heightAnchor constraintEqualToConstant:line1HeightSize.height].active = YES;
    
    [self.line2.topAnchor constraintEqualToAnchor:self.playButton.bottomAnchor constant:10].active = YES;
    [self.line2.widthAnchor constraintEqualToAnchor:self.line1.superview.widthAnchor multiplier:0.9].active = YES;
    [self.line2.leftAnchor constraintEqualToAnchor:self.playButton.leftAnchor].active = YES;
    [self.line2.heightAnchor constraintEqualToConstant:line1HeightSize.height].active = YES;
    
    /*
     specify the autoLayouts of the AlbumNameLabel, ArtistNameLabel, GenreLabel, YearLabel
     first, the layout of the AlbumNameLabel.
     1, the left anchor of the artist label is constraint to the right anchor of the albumImageViewLabel with constant(n)
     2,the top anchor of the artist label is constraint to the top anchor of the superView with constant (n)
     FOR the layout of the ArtistNameLabel
     1,the top anchor of the artistNameLabel is constraint to the buttom of the AlbumNameLabel with constant (n)
     
     */
    
    //1, the left anchor of the albumNameLabel is constraint to the right anchor of the albumImageView with constant(n)
    [self.albumNameLabel.leftAnchor constraintEqualToAnchor:self.albumArtImageView.rightAnchor constant:20].active = YES;
    
    //the top anchor of the albumNameLabel is constraint to the top anchor of the superView with contant (n)
    [self.albumNameLabel.topAnchor constraintEqualToAnchor:self.artistLabel.superview.topAnchor constant:82].active = YES;
    
    //1, the left anchor of the artist label is constraint to the right anchor of the albumImageView with constant(n)
    [self.artistLabel.leftAnchor constraintEqualToAnchor:self.albumArtImageView.rightAnchor constant:20].active = YES;
    
    //the top anchor of the artist label is constraint to the bottom anchor of albumName with contant (n)
    [self.artistLabel.topAnchor constraintEqualToAnchor:self.albumNameLabel.bottomAnchor constant:2].active = YES;
    
    //1, the left anchor of the artist label is constraint to the right anchor of the albumImageView with constant(n)
    [self.genreLabel.leftAnchor constraintEqualToAnchor:self.albumArtImageView.rightAnchor constant:20].active = YES;
    
    //the top anchor of the artist label is constraint to the bottom anchor of albumName with contant (n)
    [self.genreLabel.topAnchor constraintEqualToAnchor:self.artistLabel.bottomAnchor constant:2].active = YES;
    
    
    //

    //the top anchor of the yearLabel is constraint to the bottom anchor of artistLabel with contant (n)
    
    
    [self.dotImage.heightAnchor constraintEqualToConstant:dotImageSize.height].active = YES;
    
    //the width anchor of the albumArtImageView is
    [self.dotImage.widthAnchor constraintEqualToConstant:dotImageSize.width].active = YES;
    [self.dotImage.leftAnchor constraintEqualToAnchor:self.genreLabel.rightAnchor constant:6].active = YES;
    [self.dotImage.topAnchor constraintEqualToAnchor:self.artistLabel.bottomAnchor constant:12].active = YES;
    
    [self.yearLabel.leftAnchor constraintEqualToAnchor:self.dotImage.rightAnchor constant:6].active = YES;
    [self.yearLabel.topAnchor constraintEqualToAnchor:self.artistLabel.bottomAnchor constant:2].active = YES;

    //
    
    
    [self.playButtonImage.centerYAnchor constraintEqualToAnchor:self.playButtonImage.superview.centerYAnchor].active = YES;
    
    [self.playButtonImage.rightAnchor constraintEqualToAnchor:self.playButtonImage.superview.centerXAnchor constant: spaceBetweenPlayButtonTextAndPlayIcon].active = YES;
    
    [self.playButtonImage.widthAnchor constraintEqualToConstant:playButtonIconSize.width].active = YES;
    [self.playButtonImage.heightAnchor constraintEqualToConstant:playButtonIconSize.height].active = YES;
    
    [self.playButton.widthAnchor constraintEqualToAnchor:self.playButton.superview.widthAnchor multiplier:titleButtonWidthMultiplier].active = YES;
    
    [self.playButton.heightAnchor constraintEqualToConstant:titleButtonHeightConstant].active = YES;
    
    
    [self.playButton.leftAnchor constraintEqualToAnchor:self.albumArtImageView.leftAnchor].active = YES;
    
    [self.playButton.topAnchor constraintEqualToAnchor:self.albumArtImageView.bottomAnchor constant:spaceBetweenAlbumAndButtons].active = YES;
    
    
    [self.shuffleButtonImage.centerYAnchor constraintEqualToAnchor:self.shuffleButtonImage.superview.centerYAnchor].active = YES;
    
    [self.shuffleButtonImage.widthAnchor constraintEqualToConstant:playButtonIconSize.width].active = YES;
    [self.shuffleButtonImage.heightAnchor constraintEqualToConstant:playButtonIconSize.height].active = YES;
    [self.shuffleButtonImage.rightAnchor constraintEqualToAnchor:self.shuffleButtonImage.superview.centerXAnchor constant:spaceBetweenShuffleButtonAndShuffleIcon].active = YES;
    
    
    [self.shuffleButton.heightAnchor constraintEqualToConstant:titleButtonHeightConstant].active = YES;
    [self.shuffleButton.rightAnchor
     constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    [self.shuffleButton.topAnchor constraintEqualToAnchor:self.albumArtImageView.bottomAnchor constant:spaceBetweenAlbumAndButtons].active = YES;
    [self.shuffleButton.leftAnchor constraintEqualToAnchor:self.playButton.rightAnchor constant:20].active = YES;

    [self.songsTableView.topAnchor constraintEqualToAnchor:self.line2.bottomAnchor constant:10].active = YES;
    [self.songsTableView.widthAnchor constraintEqualToAnchor:self.songsTableView.superview.widthAnchor multiplier:0.94].active =YES;
    [self.songsTableView.bottomAnchor constraintEqualToAnchor:self.songsTableView.superview.bottomAnchor].active = YES;
    
    
    
    
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//-(Album *)getAlbumSongWithIndex:(NSInteger *)index {
//
//    //NSDictionary *currentAlbumDict = [[[AlbumLibrary sharedInstance] library] objectAtIndex:index];
//
//    Album *currentAlbum = [[Album alloc] init];
//    [currentAlbum getAlbumWithIndex:index];
//
//
//
//    return currentAlbum;
//}



- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *songsCell = (UITableViewCell  *)[tableView dequeueReusableCellWithIdentifier:@"songsCell" forIndexPath:indexPath];
    
    //songsCell.albumSong = [self getAlbumSongWithIndex:indexPath.row];
    
    //newLibraryCell.album = [self getAlbumWithIndex:indexPath.row];
    
        //songsCell.textLabel.text = _album.songs[indexPath.row];
    
    
    
    
     songsCell.textLabel.text = [NSString stringWithFormat:@"%li    %@",indexPath.row+1, _album.songs[indexPath.row]];
 
    return songsCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.album.songs.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  43;
    
}


@end
