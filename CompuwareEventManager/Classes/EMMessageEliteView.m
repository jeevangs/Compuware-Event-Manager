//
//  EMCecMessage.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/15/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMMessageEliteView.h"


@implementation EMMessageEliteView
@synthesize cecMessageLabel;
@synthesize closeButton;
@synthesize cecMessageScrollView;

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
	cecMessageLabel.lineBreakMode = UILineBreakModeWordWrap;
	cecMessageLabel.numberOfLines = 0;
	cecMessageScrollView.contentSize = cecMessageLabel.frame.size;
	[cecMessageScrollView addSubview:cecMessageLabel];
	
}

-(IBAction)closeCecMessage
{
	CGRect tempFrame;
	tempFrame= self.frame;
	[UIView beginAnimations:@"EMMessageEliteView" context:NULL];
	[UIView setAnimationDuration:.75];
	tempFrame.origin.y=1020;
	self.frame=tempFrame;
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDidStopSelector: @selector(animationDidFinish:finished:context:)];
	[UIView commitAnimations];
}

-(void)animationDidFinish:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
	if ([animationID isEqualToString:@"EMMessageEliteView"]) 
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

- (void)dealloc 
{
	[cecMessageLabel release];
	[cecMessageScrollView release];
    [super dealloc];
}


@end
