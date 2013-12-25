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

@interface MoveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, BMKMapViewDelegate, PSLocationManagerDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet BMKMapView *mapView;

@property (strong, nonatomic) IBOutlet UILabel *lbPauseTip;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *setOffItem;
- (IBAction)beginOrStopTraveal:(id)sender;

@end
