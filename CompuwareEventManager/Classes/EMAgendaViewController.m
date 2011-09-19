//
//  SecondViewController.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMAgendaViewController.h"

@implementation EMAgendaViewController

@synthesize backgroundImageView;
@synthesize bottomSwooshImageView;
@synthesize agendaWebView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	agendaWebView.delegate = self;
	[agendaWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"agenda" ofType:@"html"]isDirectory:NO]]];
	[[agendaWebView.subviews objectAtIndex:0] setScrollEnabled:YES];
	[[agendaWebView.subviews objectAtIndex:0] setBounces:NO];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:request.URL];
        return false;
    }
    return true;
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
	[agendaWebView release];
	
	
}

@end