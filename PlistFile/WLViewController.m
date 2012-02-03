//
//  WLViewController.m
//  PlistFile
//
//  Created by hazwan abu hassan on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WLViewController.h"
#import "StatesTableViewController.h";

@implementation WLViewController
@synthesize titleLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) dealloc {
    [super dealloc];
}
#pragma mark - View lifecycle
- (id)readPlist:(NSString *)fileName 
{
    NSData *plistData;
    NSString *error;
    NSPropertyListFormat format;
    id plist;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    plistData = [NSData dataWithContentsOfFile:localizedPath]; 
    
    plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
    if (!plist) {
        NSLog(@"Error reading plist from file '%s', error = '%s'", [localizedPath UTF8String], [error UTF8String]);
        [error release];
    }
    
    return plist;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [titleLabel setText:[[self readPlist:@"sample"] objectForKey:@"Title"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)statesBtnPress:(id)sender
{
    StatesTableViewController *statesTableViewController = [[[StatesTableViewController alloc] initWithNibName:@"StatesTableViewController" bundle:nil] autorelease];
    UINavigationController *navigationController = [[[UINavigationController alloc]
                initWithRootViewController:statesTableViewController] autorelease];
    
    [self presentModalViewController:navigationController animated:YES];
    
}

@end
