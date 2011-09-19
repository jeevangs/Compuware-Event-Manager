//
//  EMLoginViewController.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMLoginViewController : UIViewController 
{
	IBOutlet UIButton *proceedButton;
	IBOutlet UITextField *userNameField;
	IBOutlet UITextField *passwordField;
	UITapGestureRecognizer *tapRecognizer;
}

@property (nonatomic, retain) UIButton *proceedButton;
@property (nonatomic, retain) UITextField *userNameField;
@property (nonatomic, retain) UITextField *passwordField;
@property (assign) UITapGestureRecognizer *tapRecognizer;

-(IBAction)validateCredentials:(id)sender;

@end
