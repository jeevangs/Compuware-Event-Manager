//
//  EMMessageMobilityView.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/16/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMMessageMobilityView : UIView 
{
	IBOutlet UILabel *mcoeMessageLabel;
	IBOutlet UIButton *closeButton;
	IBOutlet UIScrollView *mcoeScrollView;
}

@property (nonatomic, retain) IBOutlet UILabel *mcoeMessageLabel;
@property (nonatomic, retain) IBOutlet UIButton *closeButton;
@property (nonatomic, retain) IBOutlet UIScrollView *mcoeScrollView;

-(IBAction) closeMcoeMessage;

@end
