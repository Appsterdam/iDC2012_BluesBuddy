//
//  MapViewController.m
//  BluesBuddies
//
//  Created by IAN MURRAY on 21/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "MapViewController.h"
#import "PhoneViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize buddyMapView = _buddyMapView;
@synthesize buddySearchBar = _buddySearchBar;

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
    
    self.buddySearchBar.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [self setBuddyMapView:nil];
    [self setBuddySearchBar:nil];
    [super viewDidUnload];
}

#pragma - MKMapViewDelegate methods
- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView;
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView;
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error;
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(NA, 4_0);
{
//    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(_buddyMapView.userLocation.location.coordinate, 1000,1000);
//    MKCoordinateRegion adjustedRegion = [_buddyMapView regionThatFits:viewRegion];
//    [_buddyMapView setRegion:adjustedRegion animated:NO];
    
//    MKCircle *circle = [MKCircle circleWithCenterCoordinate:_buddyMapView.userLocation.location.coordinate radius:500];
//    
//    [_buddyMapView addOverlay:circle]; // Must add new overlay before removing old overlays
//    NSArray *overlays = [NSArray arrayWithArray:_buddyMapView.overlays];
//    for (id overlay in overlays)
//        if (overlay != circle)
//            [_buddyMapView removeOverlay:overlay];
}

- (MKOverlayView *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay
{
    if (![overlay isKindOfClass:[MKCircle class]])
        return nil;
    
    MKCircleView *circleView = [[MKCircleView alloc] initWithOverlay:overlay];
    circleView.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
    return circleView;
}

#pragma - UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    self.buddySearchBar.text = searchBar.text;
    NSLog(@"search bar %@",self.buddySearchBar.text);
    
    [searchBar resignFirstResponder];
    
    [self fetchCoordinates];
    
}

#pragma mark geocoding stuff

- (void)fetchCoordinates
{
    NSLog(@"Fetch Coordinates");
    if (!self.geocoder) {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    
    NSString *address = [NSString stringWithFormat:@"%@", self.buddySearchBar.text];
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            
            NSLog(@"given geocode location: %f %f", coordinate.latitude, coordinate.longitude);
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            MKCoordinateSpan theSpan = MKCoordinateSpanMake(.02, .02);
            CLLocationCoordinate2D theCenter = {coordinate.latitude, coordinate.longitude};
            
            //automatisch volgen van user location, blauw bolletje
            MKCoordinateRegion theRegion = MKCoordinateRegionMake(theCenter, theSpan);
            [self.buddyMapView setRegion:theRegion animated:YES];
            
            MKCircle *circle = [MKCircle circleWithCenterCoordinate:_buddyMapView.region.center radius:1000];
            
            [_buddyMapView addOverlay:circle]; // Must add new overlay before removing old overlays
            NSArray *overlays = [NSArray arrayWithArray:_buddyMapView.overlays];
            for (id overlay in overlays)
                if (overlay != circle)
                    [_buddyMapView removeOverlay:overlay];
        }
    }];
}

//-(IBAction)gotoNextScreen:(id)sender {
//    PhoneViewController *pvc = [[PhoneViewController alloc] initWithNibName:@"PhoneViewController"bundle: nil];
//    
//    [self.navigationController pushViewController:pvc animated:YES];
//}


@end
