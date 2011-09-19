//
//  EMAboutAppsTableViewCell.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/18/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMAboutAppsTableViewCell.h"


@implementation EMAboutAppsTableViewCell
@synthesize appImageView;
@synthesize appNameLabel;
@synthesize appPlatformLabel;
@synthesize appDescriptionLabel;
@synthesize appUrlButton;
@synthesize screenshotScrollView;
@synthesize screenshotOneImageView;
@synthesize screenshotTwoImageView;
@synthesize screenshotThreeImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
	{
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:NO animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc 
{
	[appImageView release];
	[appNameLabel release];
	[appPlatformLabel release];
	[appDescriptionLabel release];
	[appUrlButton release];
	[screenshotScrollView release];
	[screenshotOneImageView release];
	[screenshotTwoImageView release];
	[screenshotThreeImageView release];
    [super dealloc];
}


@end
