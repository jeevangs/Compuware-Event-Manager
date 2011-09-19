//
//  EMHome.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/3/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EMHomeEntity : NSObject 
{
	NSString *homeMessage;
	NSString *paulTitle;
}

@property (nonatomic, retain) NSString *homeMessage;
@property (nonatomic, retain) NSString *paulTitle;
@end
