//
//  IntroductionScrollViewController.h
//  BluesBuddies
//
//  Created by IAN MURRAY on 21/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroductionScrollViewController : UIViewController <UIScrollViewDelegate>
{
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}
@property (weak, nonatomic) IBOutlet UIScrollView *introductionScrollView;

@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) NSArray *contentList;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage:(id)sender;

@end
