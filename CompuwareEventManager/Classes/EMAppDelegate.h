//
//  CompuwareEventManagerAppDelegate.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "EMHomeEntity.h"
#import "EMAgendaEntity.h"
#import "EMParticipantEntity.h"
#import "EMAboutEliteEntity.h"
#import "EMAboutMobilityEntity.h"
#import "EMAboutAppsEntity.h"

@interface EMAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UIImageView *splashView;
	MPMoviePlayerController *mMoviePlayer;
	NSArray *homeArray;
	EMHomeEntity *homeObject;
	NSArray *attendeesArray;
	EMParticipantEntity *participantObject;
	NSArray *cecAboutArray;
	EMAboutEliteEntity *cecAboutObject;
	NSArray *mobilityAboutArray;
	EMAboutMobilityEntity *mobilityAboutObject;
	NSArray *appsAboutArray;
	EMAboutAppsEntity *appsAboutObject;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) UIImageView *splashView;
@property (nonatomic, retain) MPMoviePlayerController *mMoviePlayer;
@property (nonatomic, retain) NSArray *homeArray;
@property (nonatomic, retain) EMHomeEntity *homeObject;
@property (nonatomic, retain) NSArray *attendeesArray;
@property (nonatomic, retain) EMParticipantEntity *participantObject;
@property (nonatomic, retain) NSArray *cecAboutArray;
@property (nonatomic, retain) EMAboutEliteEntity *cecAboutObject;
@property (nonatomic, retain) NSArray *mobilityAboutArray;
@property (nonatomic, retain) EMAboutMobilityEntity *mobilityAboutObject;
@property (nonatomic, retain) NSArray *appsAboutArray;
@property (nonatomic, retain) EMAboutAppsEntity *appsAboutObject;

-(void) playMovie;
-(void) fadeTheSplashScreen;
-(void) fadeTheSplashScreenMovie;

@end
