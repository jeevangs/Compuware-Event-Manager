//
//  EMAgenda.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/3/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EMAgendaEntity : NSObject 
{
	NSString *eventDay;
	NSString *eventDate;
	NSString *eventTime;
	NSString *eventName;
	NSString *eventLocation;
}

@property (nonatomic, retain) NSString *eventDay;
@property (nonatomic, retain) NSString *eventDate;
@property (nonatomic, retain) NSString *eventTime;
@property (nonatomic, retain) NSString *eventName;
@property (nonatomic, retain) NSString *eventLocation;

@end
