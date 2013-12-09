//
//  ViewController.h
//  Waypoint
//
//  Created by Steven on 12/6/13.
//  Copyright (c) 2013 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface ViewController : UIViewController<BMKMapViewDelegate>{
    CLLocation* _currentLocation;
}
@property (strong, nonatomic) IBOutlet BMKMapView *mapView;


@property (nonatomic, retain) NSMutableArray* points;
@property (nonatomic, retain) BMKPolyline* routeLine;
@property (nonatomic, retain) BMKPolylineView* routeLineView;
@property (nonatomic, retain) CLLocationManager* locationManager;

@end
