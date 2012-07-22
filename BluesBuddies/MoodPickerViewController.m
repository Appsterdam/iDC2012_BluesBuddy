//
//  MoodPickerViewController.m
//  BluesBuddies
//
//  Created by Sijmen Mulder on 22-07-12.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "MoodPickerViewController.h"
#import "Mood.h"

@implementation MoodPickerViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidLoad
{
	UIView *view = [self view];
	for (int i = 0; i < 9; i++) {
		Mood *mood = [[Mood allMoods] objectAtIndex:i];
		UIButton *button = (UIButton *)[view viewWithTag:i+1];
		[button setImage:[mood image] forState:UIControlStateNormal];
		[button addTarget:self action:@selector(pickMood:) forControlEvents:UIControlEventTouchUpInside];
	}
}

- (IBAction)pickMood:(id)sender
{
	int moodIndex = [sender tag] - 1;
	Mood *mood = [[Mood allMoods] objectAtIndex:moodIndex];
	[mood makeCurrent];

	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
	[[self presentingViewController] dismissModalViewControllerAnimated:YES];
}

@end
