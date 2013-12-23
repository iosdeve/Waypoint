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
#import <MapKit/MapKit.h>

@interface MoveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, MKMapViewDelegate, PSLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UILabel *lbPauseTip;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *setOffItem;
- (IBAction)beginOrStopTraveal:(id)sender;

@end
