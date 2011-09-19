    //
//  EMAttendeesViewController.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 7/28/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#define COMMENT_LABEL_WIDTH 673 // The width of the label that shows in the tableviewcell
#define COMMENT_LABEL_MIN_HEIGHT 60 // The height of the description label when the tableviewcell is in contracted mode.
#define COMMENT_LABEL_PADDING 180 // The padding space to accomodate the attendee name and the title labels in every cell even when it is expanded.

#import "EMAttendeesViewController.h"
#import "EMAttendeesTableViewCell.h"

@implementation EMAttendeesViewController

@synthesize profileTableView;
@synthesize backgroundImage;
@synthesize bottomSwooshImageView;
@synthesize participantObject;
@synthesize previousParticipantObject;
@synthesize previousSelectedIndex;


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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] count];
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
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] objectAtIndex:section];
	NSArray *array = [dictionary objectForKey:@"People"];
	participantObject=[array objectAtIndex:0];
	secHead.font=[UIFont fontWithName:@"FuturaMed" size:25.0f];
	NSString *sectionTitle = participantObject.participantTypeTitle;
	secHead.text=sectionTitle;
	[customView addSubview:secHead];
	return customView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] objectAtIndex:section];
	NSArray *array = [dictionary objectForKey:@"People"];
	return [array count];
}


-(CGFloat)getLabelHeightForIndex:(NSIndexPath *)index
{
    CGSize maximumSize = CGSizeMake(COMMENT_LABEL_WIDTH, 10000);
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] objectAtIndex:index.section];
	NSArray *array = [dictionary objectForKey:@"People"];
	participantObject=[array objectAtIndex:index.row];
	NSString *cellValue = participantObject.participantBiography;
	CGSize labelHeighSize = [cellValue sizeWithFont: [UIFont fontWithName:@"Futura" size:20.0f]
														constrainedToSize:maximumSize
															lineBreakMode:UILineBreakModeWordWrap];
    return (labelHeighSize.height);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"customCell";
    
    EMAttendeesTableViewCell *cell = (EMAttendeesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        NSArray * topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"EMAttendeesTableViewCell" owner:self options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (EMAttendeesTableViewCell *)currentObject;
                break;
            }
        }        
    }
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"People"];
	participantObject=[array objectAtIndex:indexPath.row];
	
    //If this is the selected index then calculate the height of the cell based on the amount of text we have
    if([participantObject isExpanded]== YES)
    {
        CGFloat labelHeight = [self getLabelHeightForIndex:indexPath];
        
        cell.descriptionTextLabel.frame = CGRectMake(cell.descriptionTextLabel.frame.origin.x, 
												 cell.descriptionTextLabel.frame.origin.y, 
												 cell.descriptionTextLabel.frame.size.width, 
												 labelHeight+70); //70 is added so that the label displays all the data when expanded. (extra padding)
		cell.descriptionTextLabel.hidden=NO;
    }
    else 
	{
        
        //Otherwise just return the minimum height for the label.
        cell.descriptionTextLabel.frame = CGRectMake(cell.descriptionTextLabel.frame.origin.x, 
												 cell.descriptionTextLabel.frame.origin.y, 
												 cell.descriptionTextLabel.frame.size.width, 
												 COMMENT_LABEL_MIN_HEIGHT);
		cell.descriptionTextLabel.hidden=YES;
    }
	
    cell.descriptionTextLabel.font = [UIFont fontWithName:@"Futura" size:20.0f];
	
	NSString *cellValue = participantObject.participantBiography;
    cell.descriptionTextLabel.text = cellValue;
	//cell.descriptionTextLabel.hidden=YES;
	cell.attendeeNameLabel.font= [UIFont fontWithName:@"FuturaMed" size:22.0f];
	cell.attendeeNameLabel.text=participantObject.participantName;
	cell.attendeeTitleLabel.font=[UIFont fontWithName:@"Futura" size:20.0f];
	cell.attendeeTitleLabel.text=participantObject.participantTitle;
	cell.attendeeImageView.image= participantObject.participantPicture;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If this is the selected index we need to return the height of the cell
    //in relation to the label height otherwise we just return the minimum label height with padding
	
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"People"];
	participantObject=[array objectAtIndex:indexPath.row];
	
    if([participantObject isExpanded] == YES)
    {
        return [self getLabelHeightForIndex:indexPath] + COMMENT_LABEL_PADDING;
    }
    else 
	{
		return 120; // The height of the uitableviewcell , which can be git from the EMAttendeesTableViewCell.xib
    }
}



-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //We only don't want to allow selection on any cells which cannot be expanded
    if([self getLabelHeightForIndex:indexPath] > COMMENT_LABEL_MIN_HEIGHT)
    {
        return indexPath;
    }
    else 
	{
        return nil;
    }
	
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *dictionary = [[(EMAppDelegate *)[[UIApplication sharedApplication] delegate] attendeesArray] objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"People"];
	EMParticipantEntity *currentParticipantObject=[array objectAtIndex:indexPath.row];
	
    //The user is selecting the cell which is currently expanded
    //we want to minimize it back
    if(previousParticipantObject==currentParticipantObject && [currentParticipantObject isExpanded] == YES)
    {
		[currentParticipantObject setisExpanded:NO];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    //First we check if a cell is already expanded.
    //If it is we want to minimize make sure it is reloaded to minimize it back
    if(previousParticipantObject !=nil && previousParticipantObject!=currentParticipantObject && [currentParticipantObject isExpanded]==NO)
    {
		[currentParticipantObject setisExpanded:YES];
		[previousParticipantObject setisExpanded:NO];
		[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,previousSelectedIndex,nil] withRowAnimation:UITableViewRowAnimationFade]; 
		
    }
    
    //Finally set the selected index to the new selection and reload it to expand
	[currentParticipantObject setisExpanded:YES];
	[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];

	previousParticipantObject=currentParticipantObject;
	previousSelectedIndex=[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
	[tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


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
    [super dealloc];
	[backgroundImage release];
}


@end
