//
//  EMModelFactory.m
//  CompuwareEventManager
//
//  Created by mibjwg0 on 8/3/11.
//  Copyright 2011 Compuware Corporation. All rights reserved.
//

#import "EMModelFactory.h"
#import "EMConstants.h"
#import "EMParticipantEntity.h"
#import "EMAgendaEntity.h"
#import "EMHomeEntity.h"
#import "EMAboutEliteEntity.h"
#import "EMAboutMobilityEntity.h"
#import "EMAboutAppsEntity.h"


@implementation EMModelFactory


+ (EMModelFactory *)sharedModelFactory
{
	static EMModelFactory *sharedModelFactory;
	
	@synchronized(self) {
		if (!sharedModelFactory) {
			sharedModelFactory = [[EMModelFactory alloc] init];
		}
	}
	return sharedModelFactory;
}

-(NSArray *) loadAttendeesProfile
{
	NSMutableArray *tempArray=[NSMutableArray array];

	NSString *path = [[NSBundle mainBundle] pathForResource:@"attendees" ofType:@"plist"];
	NSArray *root = [[NSArray alloc]initWithContentsOfFile:path];
	for(int i=0;i<[root count];i++)
	{
		NSDictionary *tempDict=[root objectAtIndex:i];
		EMParticipantEntity *participantObj=[[EMParticipantEntity alloc] init];
		participantObj.participantName= [tempDict valueForKey:NAME];
		participantObj.participantTitle=[tempDict valueForKey:TITLE];
		participantObj.participantBiography=[tempDict valueForKey:BIOGRAPHY];
		participantObj.participantType=[tempDict valueForKey:TYPE];
		participantObj.participantUserName=[tempDict valueForKey:USERNAME];
		participantObj.participantPassword=[tempDict valueForKey:PASSWORD];
		participantObj.participantRealEmail=[tempDict valueForKey:EMAIL];
		participantObj.participantPictureName = [tempDict valueForKey:PICTURE];
		NSString *attendeeImageName=participantObj.participantPictureName;
		
		NSString *attendeeImageNamePath = [NSString stringWithFormat:@"/Images_Attendees/%@", 
										   attendeeImageName];
		participantObj.participantPicture= [UIImage imageNamed:attendeeImageNamePath];
		participantObj.participantTypeTitle=[tempDict valueForKey:TYPETITLE];
		[participantObj setisExpanded:NO];
		[tempArray addObject:participantObj];
		[participantObj release];
	}
	
	
	// Sort the array by Name
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"participantName" ascending:YES] autorelease];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:sortDescriptors];
	
	
	NSMutableArray *facilitatorTempArray= [NSMutableArray array];
	NSMutableArray *participantTempArray= [NSMutableArray array];
	for(int i=0;i<[sortedArray count];i++)
	{
		EMParticipantEntity *participantObj=[sortedArray objectAtIndex:i];
		if([participantObj.participantType isEqualToString:@"Featured Guest"])
		{
			[facilitatorTempArray addObject:participantObj];
		}
		else if([participantObj.participantType isEqualToString:@"Participant"])
		{
			[participantTempArray addObject:participantObj];
		}
	}
	NSDictionary *facilitatorDictionary = [NSDictionary dictionaryWithObject:facilitatorTempArray forKey:@"People"];	
	NSDictionary *participantDictionary =[NSDictionary dictionaryWithObject:participantTempArray forKey:@"People"];
	
	NSArray *attendeesArray = [NSArray arrayWithObjects:facilitatorDictionary,participantDictionary,nil];
	return attendeesArray;
}


-(NSArray *)loadHome
{
	NSMutableArray *tempArray=[NSMutableArray array];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"plist"];
	NSArray *root = [[NSArray alloc]initWithContentsOfFile:path];
	for(int i=0;i<[root count];i++)
	{
		NSDictionary *tempDict=[root objectAtIndex:i];
		EMHomeEntity *homeObj=[[EMHomeEntity alloc] init];
		homeObj.homeMessage= [tempDict valueForKey:MESSAGE];
		homeObj.paulTitle=[tempDict valueForKey:TITLE];
		[tempArray addObject:homeObj];
		[homeObj release];
	}
	NSArray *homeArray=[NSArray arrayWithArray:tempArray];
	return homeArray;
}

-(NSArray *)loadCecAbout
{
	NSMutableArray *tempArray=[NSMutableArray array];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"aboutcec" ofType:@"plist"];
	NSArray *root = [[NSArray alloc]initWithContentsOfFile:path];
	for(int i=0;i<[root count];i++)
	{
		NSDictionary *tempDict=[root objectAtIndex:i];
		EMAboutEliteEntity *cecAboutObj=[[EMAboutEliteEntity alloc] init];
		cecAboutObj.information= [tempDict valueForKey:INFORMATION];
		[tempArray addObject:cecAboutObj];
		[cecAboutObj release];
	}
	NSArray *cecAboutArray=[NSArray arrayWithArray:tempArray];
	return cecAboutArray;
}

