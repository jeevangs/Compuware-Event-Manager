//
//  EMMessageMobilityView.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/16/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMMessageMobilityView.h"


@implementation EMMessageMobilityView

@synthesize mcoeMessageLabel;
@synthesize closeButton;
@synthesize mcoeScrollView;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) 
	{
		
    }
    return self;
}



- (void) awakeFromNib
{
    [super awakeFromNib];
	mcoeMessageLabel.lineBreakMode = UILineBreakModeWordWrap;
	mcoeMessageLabel.numberOfLines = 0;
	mcoeScrollView.contentSize = mcoeMessageLabel.frame.size;
	[mcoeScrollView addSubview:mcoeMessageLabel];
}

-(IBAction)closeMcoeMessage
{
	CGRect tempFrame;
	tempFrame= self.frame;
	[UIView beginAnimations:@"EMMessageMobilityView" context:NULL];
	[UIView setAnimationDuration:.75];
	tempFrame.origin.y=1020;
	self.frame=tempFrame;
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDidStopSelector: @selector(animationDidFinish:finished:context:)];
	[UIView commitAnimations];
}

-(void)animationDidFinish:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
	if ([animationID isEqualToString:@"EMMessageMobilityView"]) 
	{
		[self removeFromSuperview];
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[mcoeMessageLabel release];
	[mcoeScrollView release];
    [super dealloc];
}


@end
