//
//  SecondViewController.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMAppDelegate.h"
#import "EMAgendaEntity.h"

@interface EMAgendaViewController : UIViewController <UIWebViewDelegate>
{
	IBOutlet UIImageView *backgroundImageView;
	IBOutlet UIImageView *bottomSwooshImageView;
	UIWebView *agendaWebView;
}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, retain) IBOutlet UIImageView *bottomSwooshImageView;
@property (nonatomic, retain) IBOutlet UIWebView *agendaWebView;

@end