-(NSArray *)loadMcoeAbout
{
	NSMutableArray *tempArray=[NSMutableArray array];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"aboutmcoe" ofType:@"plist"];
	NSArray *root = [[NSArray alloc]initWithContentsOfFile:path];
	for(int i=0;i<[root count];i++)
	{
		NSDictionary *tempDict=[root objectAtIndex:i];
		EMAboutMobilityEntity *mobilityAboutObj=[[EMAboutMobilityEntity alloc] init];
		mobilityAboutObj.information= [tempDict valueForKey:INFORMATION];
		[tempArray addObject:mobilityAboutObj];
		[mobilityAboutObj release];
	}
	NSArray *mcoeAboutArray=[NSArray arrayWithArray:tempArray];
	return mcoeAboutArray;
}

-(NSArray *) loadAppsAbout
{
	NSMutableArray *tempArray=[NSMutableArray array];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"aboutapps" ofType:@"plist"];
	NSArray *root = [[NSArray alloc]initWithContentsOfFile:path];
	for(int i=0;i<[root count];i++)
	{
		NSDictionary *tempDict=[root objectAtIndex:i];
		EMAboutAppsEntity *appsAboutObj=[[EMAboutAppsEntity alloc] init];
		appsAboutObj.appName= [tempDict valueForKey:APPNAME];
		appsAboutObj.appIconImageName=[tempDict valueForKey:APPICON];
		NSString *appImageName=appsAboutObj.appIconImageName;
		NSString *appImageNamePath = [NSString stringWithFormat:@"/Images_Apps/%@", appImageName];
		appsAboutObj.appIcon=[UIImage imageNamed:appImageNamePath];
		appsAboutObj.appType=[tempDict valueForKey:APPTYPE];
		appsAboutObj.screenshotOrientation=[tempDict valueForKey:ORIENTATION];
		appsAboutObj.iTunesURL=[tempDict valueForKey:iTUNESURL];
		appsAboutObj.screenshotOneImageName=[tempDict valueForKey:SS1];
		NSString *screenshotOneImage=appsAboutObj.screenshotOneImageName;
		NSString *screenshotOneImageNamePath = [NSString stringWithFormat:@"/Images_Apps/%@", screenshotOneImage];
		appsAboutObj.screenshotOneImage=[UIImage imageNamed:screenshotOneImageNamePath];
		appsAboutObj.screenshotTwoImageName=[tempDict valueForKey:SS2];
		NSString *screenshotTwoImage=appsAboutObj.screenshotTwoImageName;
		NSString *screenshotTwoImageNamePath = [NSString stringWithFormat:@"/Images_Apps/%@", screenshotTwoImage];
		appsAboutObj.screenshotTwoImage=[UIImage imageNamed:screenshotTwoImageNamePath];
		
		if([appsAboutObj.screenshotOrientation isEqualToString:@"Portrait"])
		{
			appsAboutObj.screenshotThreeImageName=[tempDict valueForKey:SS3];
			NSString *screenshotThreeImage=appsAboutObj.screenshotThreeImageName;
			NSString *screenshotThreeImageNamePath = [NSString stringWithFormat:@"/Images_Apps/%@", screenshotThreeImage];
			appsAboutObj.screenshotThreeImage=[UIImage imageNamed:screenshotThreeImageNamePath];
		}
		
		appsAboutObj.appDescription=[tempDict valueForKey:APPDESCRIPTION];
		appsAboutObj.appPlatforms=[tempDict valueForKey:PLATFORM];
		[appsAboutObj setisExpanded:NO];
		[tempArray addObject:appsAboutObj];
		[appsAboutObj release];
	}
	
	// Sort the array by AppName
	NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"appName" ascending:YES] autorelease];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:sortDescriptors];

	NSMutableArray *consumerAppsTempArray=[NSMutableArray array];
	NSMutableArray *enterpriseAppsTempArray=[NSMutableArray array];
	for(int i=0;i<[sortedArray count];i++)
	{
		EMAboutAppsEntity *appsAboutObj=[sortedArray objectAtIndex:i];
		if([appsAboutObj.appType isEqualToString:@"Consumer Apps"])
		{
			[consumerAppsTempArray addObject:appsAboutObj];
		}
		else if([appsAboutObj.appType isEqualToString:@"Enterprise Apps"])
		{
			[enterpriseAppsTempArray addObject:appsAboutObj];
		}
	}
	NSDictionary *consumerAppsDictionary = [NSDictionary dictionaryWithObject:consumerAppsTempArray forKey:@"Apps"];	
	NSDictionary *enterpriseAppsDictionary =[NSDictionary dictionaryWithObject:enterpriseAppsTempArray forKey:@"Apps"];
	
	NSArray *aboutAppsArray= [NSArray arrayWithObjects:consumerAppsDictionary,enterpriseAppsDictionary,nil];
	return aboutAppsArray;
}

@end
