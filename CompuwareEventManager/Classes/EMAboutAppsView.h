//
//  EMAboutAppsView.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/18/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMAboutAppsView : UIView 
{
	IBOutlet UIButton *closeButton;
}

@property (nonatomic, retain) IBOutlet UIButton *closeButton;

-(IBAction) closeAboutAppsView;
@end
