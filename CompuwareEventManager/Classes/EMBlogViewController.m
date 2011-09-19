    //
//  EMBlogViewController.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMBlogViewController.h"


@implementation EMBlogViewController

@synthesize BlogImageView;
@synthesize blogToolBar;
@synthesize blogWebView;
@synthesize loadingIndicator;
@synthesize url;
@synthesize urlString;

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
	// Search for the scrollview in the UIWebView (scheduleView) and remove the option for bouncing of top and bottom boundaries.
	for (id subview in blogWebView.subviews)
	{
		if ([[subview class] isSubclassOfClass: [UIScrollView class]])
		{
			((UIScrollView *)subview).bounces = NO;
			((UIScrollView *)subview).bouncesZoom = NO;
		}
	}
	self.urlString=@"http://offers.compuware.com/cec_presentations_lp";
	self.url = [NSURL URLWithString:self.urlString];
	
	NSURLRequest *req = [NSURLRequest requestWithURL:self.url];
	[blogWebView loadRequest:req];
	//originalFrame = self.tabBarController.view.frame;
}

/*
- (void) viewWillAppear:(BOOL)animated
{
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
	CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159/2);
	self.view.transform = transform;
	
	CGRect contentRect = CGRectMake(0, 0, 748, 1024);
	self.tabBarController.view.frame = contentRect;
}
*/

// Function to go back in the webview.
-(IBAction) backButtonTapped:(id) sender
{
	[blogWebView goBack];
} // End of backButtonTapped

// Function to go forward in the webview.
-(IBAction) forwardButtonTapped:(id) sender
{
	[blogWebView goForward];
} // End of refreshButtonTapped

// Function to refresh the web page.
-(IBAction) refreshButtonTapped:(id) sender
{
	[blogWebView reload];
} // End of refreshButtonTapped

#pragma mark UIWebViewDelegate methods
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[loadingIndicator stopAnimating];
} // End of webViewDidFinishLoad

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	//Animate the loadingindicator
	[loadingIndicator startAnimating];
} // End of webViewDidStartLoad.

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

/*
- (void)viewWillDisappear:(BOOL)animated 
{
	self.tabBarController.view.frame = originalFrame;
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
	
}
*/

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
