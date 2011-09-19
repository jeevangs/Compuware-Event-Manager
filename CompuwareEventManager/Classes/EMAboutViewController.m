    //
//  EMAboutViewController.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//
#define COMMENT_LABEL_WIDTH 673 // The width of the label that shows in the tableviewcell
#define COMMENT_LABEL_MIN_HEIGHT 60 // The height of the description label when the tableviewcell is in contracted mode.
#define COMMENT_LABEL_PADDING 180 // The padding space to accomodate the app name and the PLATFORM labels in every cell even when it is expanded.
#define SCREENSHOT_IMAGEVIEW_LANDSCAPE_PADDING 250
#define SCREENSHOT_IMAGEVIEW_PORTRAIT_PADDING 335

#import "EMAboutViewController.h"
#import "EMModelFactory.h"
#import "EMAboutAppsTableViewCell.h"

@implementation EMAboutViewController

@synthesize backgroundImageView;
@synthesize bottomSwooshImageView;
@synthesize cecMessageButton;
@synthesize mcoeMessageButton;
@synthesize compuwareAppsButton;
@synthesize resortInfoButton;

@synthesize cecAboutObject;
@synthesize mobilityAboutObject;
@synthesize aboutAppsObject;
@synthesize previousAboutAppsObject;

@synthesize eliteMessageView;
@synthesize mobilityMessageView;
@synthesize appsAboutView;
@synthesize aboutInformationView;

@synthesize aboutAppsTableView;
@synthesize previousSelectedIndex;
@synthesize ssoneImageView;
@synthesize sstwoImageView;
@synthesize ssthreeImageView;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    // Overriden to allow any orientation.
    return NO;
}

#pragma mark -
#pragma mark Displaying Separate Views

-(IBAction) displayCecMessage
{
	cecAboutObject=[[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] cecAboutArray] objectAtIndex:0];
	eliteMessageView.frame = CGRectMake(0, 1020, 768, 1020);
	[self.view addSubview:eliteMessageView];
	CGRect tmpFrame=eliteMessageView.frame;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	tmpFrame.origin.y=0;
	eliteMessageView.frame=tmpFrame;
	eliteMessageView.cecMessageLabel.font=[UIFont fontWithName:@"Futura" size:22.0f];
	eliteMessageView.cecMessageLabel.text=cecAboutObject.information;
	[UIView commitAnimations];
	
}

-(IBAction) displayMCoeMessage
{
	mobilityAboutObject=[[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] mobilityAboutArray] objectAtIndex:0];
	mobilityMessageView.frame = CGRectMake(0, 1020, 768, 1020);
	[self.view addSubview:mobilityMessageView];
	CGRect tmpFrame=mobilityMessageView.frame;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	tmpFrame.origin.y=0;
	mobilityMessageView.frame=tmpFrame;
	mobilityMessageView.mcoeMessageLabel.font=[UIFont fontWithName:@"Futura" size:22.0f];
	mobilityMessageView.mcoeMessageLabel.text=mobilityAboutObject.information;
	[UIView commitAnimations];
}

