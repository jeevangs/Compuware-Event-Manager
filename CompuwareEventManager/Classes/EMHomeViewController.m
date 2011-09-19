//
//  FirstViewController.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMHomeViewController.h"

@implementation EMHomeViewController
@synthesize backgroundImageView;
@synthesize messageLabel;
@synthesize signatureImageView;
@synthesize titleLabel;
@synthesize homeObject;
@synthesize bottomSwooshImageView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	homeObject=[[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] homeArray] objectAtIndex:0];
	messageLabel.font=[UIFont fontWithName:@"Futura" size:15];
	
	messageLabel.text= homeObject.homeMessage;
	titleLabel.font=[UIFont fontWithName:@"FuturaMed" size:17];
	titleLabel.text = homeObject.paulTitle;
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
	[titleLabel release];
	[signatureImageView release];
	[messageLabel release];
	[backgroundImageView release];
	[bottomSwooshImageView release];
    [super dealloc];
}

@end
