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


@interface AlbumDetailViewController ()

@property (nonatomic, strong) UIImageView *albumArtImageView;
@property (nonatomic, strong) UIImage *albumArtImage;
@property (nonatomic, strong) UILabel *albumNameLabel;
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UILabel *genreLabel;
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *shuffleBUtton;
@property (nonatomic, strong) UILabel *songLabel;

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
    
    
    self.albumArtImageView = [[UIImageView alloc] init];
    self.albumArtImageView.image = [self.myalbum getAlbumImage];
    self.albumArtImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.albumArtImageView.backgroundColor = [UIColor colorWithRed:(248/255.0) green:(247/255.0) blue:(251/255.0) alpha:1];
    self.albumArtImageView.layer.cornerRadius = 10;
    [self.view addSubview:self.albumArtImageView];
    
    /*
     creating four UIlabels for Album Title, Artist Name, Genre and year.
     */
    
    self.albumNameLabel = [[UILabel alloc] init];
    self.albumNameLabel.text = @"AlbumName";
    self.albumNameLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.albumNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.albumNameLabel];
    
    self.artistLabel = [[UILabel alloc] init];
    self.artistLabel.text = @"artistLabel";
    self.artistLabel.textColor = [UIColor colorWithRed:(246/255.0) green:(71/255.0) blue:(89/255.0) alpha:1];
    self.artistLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.artistLabel];

    self.genreLabel = [[UILabel alloc] init];
    self.genreLabel.text = @"genreLabel";
    self.genreLabel.textColor = [UIColor colorWithRed:(135/255.0) green:(135/255.0) blue:(138/255.0) alpha:1];
    self.genreLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.genreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.genreLabel];

    
    self.yearLabel = [[UILabel alloc] init];
    self.yearLabel.text = @"yearLabel";
    self.yearLabel.textColor = [UIColor colorWithRed:(135/255.0) green:(135/255.0) blue:(138/255.0) alpha:1];
    self.yearLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.yearLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.yearLabel];

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
        CGSize albumArtImageViewSize = CGSizeMake(156, 156);
    
    //the left anchor of the albumArtImageView is constraint to the left anchor of the superView constant(N)
        [self.albumArtImageView.leftAnchor constraintEqualToAnchor:self.albumArtImageView.superview.leftAnchor constant:20].active = YES;
    
    //the top anchor of the albumArtImageView is constraint to the top anchor of the superView constant(N)
        [self.albumArtImageView.topAnchor constraintEqualToAnchor:self.albumArtImageView.superview.topAnchor constant:80].active = YES;
    
    //the bottom of the albumArtImageView is constraint to the bottom of the superView constant(N)
    [self.albumArtImageView.heightAnchor constraintEqualToConstant:albumArtImageViewSize.height].active = YES;
    
    //the width anchor of the albumArtImageView is
    [self.albumArtImageView.widthAnchor constraintEqualToConstant:albumArtImageViewSize.width].active = YES;
    
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
    
    //1, the left anchor of the artist label is constraint to the right anchor of the albumImageView with constant(n)
    [self.yearLabel.leftAnchor constraintEqualToAnchor:self.genreLabel.rightAnchor constant:8].active = YES;
    
    //the top anchor of the artist label is constraint to the bottom anchor of albumName with contant (n)
    [self.yearLabel.topAnchor constraintEqualToAnchor:self.artistLabel.bottomAnchor constant:2].active = YES;
    
    
    
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
