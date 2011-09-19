//
//  EMModelFactory.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/3/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMModelFactory : NSObject 
{
	
}
+ (EMModelFactory *)sharedModelFactory;
-(NSArray *) loadAttendeesProfile;
-(NSArray *) loadHome;
-(NSArray *) loadCecAbout;
-(NSArray *) loadMcoeAbout;
-(NSArray *) loadAppsAbout;
@end
