//
//  EMAboutInformationView.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/19/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMAboutInformationView.h"


@implementation EMAboutInformationView
@synthesize closeButton, aboutWebView;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
	aboutWebView.delegate = self;
	[aboutWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"activity" ofType:@"html"]isDirectory:NO]]];
	[[aboutWebView.subviews objectAtIndex:0] setScrollEnabled:YES];
	[[aboutWebView.subviews objectAtIndex:0] setBounces:NO];
}


-(IBAction)closeAboutInformationView
{
	CGRect tempFrame;
	tempFrame= self.frame;
	[UIView beginAnimations:@"EMAboutInformationView" context:NULL];
	[UIView setAnimationDuration:.75];
	tempFrame.origin.y=1020;
	self.frame=tempFrame;
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDidStopSelector: @selector(animationDidFinish:finished:context:)];
	[UIView commitAnimations];
}

-(void)animationDidFinish:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
	if ([animationID isEqualToString:@"EMAboutInformationView"]) 
	{
		[self removeFromSuperview];
	}
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:request.URL];
        return false;
    }
    return true;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
	[aboutWebView release];
}


@end
