//
//  EMAttendeesTableViewCell.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/8/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMAttendeesTableViewCell.h"


@implementation EMAttendeesTableViewCell

@synthesize descriptionTextLabel;
@synthesize attendeeImageView;
@synthesize attendeeNameLabel;
@synthesize attendeeTitleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
