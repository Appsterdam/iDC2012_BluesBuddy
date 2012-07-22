//
//  PhoneViewController.h
//  BluesBuddies
//
//  Created by David Kousemaker on 20-07-1229.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *phoneTableViewController;



@end
