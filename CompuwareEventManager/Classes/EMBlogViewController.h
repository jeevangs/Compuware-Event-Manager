//
//  EMBlogViewController.h
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EMBlogViewController : UIViewController 
{
	IBOutlet UIToolbar *blogToolBar;
	UIImageView *BlogImageView;
	IBOutlet UIWebView *blogWebView;
	IBOutlet UIActivityIndicatorView *loadingIndicator;
	NSURL *url;
	NSString *urlString;
	//CGRect originalFrame;
}

@property (nonatomic, retain) IBOutlet UIImageView *BlogImageView;
@property (nonatomic, retain) IBOutlet UIToolbar *blogToolBar;
@property (nonatomic, retain) IBOutlet UIWebView *blogWebView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, retain) NSString *urlString;
@property (nonatomic, retain) NSURL *url;

// Function to go back in the webview.
-(IBAction) backButtonTapped:(id) sender;

// Function to go forward in the webview.
-(IBAction) forwardButtonTapped:(id) sender;

// Function to refresh the web page.
-(IBAction) refreshButtonTapped:(id) sender;

@end
