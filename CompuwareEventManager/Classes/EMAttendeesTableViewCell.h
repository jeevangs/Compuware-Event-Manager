//
//  EMAttendeesTableViewCell.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/8/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMAttendeesTableViewCell : UITableViewCell 
{
	IBOutlet UILabel *descriptionTextLabel;
	IBOutlet UIImageView *attendeeImageView;
	IBOutlet UILabel *attendeeNameLabel;
	IBOutlet UILabel *attendeeTitleLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *descriptionTextLabel;
@property (nonatomic, retain) IBOutlet UIImageView *attendeeImageView;
@property (nonatomic, retain) IBOutlet UILabel *attendeeNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *attendeeTitleLabel;
@end
