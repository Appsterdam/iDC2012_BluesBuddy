//
//  IntroductionScrollViewController.m
//  BluesBuddies
//
//  Created by IAN MURRAY on 21/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "IntroductionScrollViewController.h"
#import "IntroductionImageViewController.h"

static NSUInteger kNumberOfPages = 6;

static NSString *NameKey = @"nameKey";
static NSString *ImageKey = @"imageKey";

@interface IntroductionScrollViewController ()
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender; 
@end

@implementation IntroductionScrollViewController
@synthesize introductionScrollView;
@synthesize pageControl;
@synthesize viewControllers;
@synthesize contentList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void) viewDidLoad
{
    // Initialization code
    NSArray* imagesArray = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"small_one.png"],
                            [UIImage imageNamed:@"small_two.png"],
                            [UIImage imageNamed:@"small_three.png"],
                            [UIImage imageNamed:@"small_four.png"],
                            [UIImage imageNamed:@"small_five.png"],
                            [UIImage imageNamed:@"small_six.png"],
                            nil];
    
    self.contentList = imagesArray;
    NSLog(@"contentlist %d",[self.contentList count]);
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    
    // a page is the width of the scroll view
    introductionScrollView.pagingEnabled = YES;
    introductionScrollView.contentSize = CGSizeMake(introductionScrollView.frame.size.width * kNumberOfPages, 300);
    introductionScrollView.showsHorizontalScrollIndicator = NO;
    introductionScrollView.showsVerticalScrollIndicator = NO;
    introductionScrollView.scrollsToTop = NO;
    introductionScrollView.delegate = self;
    
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
    
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}


- (void)loadScrollViewWithPage:(int)page
{
    NSLog(@"loadScrollViewWithPage");
    if (page < 0)
        return;
    if (page >= kNumberOfPages)
        return;
    
    
    // replace the placeholder if necessary
    IntroductionImageViewController *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                    @"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
        
        controller = [storyboard instantiateViewControllerWithIdentifier:@"IntroductionImageViewController"];
        
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = self.introductionScrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.introductionScrollView addSubview:controller.view];
        
        UIImage *image = [self.contentList objectAtIndex:page];
        [controller.introductionImageView setImage:image];
        
        //[imageView setImage:image];
        //controller.imageView = [UIImage imageNamed:[numberItem valueForKey:ImageKey]];
        
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.introductionScrollView.frame.size.width;
    int page = floor((self.introductionScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender {
    int page = self.pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = self.introductionScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.introductionScrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

@end
