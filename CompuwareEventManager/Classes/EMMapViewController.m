    //
//  EMMapViewController.m
//  CompuwareEventManager
//
//  Created by mibkwa0 on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EMMapViewController.h"


@implementation EMMapViewController

@synthesize backgroundImageView;
@synthesize mapWebView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	[mapWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Property Maps - SB" ofType:@"pdf"]isDirectory:NO]]];
	[[mapWebView.subviews objectAtIndex:0] setScrollEnabled:YES];
	[[mapWebView.subviews objectAtIndex:0] setBounces:NO];
	mapWebView.backgroundColor = [UIColor whiteColor];
	mapWebView.scalesPageToFit = YES;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
    [super dealloc];
	[mapWebView release];
	
	
}

@end