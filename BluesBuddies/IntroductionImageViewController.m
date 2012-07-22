//
//  IntroductionImageViewController.m
//  BluesBuddies
//
//  Created by IAN MURRAY on 21/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "IntroductionImageViewController.h"

@interface IntroductionImageViewController ()

@end

@implementation IntroductionImageViewController
@synthesize introductionImageView;

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [self setIntroductionImageView:nil];
    [super viewDidUnload];
}
@end
