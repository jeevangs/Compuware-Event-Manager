//
//  EMAboutInformationView.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/19/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMAboutInformationView : UIView <UIWebViewDelegate>
{
	IBOutlet UIButton *closeButton;
	UIWebView *aboutWebView;
}

@property (nonatomic, retain) IBOutlet UIButton *closeButton;
@property (nonatomic, retain) IBOutlet UIWebView *aboutWebView;

-(IBAction)closeAboutInformationView;

@end