-(IBAction) displayCompuwareApps
{
	aboutAppsObject=[[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:0];
	appsAboutView.frame = CGRectMake(0, 1020, 768, 1020);
	[self.view addSubview:appsAboutView];
	CGRect tmpFrame=appsAboutView.frame;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	tmpFrame.origin.y=0;
	appsAboutView.frame=tmpFrame;
	[UIView commitAnimations];
}

-(IBAction) displayResortInformation
{
	aboutInformationView.frame = CGRectMake(0, 1020, 768, 1020);
	[self.view addSubview:aboutInformationView];
	CGRect tmpFrame=aboutInformationView.frame;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	tmpFrame.origin.y=0;
	aboutInformationView.frame=tmpFrame;
	[UIView commitAnimations];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section 
{
    return 50;
}

- (UIView*) tableView: (UITableView*) tableView viewForHeaderInSection: (NSInteger) section
{
	UIView *customView = [[[UIView alloc] initWithFrame: CGRectMake(0.0, 0.0, 752.0, 45.0)] autorelease];
	UILabel *secHead = [[[UILabel alloc] initWithFrame:CGRectMake(0,0,752,45)] autorelease];
	UIColor *customColor = [UIColor colorWithRed:(239.0 / 255.0) green:(90.0 / 255.0) blue:(51.0 / 255.0) alpha: 1];
	[secHead setBackgroundColor:customColor];
	[secHead setTextColor:[UIColor whiteColor]];
	[secHead setTextAlignment:UITextAlignmentCenter];
	secHead.adjustsFontSizeToFitWidth = YES;
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:section];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	aboutAppsObject=[array objectAtIndex:0];
	secHead.font=[UIFont fontWithName:@"FuturaMed" size:25.0f];
	NSString *sectionTitle = aboutAppsObject.appType;
	if (section == 0)
	{
		NSString *newString = [sectionTitle stringByAppendingString:@" (installed on device) "];
		secHead.text = newString;
		[customView addSubview:secHead];
	}
	else {
		secHead.text=sectionTitle;
		[customView addSubview:secHead];
	}

	return customView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:section];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	return [array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"customCell";
	
    EMAboutAppsTableViewCell *cell = (EMAboutAppsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) 
	{
        NSArray * topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"EMAboutAppsTableViewCell" owner:self options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (EMAboutAppsTableViewCell *)currentObject;
				[cell.appUrlButton setHidden:NO];
				NSLog(@"Original Bounds Coordinates: %f, %f", cell.appUrlButton.bounds.origin.x, cell.appUrlButton.bounds.origin.y);
				NSLog(@"Original Frame Coordinates: %f, %f", cell.appUrlButton.frame.origin.x, cell.appUrlButton.frame.origin.y);
               break;
            }
        }        
    }
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	aboutAppsObject=[array objectAtIndex:indexPath.row];
	
	
	if([aboutAppsObject.appType isEqualToString: @"Enterprise Apps"] || [aboutAppsObject.appType isEqualToString: @"Consumer Apps"])
	{
		//If this is the selected index then calculate the height of the cell based on the amount of text we have
		if([aboutAppsObject isExpanded]== YES)
		{
			CGFloat labelHeight = [self getLabelHeightForIndex:indexPath];
			
			cell.appDescriptionLabel.frame = CGRectMake(cell.appDescriptionLabel.frame.origin.x, 
														cell.appDescriptionLabel.frame.origin.y, 
														cell.appDescriptionLabel.frame.size.width, 
														labelHeight+70); //70 is added so that the label displays all the data when expanded. (extra padding)
			cell.appDescriptionLabel.hidden=NO;
			cell.appDescriptionLabel.font = [UIFont fontWithName:@"Futura" size:20.0f];
			NSString *appDescription=aboutAppsObject.appDescription;
			cell.appDescriptionLabel.text=appDescription;
			
			[cell.appUrlButton setHidden:NO];
			
			if([aboutAppsObject.screenshotOrientation isEqualToString:@"Landscape"])
			{
				ssoneImageView=[[UIImageView alloc]initWithFrame:CGRectMake(30,cell.appDescriptionLabel.frame.origin.y+cell.appDescriptionLabel.frame.size.height+10, 320, 240)];
				ssoneImageView.image=aboutAppsObject.screenshotOneImage;
				[cell.contentView addSubview:ssoneImageView];
				
				sstwoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(378,cell.appDescriptionLabel.frame.origin.y+cell.appDescriptionLabel.frame.size.height+10, 320, 240)];
				sstwoImageView.image=aboutAppsObject.screenshotTwoImage;
				[cell.contentView addSubview:sstwoImageView];
			}
			
			else 
			{
				ssoneImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15,cell.appDescriptionLabel.frame.origin.y+cell.appDescriptionLabel.frame.size.height+10, 215, 325)];
				ssoneImageView.image=aboutAppsObject.screenshotOneImage;
				[cell.contentView addSubview:ssoneImageView];
				
				sstwoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(256,cell.appDescriptionLabel.frame.origin.y+cell.appDescriptionLabel.frame.size.height+10, 215, 325)];
				sstwoImageView.image=aboutAppsObject.screenshotTwoImage;
				[cell.contentView addSubview:sstwoImageView];
				
				ssthreeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(499,cell.appDescriptionLabel.frame.origin.y+cell.appDescriptionLabel.frame.size.height+10, 215, 325)];
				ssthreeImageView.image=aboutAppsObject.screenshotThreeImage;
				[cell.contentView addSubview:ssthreeImageView];
			}
		}
		else 
		{
			
			//Otherwise just return the minimum height for the label.
			cell.appDescriptionLabel.frame = CGRectMake(cell.appDescriptionLabel.frame.origin.x, 
														cell.appDescriptionLabel.frame.origin.y, 
														cell.appDescriptionLabel.frame.size.width, 
														COMMENT_LABEL_MIN_HEIGHT);
			cell.appDescriptionLabel.hidden=YES;
			cell.appUrlButton.hidden=YES;
		}
	}
	
    //cell.appDescriptionLabel.hidden=YES;
	
	NSString *appImageName=aboutAppsObject.appIconImageName;
	NSString *appImageNamePath = [NSString stringWithFormat:@"/Images_Apps/%@", appImageName];
	cell.appImageView.image = [UIImage imageNamed:appImageNamePath];
	
	if (indexPath.section == 0) 
		
		{
			cell.appUrlButton.tag = indexPath.row;
			[cell.appUrlButton addTarget:self action:@selector(openBrowser:) forControlEvents:UIControlEventTouchDown];
		}
	
	else
		
		{
	
			[cell.appUrlButton setHidden:YES];
		
		}
		

	
	NSString *appName=aboutAppsObject.appName;
	cell.appNameLabel.font=[UIFont fontWithName:@"FuturaMed" size:22.0f];
	cell.appNameLabel.text=appName;
	
	NSString *appPlatform=aboutAppsObject.appPlatforms;
	cell.appPlatformLabel.font=[UIFont fontWithName:@"Futura" size:20.0f];
	cell.appPlatformLabel.text=appPlatform;
	
    return cell;
}

