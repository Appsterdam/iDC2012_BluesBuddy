//
//  ProfileViewController.h
//  BluesBuddies
//
//  Created by IAN MURRAY on 22/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bluesLabel;
@property (weak, nonatomic) IBOutlet UILabel *availableLabel;
@property (weak, nonatomic) IBOutlet UIImageView *experienceImageView;

- (IBAction)moodButtonPressed:(id)sender;

- (IBAction)mailButtonPressed:(id)sender;
- (IBAction)groupButtonPressed:(id)sender;
- (IBAction)messageButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;



@end
