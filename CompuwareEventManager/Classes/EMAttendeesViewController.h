//
//  EMAttendeesViewController.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMAppDelegate.h"
#import "EMParticipantEntity.h"

@interface EMAttendeesViewController : UIViewController
{
	
	IBOutlet UITableView *profileTableView;
	IBOutlet UIImageView *backgroundImage;
	IBOutlet UIImageView *bottomSwooshImageView;
	EMParticipantEntity *paticipantObject;
	EMParticipantEntity *previousParticipantObject;
	NSIndexPath *previousSelectedIndex;
}


@property (nonatomic, retain) IBOutlet UITableView *profileTableView;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, retain) IBOutlet UIImageView *bottomSwooshImageView;
@property (nonatomic, retain) EMParticipantEntity *participantObject;
@property (nonatomic, retain) EMParticipantEntity *previousParticipantObject;
@property (nonatomic, retain) NSIndexPath *previousSelectedIndex;
@end
