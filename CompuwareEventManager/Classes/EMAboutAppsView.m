//
//  EMAboutAppsView.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/18/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMAboutAppsView.h"

@implementation EMAboutAppsView
@synthesize closeButton;

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
}

-(IBAction)closeAboutAppsView
{
	CGRect tempFrame;
	tempFrame= self.frame;
	[UIView beginAnimations:@"EMAboutAppsView" context:NULL];
	[UIView setAnimationDuration:.75];
	tempFrame.origin.y=1020;
	self.frame=tempFrame;
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDidStopSelector: @selector(animationDidFinish:finished:context:)];
	[UIView commitAnimations];
}

-(void)animationDidFinish:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
	if ([animationID isEqualToString:@"EMAboutAppsView"]) 
	{
		[self removeFromSuperview];
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
