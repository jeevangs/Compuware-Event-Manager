//
//  EMAboutAppsEntity.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/18/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EMAboutAppsEntity : NSObject 
{
	NSString *appName;
	NSString *appIconImageName;
	UIImage *appIcon;
	NSString *appType;
	NSString *screenshotOrientation;
	NSString *iTunesURL;
	NSString *screenshotOneImageName;
	UIImage *screenshotOneImage;
	NSString *screenshotTwoImageName;
	UIImage *screenshotTwoImage;
	NSString *screenshotThreeImageName;
	UIImage *screenshotThree;
	NSString *appDescription;
	NSString *appPlatforms;
	BOOL isExpanded;
}

@property (nonatomic, retain) NSString *appName;
@property (nonatomic, retain) NSString *appIconImageName;
@property (nonatomic, retain) UIImage *appIcon;
@property (nonatomic, retain) NSString *appType;
@property (nonatomic, retain) NSString *screenshotOrientation;
@property (nonatomic, retain) NSString *iTunesURL;
@property (nonatomic, retain) NSString *screenshotOneImageName;
@property (nonatomic, retain) UIImage *screenshotOneImage;
@property (nonatomic, retain) NSString *screenshotTwoImageName;
@property (nonatomic, retain) UIImage *screenshotTwoImage;
@property (nonatomic, retain) NSString *screenshotThreeImageName;
@property (nonatomic, retain) UIImage *screenshotThreeImage;
@property (nonatomic, retain) NSString *appDescription;
@property (nonatomic, retain) NSString *appPlatforms;
@property (setter=setisExpanded:) BOOL isExpanded;

@end
