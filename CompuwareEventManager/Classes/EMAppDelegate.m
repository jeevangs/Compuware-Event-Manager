//
//  CompuwareEventManagerAppDelegate.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMAppDelegate.h"
#import "EMModelFactory.h"

@implementation EMAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize splashView;
@synthesize mMoviePlayer;
@synthesize homeArray;
@synthesize homeObject;
@synthesize attendeesArray;
@synthesize participantObject;
@synthesize cecAboutObject;
@synthesize cecAboutArray;
@synthesize mobilityAboutArray;
@synthesize mobilityAboutObject;
@synthesize appsAboutArray;
@synthesize appsAboutObject;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch.
	[[UIApplication sharedApplication] setStatusBarHidden:NO];
	[self playMovie];
	
	EMModelFactory *modelFactory = [EMModelFactory sharedModelFactory];
	self.homeArray=[modelFactory loadHome];
	self.attendeesArray=[modelFactory loadAttendeesProfile];
	self.cecAboutArray=[modelFactory loadCecAbout];
	self.mobilityAboutArray=[modelFactory loadMcoeAbout];
	self.appsAboutArray=[modelFactory loadAppsAbout];
	
	// Set the tab bar controller as the window's root view controller and display.
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) playMovie
{
	NSURL* mMovieURL;
	NSBundle *bundle = [NSBundle mainBundle];
	if (bundle) 
	{
		NSString *moviePath = [bundle pathForResource:@"CEC_animation" ofType:@"mp4"];
		if (moviePath)
		{
			mMovieURL = [NSURL fileURLWithPath:moviePath];
			[mMovieURL retain];
		}
	}
	mMoviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:mMovieURL];
	mMoviePlayer.controlStyle = MPMovieControlStyleNone;
	[mMoviePlayer.view setAlpha:10];
	[[mMoviePlayer view] setFrame:window.bounds];
	[window addSubview: [mMoviePlayer view]];
	
	
	[mMovieURL release];
	[[UIApplication sharedApplication] setStatusBarHidden:NO];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:mMoviePlayer];
	[mMoviePlayer play];
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
	[self fadeTheSplashScreenMovie];
	[mMoviePlayer release];
}


- (void)fadeTheSplashScreen
{
	[self.window addSubview:self.tabBarController.view];
	
	[splashView setAlpha:1.0];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:3];
	[UIView setAnimationDidStopSelector:@selector(removeSplash)];
	[splashView setAlpha:0.0];
	[UIView commitAnimations];
	
	[window addSubview:splashView];
	[window bringSubviewToFront:splashView];
}

-(void)removeSplash
{
	// Remove splash screen.
	[splashView removeFromSuperview];
	[splashView release];
}

- (void)fadeTheSplashScreenMovie
{	
	splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,768,1024)];
	[splashView setBackgroundColor:[UIColor whiteColor]];
	splashView.image = [UIImage imageNamed:@"CEC_ipad_splash.png"];
	window.backgroundColor =[UIColor clearColor];
	[self.window addSubview:splashView];
	
	[mMoviePlayer.view setAlpha:1.0];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:3];
	[UIView setAnimationDidStopSelector:@selector(removeSplashMovie)];
	[mMoviePlayer.view setAlpha:0.0];
	[UIView commitAnimations];
	
	[window addSubview:mMoviePlayer.view];
	[window bringSubviewToFront:mMoviePlayer.view];
	
}

-(void)removeSplashMovie
{
	[self fadeTheSplashScreen];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application 
{
	[homeArray release];
	[attendeesArray release];
	[cecAboutArray release];
	[mobilityAboutArray release];
	[appsAboutArray release];
}


#pragma mark -
#pragma mark UITabBarControllerDelegate methods

/*
 // Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
 */

/*
 // Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
 */

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [tabBarController release];
    [window release];
	[splashView release];
	
	[super dealloc];
}

@end

