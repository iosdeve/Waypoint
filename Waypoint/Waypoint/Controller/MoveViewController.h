//
//  MoveViewController.h
//  Waypoint
//
//  Created by Steven on 12/9/13.
//  Copyright (c) 2013 陈欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "PSLocationManager.h"

@interface MoveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, BMKMapViewDelegate, PSLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet BMKMapView *mapView;
@property (nonatomic, retain) NSMutableArray* points;
@property (nonatomic, retain) BMKPolyline* routeLine;
@property (nonatomic, retain) BMKPolylineView* routeLineView;
@property (nonatomic, retain) CLLocationManager* locationManager;

@end