- (void) openBrowser:(id)sender
{ 
	UIButton *button = (UIButton *)sender;
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:0];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	EMAboutAppsEntity *currentAboutAppsObject=[array objectAtIndex:button.tag];
	NSLog(@"The button tag is %d",button.tag);
	NSLog(@"The iTunes url is %@",currentAboutAppsObject.iTunesURL);
	[[UIApplication sharedApplication]  openURL:[NSURL URLWithString:currentAboutAppsObject.iTunesURL] ];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If this is the selected index we need to return the height of the cell
    //in relation to the label height otherwise we just return the minimum label height with padding
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	aboutAppsObject=[array objectAtIndex:indexPath.row];
	
	if([aboutAppsObject.appType isEqualToString: @"Enterprise Apps"] || [aboutAppsObject.appType isEqualToString: @"Consumer Apps"])
	{
		if([aboutAppsObject isExpanded] == YES)
		{
			if([aboutAppsObject.screenshotOrientation isEqualToString:@"Landscape"])
			{
				return [self getLabelHeightForIndex:indexPath] + COMMENT_LABEL_PADDING + SCREENSHOT_IMAGEVIEW_LANDSCAPE_PADDING;
			}
			else 
			{
				return [self getLabelHeightForIndex:indexPath] + COMMENT_LABEL_PADDING + SCREENSHOT_IMAGEVIEW_PORTRAIT_PADDING;
			}
		}
		else 
		{
			return 120; // The height of the uitableviewcell , which can be got from the EMAttendeesTableViewCell.xib
		}
	}
	else 
	{
		return 120;
	}

}

#pragma mark -
#pragma mark Table view delegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	EMAboutAppsEntity *currentAboutAppsObject=[array objectAtIndex:indexPath.row];
	
	/*
	if([currentAboutAppsObject.appType isEqualToString: @"Consumer Apps"])
	{
		// Code to goto the app store of that particular app directly
		NSString *iTunesURLString = currentAboutAppsObject.iTunesURL;
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesURLString]];
		
	}
	else 
	{
	*/	//The user is selecting the cell which is currently expanded
		//we want to minimize it back
		if(previousAboutAppsObject==currentAboutAppsObject && [currentAboutAppsObject isExpanded] == YES)
		{
			[currentAboutAppsObject setisExpanded:NO];
			[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			return;
		}
		
		//First we check if a cell is already expanded.
		//If it is we want to minimize make sure it is reloaded to minimize it back
		if(previousAboutAppsObject !=nil && previousAboutAppsObject!=currentAboutAppsObject && [currentAboutAppsObject isExpanded]==NO)
		{
			[currentAboutAppsObject setisExpanded:YES];
			[previousAboutAppsObject setisExpanded:NO];
			[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,previousSelectedIndex,nil] withRowAnimation:UITableViewRowAnimationFade]; 
			
		}
		
		//Finally set the selected index to the new selection and reload it to expand
		[currentAboutAppsObject setisExpanded:YES];
		[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
		previousAboutAppsObject=currentAboutAppsObject;
		previousSelectedIndex=[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
		[tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
	//}
}

-(CGFloat)getLabelHeightForIndex:(NSIndexPath *)index
{
    CGSize maximumSize = CGSizeMake(COMMENT_LABEL_WIDTH, 10000);
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] appsAboutArray] objectAtIndex:index.section];
	NSArray *array = [dictionary objectForKey:@"Apps"];
	aboutAppsObject=[array objectAtIndex:index.row];
	NSString *cellValue = aboutAppsObject.appDescription;
	CGSize labelHeighSize = [cellValue sizeWithFont: [UIFont fontWithName:@"Futura" size:20.0f]
								  constrainedToSize:maximumSize
									  lineBreakMode:UILineBreakModeWordWrap];
    return (labelHeighSize.height);
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
	[backgroundImageView release];
	[super dealloc];
}


@end
