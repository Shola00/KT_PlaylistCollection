//
//  MainViewController.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 28/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "LibraryCollectionViewCell.h"
#import "Album.h"
#import "AlbumLibrary.h"
#import "AlbumDetailViewController.h"
#import "UIView+ExtraLayout.h"

@interface MainViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *albumLabel;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *shuffleButton;
@property (nonatomic, strong) UIImageView *playButtonImage;
@property (nonatomic, strong) UIImageView *shuffleButtonImage;
@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.title = @"Albums";
    self.navigationItem.titleView = [[UIView alloc] init];
    
    
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView registerClass:[LibraryCollectionViewCell class] forCellWithReuseIdentifier:@"libraryCell"];
    
 
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [self.collectionView reloadData];
    
    [self.view addSubview:self.collectionView];
    

    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Albums";
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:30];
    self.albumLabel = label;
    self.albumLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.albumLabel];
    

    
    UIButton *playButton = [UIButton new];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    [playButton setBackgroundColor:[UIColor colorWithRed:(248/255.0) green:(247/255.0) blue:(251/255.0) alpha:1]];
    playButton.layer.cornerRadius = 10;
    playButton.clipsToBounds = YES;
    [playButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal ];
    [playButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.playButton = playButton;

    UIImageView *playButtonImage = [[UIImageView alloc] init];
    playButtonImage.image = [UIImage imageNamed:@"play-button.png"];
    playButtonImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.playButtonImage = playButtonImage;
    [playButton addSubview:self.playButtonImage];


    [self.view addSubview: self.playButton];
    
    
    UIButton *shuffleButton = [UIButton new];
    [shuffleButton setTitle:@"shuffle" forState:UIControlStateNormal];
    [shuffleButton setBackgroundColor:[UIColor colorWithRed:(248/255.0) green:(247/255.0) blue:(251/255.0) alpha:1]];
    shuffleButton.layer.cornerRadius = 10;
    shuffleButton.clipsToBounds = YES;
    [shuffleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [shuffleButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.shuffleButton = shuffleButton;

    UIImageView *shuffleButtonImage = [[UIImageView alloc] init];
    shuffleButtonImage.image = [UIImage imageNamed:@"shuffle-button.png"];
    shuffleButtonImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.shuffleButtonImage = shuffleButtonImage;
    [shuffleButton addSubview:self.shuffleButtonImage];

    [self.view addSubview:self.shuffleButton];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = self.view.frame.size.width * 0.85;
    CGFloat height = 215;
    return CGSizeMake(width/2, height);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[AlbumLibrary sharedInstance] library].count;
}


-(Album *)getAlbumWithIndex:(NSInteger)index
{
    NSDictionary *currentAlbumDictionaryData = [[[AlbumLibrary sharedInstance] library] objectAtIndex:index];
    
    Album *currentAlbum = [[Album alloc] initWithDictionary: currentAlbumDictionaryData];
    
    return currentAlbum;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LibraryCollectionViewCell *newLibraryCell = (LibraryCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"libraryCell" forIndexPath:indexPath];

    newLibraryCell.album = [self getAlbumWithIndex:indexPath.row];
    
   return newLibraryCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumDetailViewController *detailViewController = [[AlbumDetailViewController alloc] init];
    detailViewController.album = [self getAlbumWithIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat titleButtonWidthMultiplier = 0.43;
    CGFloat titleButtonHeightConstant = 55;
    CGFloat spaceBetweenAlbumAndButtons = 25;
    CGSize playButtonIconSize = CGSizeMake(15, 15);
    CGFloat spaceBetweenPlayButtonTextAndPlayIcon = -30;
    CGFloat spaceBetweenShuffleButtonAndShuffleIcon = -40;
    CGFloat collectionViewMultiplier = 0.9;
    
    
    [self.playButtonImage.centerYAnchor constraintEqualToAnchor:self.playButtonImage.superview.centerYAnchor].active = YES;

    [self.playButtonImage.rightAnchor constraintEqualToAnchor:self.playButtonImage.superview.centerXAnchor constant: spaceBetweenPlayButtonTextAndPlayIcon].active = YES;

    [self.playButtonImage.widthAnchor constraintEqualToConstant:playButtonIconSize.width].active = YES;
    [self.playButtonImage.heightAnchor constraintEqualToConstant:playButtonIconSize.height].active = YES;

    [self.playButton.widthAnchor constraintEqualToAnchor:self.playButton.superview.widthAnchor multiplier:titleButtonWidthMultiplier].active = YES;

    [self.playButton.heightAnchor constraintEqualToConstant:titleButtonHeightConstant].active = YES;
    
    [self.albumLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:(screenSize.height * 0.11)].active = YES;
    
    [self.albumLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = YES;
    
    [self.playButton.leftAnchor constraintEqualToAnchor:self.albumLabel.leftAnchor].active = YES;
    
    [self.playButton.topAnchor constraintEqualToAnchor:self.albumLabel.bottomAnchor constant:spaceBetweenAlbumAndButtons].active = YES;
    

    [self.shuffleButtonImage.centerYAnchor constraintEqualToAnchor:self.shuffleButtonImage.superview.centerYAnchor].active = YES;

    [self.shuffleButtonImage.widthAnchor constraintEqualToConstant:playButtonIconSize.width].active = YES;
    [self.shuffleButtonImage.heightAnchor constraintEqualToConstant:playButtonIconSize.height].active = YES;
    [self.shuffleButtonImage.rightAnchor constraintEqualToAnchor:self.shuffleButtonImage.superview.centerXAnchor constant:spaceBetweenShuffleButtonAndShuffleIcon].active = YES;
    
    
    [self.shuffleButton.heightAnchor constraintEqualToConstant:titleButtonHeightConstant].active = YES;
    [self.shuffleButton.rightAnchor
        constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
    [self.shuffleButton.topAnchor constraintEqualToAnchor:self.albumLabel.bottomAnchor constant:spaceBetweenAlbumAndButtons].active = YES;
    [self.shuffleButton.leftAnchor constraintEqualToAnchor:self.playButton.rightAnchor constant:20].active = YES;


    
    //the TOP ANCHOR of the collectionview should be positioned under the BOTTOM of the play BUTTON ANCHOR with little spacing UNDER the buttons
    [self.collectionView.topAnchor constraintEqualToAnchor:self.playButton.bottomAnchor constant:20].active = YES;
    
    //the width of the collectionview is 90% the width of the superview
    [self.collectionView.widthAnchor constraintEqualToAnchor:self.collectionView.superview.widthAnchor multiplier:collectionViewMultiplier].active = YES;
    
    //the center of the collectionview is centered to the x-axis.
    [self.collectionView.centerXAnchor constraintEqualToAnchor:self.collectionView.superview.centerXAnchor].active = YES;
    
    
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.collectionView.superview.bottomAnchor].active = YES;
    
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
