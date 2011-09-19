//
//  EMMapViewController.h
//  CompuwareEventManager
//
//  Created by mibkwa0 on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMMapViewController : UIViewController 

{
	IBOutlet UIImageView *backgroundImageView;
	UIWebView *mapWebView;
}

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, retain) IBOutlet UIWebView *mapWebView;

@end
