//
//  ProfileViewController.m
//  BluesBuddies
//
//  Created by IAN MURRAY on 22/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize nameLabel;
@synthesize bluesLabel;
@synthesize availableLabel;
@synthesize experienceImageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNameLabel:nil];
    [self setBluesLabel:nil];
    [self setAvailableLabel:nil];
    [self setExperienceImageView:nil];
    
    [super viewDidUnload];
}
- (IBAction)moodButtonPressed:(id)sender {
}

- (IBAction)mailButtonPressed:(id)sender {
}

- (IBAction)groupButtonPressed:(id)sender {
}

- (IBAction)messageButtonPressed:(id)sender {
}

- (IBAction)addButtonPressed:(id)sender {
}
@end
