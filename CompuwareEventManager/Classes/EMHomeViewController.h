//
//  FirstViewController.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMAppDelegate.h"
#import "EMHomeEntity.h"

@interface EMHomeViewController : UIViewController 
{
	IBOutlet UIImageView *backgroundImageView;
	IBOutlet UILabel *messageLabel;
	IBOutlet UIImageView *signatureImageView;
	IBOutlet UILabel *titleLabel;
	IBOutlet UIImageView *bottomSwooshImageView;
	EMHomeEntity *homeObject;

}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, retain) IBOutlet UILabel *messageLabel;
@property (nonatomic, retain) IBOutlet UIImageView *signatureImageView;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) EMHomeEntity *homeObject;
@property (nonatomic, retain) IBOutlet UIImageView *bottomSwooshImageView;

@end
