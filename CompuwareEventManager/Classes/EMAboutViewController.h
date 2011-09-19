//
//  EMAboutViewController.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMAppDelegate.h"

#import "EMAboutEliteEntity.h"
#import "EMAboutMobilityEntity.h"
#import "EMAboutAppsEntity.h"

#import "EMMessageEliteView.h"
#import "EMMessageMobilityView.h"
#import "EMAboutAppsView.h"
#import "EMAboutInformationView.h"

@interface EMAboutViewController : UIViewController 
{
	// Contents belonging to AboutViewController
	UIImageView *backgroundImageView;
	IBOutlet UIImageView *bottomSwooshImageView;
	IBOutlet UIButton *cecMessageButton;
	IBOutlet UIButton *mcoeMessageButton;
	IBOutlet UIButton *compuwareAppsButton;
	IBOutlet UIButton *resortInfoButton;
	
	// Creating objects for each entity in aboutView
	EMAboutEliteEntity *cecAboutObject;
	EMAboutMobilityEntity *mobilityAboutObject;
	EMAboutAppsEntity *aboutAppsObject;
	EMAboutAppsEntity *previousAboutAppsObject;
	
	// Creating objects for each subview in the aboutView
	EMMessageEliteView *eliteMessageView;
	EMMessageMobilityView *mobilityMessageView;
	EMAboutAppsView *appsAboutView;
	EMAboutInformationView *aboutInformationView;
	
	// Contents belonging to AboutApps subview.
	IBOutlet UITableView *aboutAppsTableView;
	NSIndexPath *previousSelectedIndex;
	UIImageView *ssoneImageView;
	UIImageView *sstwoImageView;
	UIImageView *ssthreeImageView;
}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, retain) IBOutlet UIImageView *bottomSwooshImageView;
@property (nonatomic, retain) IBOutlet UIButton *cecMessageButton;
@property (nonatomic, retain) IBOutlet UIButton *mcoeMessageButton;
@property (nonatomic, retain) IBOutlet UIButton *compuwareAppsButton;
@property (nonatomic, retain) IBOutlet UIButton *resortInfoButton;

@property (nonatomic, retain) EMAboutEliteEntity *cecAboutObject;
@property (nonatomic, retain) EMAboutMobilityEntity *mobilityAboutObject;
@property (nonatomic, retain) EMAboutAppsEntity *aboutAppsObject;
@property (nonatomic, retain) EMAboutAppsEntity *previousAboutAppsObject;

@property (nonatomic, retain) IBOutlet EMMessageEliteView *eliteMessageView;
@property (nonatomic, retain) IBOutlet EMMessageMobilityView *mobilityMessageView;
@property (nonatomic, retain) IBOutlet EMAboutAppsView *appsAboutView;
@property (nonatomic, retain) IBOutlet EMAboutInformationView *aboutInformationView;

@property (nonatomic, retain) IBOutlet UITableView *aboutAppsTableView;
@property (nonatomic, retain) NSIndexPath *previousSelectedIndex;
@property (nonatomic, retain) UIImageView *ssoneImageView;
@property (nonatomic, retain) UIImageView *sstwoImageView;
@property (nonatomic, retain) UIImageView *ssthreeImageView;

-(IBAction) displayCecMessage;
-(IBAction) displayMCoeMessage;
-(IBAction) displayCompuwareApps;
-(IBAction) displayResortInformation;

-(CGFloat)getLabelHeightForIndex:(NSIndexPath *)index;

@end
