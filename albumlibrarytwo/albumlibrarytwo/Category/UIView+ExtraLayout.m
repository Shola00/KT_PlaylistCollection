//
//  UIView+ExtraLayout.m
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 31/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import "UIView+ExtraLayout.h"

@implementation UIView (ExtraLayout)

-(void)constrainToFillSuperView {
    [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.widthAnchor constraintEqualToAnchor:self.superview.widthAnchor multiplier:1].active = YES;
    [self.heightAnchor constraintEqualToAnchor:self.superview.heightAnchor multiplier:1].active = YES;
    [self.centerXAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerXAnchor].active = YES;
    [self.centerYAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerYAnchor].active = YES;
}


-(void)constrainToFillSuperViewWithHeightMultiplier:(double)multiplier {
    
    [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.widthAnchor constraintEqualToAnchor:self.superview.widthAnchor multiplier:1].active = YES;
    [self.heightAnchor constraintEqualToAnchor:self.superview.heightAnchor multiplier:multiplier].active = YES;
    [self.centerXAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerXAnchor].active = YES;
//    [self.centerYAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerYAnchor].active = YES;
}

-(void)constrainToFillSuperViewWithWidthMultiplier:(double)multiplier {
    [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.widthAnchor constraintEqualToAnchor:self.superview.widthAnchor multiplier:multiplier].active = YES;
    [self.heightAnchor constraintEqualToAnchor:self.superview.heightAnchor multiplier:1].active = YES;
    [self.centerXAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerXAnchor].active = YES;
//    [self.centerYAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerYAnchor].active = YES;
}

-(void)constrainToFillSuperViewWithWidthMultiplier:(double)wMultiplier heightMultiplier:(double)hMultiplier {
    [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.widthAnchor constraintEqualToAnchor:self.superview.widthAnchor multiplier:wMultiplier].active = YES;
    [self.heightAnchor constraintEqualToAnchor:self.superview.heightAnchor multiplier:hMultiplier].active = YES;
    [self.centerXAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerXAnchor].active = YES;
//    [self.centerYAnchor constraintGreaterThanOrEqualToAnchor:self.superview.centerYAnchor].active = YES;
}

//-(void)playButtonAndImageConstrain {
//
//
//}

@end
