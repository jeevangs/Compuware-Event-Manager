//
//  EMParticipant.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/29/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EMParticipantEntity : NSObject 
{
	NSString *participantName;
	NSString *participantTitle;
	NSString *participantBiography;
	NSString *participantType;
	NSString *participantUserName;
	NSString *participantPassword;
	NSString *participantRealEmail;
	NSString *participantPictureName;
	UIImage *participantPicture;
	NSString *participantTypeTitle;
	BOOL isExpanded;
}

@property (nonatomic, retain) NSString *participantName;
@property (nonatomic, retain) NSString *participantTitle;
@property (nonatomic, retain) NSString *participantBiography;
@property (nonatomic, retain) NSString *participantType;
@property (nonatomic, retain) NSString *participantUserName;
@property (nonatomic, retain) NSString *participantPassword;
@property (nonatomic, retain) NSString *participantRealEmail;
@property (nonatomic, retain) NSString *participantPictureName;
@property (nonatomic, retain) UIImage *participantPicture;
@property (nonatomic, retain) NSString *participantTypeTitle;
@property (setter=setisExpanded:) BOOL isExpanded;
@end
