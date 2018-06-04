//
//  UIView+ExtraLayout.h
//  AlbumLibrary
//
//  Created by Shola Emmanuel on 31/05/2018.
//  Copyright © 2018 KaiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExtraLayout)

-(void)constrainToFillSuperView;
-(void)constrainToFillSuperViewWithHeightMultiplier:(double)multiplier;
-(void)constrainToFillSuperViewWithWidthMultiplier:(double)multiplier;
-(void)constrainToFillSuperViewWithWidthMultiplier:(double)wMultiplier heightMultiplier:(double)hMultiplier;

@end
