    //
//  EMLoginViewController.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMLoginViewController.h"


@implementation EMLoginViewController

@synthesize proceedButton;
@synthesize userNameField;
@synthesize passwordField;
@synthesize tapRecognizer;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	
	[nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
	self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
}



-(void) keyboardWillShow:(NSNotification *) note 
{
    [self.view addGestureRecognizer:tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer:tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer 
{    
    [passwordField resignFirstResponder];
	[userNameField resignFirstResponder];
}

- (void)textFieldShouldReturn:(UITextField *)theTextField 
{
	if ([userNameField isFirstResponder]) 
	{
		[passwordField becomeFirstResponder];
	}
	else if([passwordField isFirstResponder])
	{
		[self validateCredentials:self];
	}
}

// Code to check whether the user name and the password match.
-(IBAction)validateCredentials:(id)sender
{
	[passwordField resignFirstResponder];
	[userNameField resignFirstResponder];
	[UIView beginAnimations:@"flipView" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view.superview cache:YES];
	[self.view removeFromSuperview];
	[UIView setAnimationDuration:1];
	[UIView commitAnimations];
	
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    
	return (interfaceOrientation == UIInterfaceOrientationPortrait );
	//return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
    [proceedButton release];
	[userNameField release];
	[passwordField release];
	[super dealloc];
}


@end
