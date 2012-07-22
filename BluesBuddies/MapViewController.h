//
//  MapViewController.h
//  BluesBuddies
//
//  Created by IAN MURRAY on 21/07/2012.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController : UIViewController  <MKMapViewDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *buddyMapView;
@property (weak, nonatomic) IBOutlet UISearchBar *buddySearchBar;

@property (nonatomic, strong) CLGeocoder *geocoder;

- (void)fetchCoordinates;

//-(IBAction)gotoNextScreen:(id)sender;

@end
