//
//  EMCecMessage.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/15/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMMessageEliteView : UIView
{
	IBOutlet UILabel *cecMessageLabel;
	IBOutlet UIButton *closeButton;
	IBOutlet UIScrollView *cecMessageScrollView;
}

@property (nonatomic, retain) IBOutlet UILabel *cecMessageLabel;
@property (nonatomic, retain) IBOutlet UIButton *closeButton;
@property (nonatomic, retain) IBOutlet UIScrollView *cecMessageScrollView;

-(IBAction) closeCecMessage;
@end
