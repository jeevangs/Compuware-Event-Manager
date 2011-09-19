//
//  EMAboutAppsTableViewCell.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/18/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMAboutAppsTableViewCell : UITableViewCell 
{
	IBOutlet UIImageView *appImageView;
	IBOutlet UIButton *appUrlButton;
	IBOutlet UILabel *appNameLabel;
	IBOutlet UILabel *appPlatformLabel;
	IBOutlet UILabel *appDescriptionLabel;
	IBOutlet UIScrollView *screenshotScrollView;
	UIImageView *screenshotOneImageView;
	UIImageView *screenshotTwoImageView;
	UIImageView *screenshotThreeImageView;	
}

@property (nonatomic, retain) IBOutlet UIImageView *appImageView;
@property (nonatomic, retain) IBOutlet UIButton *appUrlButton;
@property (nonatomic, retain) IBOutlet UILabel *appNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *appPlatformLabel;
@property (nonatomic, retain) IBOutlet UILabel *appDescriptionLabel;
@property (nonatomic, retain) IBOutlet UIScrollView *screenshotScrollView;
@property (nonatomic, retain) UIImageView *screenshotOneImageView;
@property (nonatomic, retain) UIImageView *screenshotTwoImageView;
@property (nonatomic, retain) UIImageView *screenshotThreeImageView;

@end
