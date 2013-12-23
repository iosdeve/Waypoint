//
//  MoveViewController.m
//  Waypoint
//
//  Created by Steven on 12/9/13.
//  Copyright (c) 2013 陈欣. All rights reserved.
//

#import "MoveViewController.h"
#import "SpeedCell.h"
#import "TakeTimeCell.h"
#import "WayPointUtilites.h"
#import <GPX/GPX.h>
#import "TrackPoint.h"


@interface MoveViewController (){
    SpeedCell *speedCell;
    TakeTimeCell *takeTimeCell;
    CLLocation* _currentLocation;
}

@end

@implementation MoveViewController

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
    //设置地图缩放级别
    //[_mapView setZoomLevel:16];
    self.mapView.showsUserLocation = YES;//先关闭显示的定位图层
    self.mapView.userInteractionEnabled = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeNone;
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;//指定需要的精度级别
    locationManager.distanceFilter=1000.0f;//设置距离筛选器
    [locationManager startUpdatingLocation];//启动位置管理器
    MKCoordinateSpan theSpan;
    //地图的范围 越小越精确
    theSpan.latitudeDelta=0.04;
    theSpan.longitudeDelta=0.04;
    MKCoordinateRegion theRegion;
    theRegion.center=[[locationManager location] coordinate];
    theRegion.span=theSpan;
    [self.mapView setRegion:theRegion];
    [locationManager stopUpdatingLocation];
    locationManager=nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineView *overlayView = [[MKPolylineView alloc] initWithOverlay:overlay];
    overlayView.strokeColor = [UIColor blueColor];
    overlayView.lineWidth = 5.f;
    
    return overlayView;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        speedCell=[SpeedCell cellForTableView:tableView fromNib:[SpeedCell nib] viewIndex:0];
        return speedCell;
        
    }else if (indexPath.row==1){
        takeTimeCell=[TakeTimeCell cellForTableView:tableView fromNib:[TakeTimeCell nib] viewIndex:0];
        return takeTimeCell;
    }
    return nil;
}

#pragma mark PSLocationManagerDelegate

- (void)locationManager:(PSLocationManager *)locationManager signalStrengthChanged:(PSLocationManagerGPSSignalStrength)signalStrength {
    NSString *strengthText;
    if (signalStrength == PSLocationManagerGPSSignalStrengthWeak) {
        strengthText = NSLocalizedString(@"Weak", @"");
    } else if (signalStrength == PSLocationManagerGPSSignalStrengthStrong) {
        strengthText = NSLocalizedString(@"Strong", @"");
    } else {
        strengthText = NSLocalizedString(@"...", @"");
    }
}

- (void)locationManagerSignalConsistentlyWeak:(PSLocationManager *)locationManager {

}

- (void)locationManager:(PSLocationManager *)locationManager distanceUpdated:(CLLocationDistance)distance {
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive){
        //self.distanceLabel.text = [NSString stringWithFormat:@"%.2f %@", distance, NSLocalizedString(@"meters", @"")];
        speedCell.lbAverageSpeed.text=[NSString stringWithFormat:@"%.2f ",locationManager.totalDistance/locationManager.totalSeconds *3600/1000];
        takeTimeCell.lbDistance.text=[NSString stringWithFormat:@"%.2f", (float)distance/1000];
        speedCell.lbTakeTime.text=[NSString stringWithFormat:@"%@ ",[WayPointUtilites formatSeconds:locationManager.totalSeconds]];
        takeTimeCell.lbAltitude.text=[NSString stringWithFormat:@"%d ",locationManager.currentAltitude];
    }
}

- (void)locationManager:(PSLocationManager *)locationManager waypoint:(CLLocation *)waypoint calculatedSpeed:(double)calculatedSpeed{
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive){
        speedCell.lbCurrentSpeed.text=[NSString stringWithFormat:@"%.2f ",locationManager.currentSpeed*3600/1000];
    }
}

//控制自动暂停文字的显示
- (void)locationManager:(PSLocationManager *)locationManager pauseTimeTip:(BOOL) show{
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive){
        if (show) {
            self.lbPauseTip.hidden=NO;
        }else{
            self.lbPauseTip.hidden=YES;
        }
    }
}
//在地图上生成点的运动轨迹
- (void)locationManager:(PSLocationManager *)locationManager updateOverlay:(Track *) track{
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive){
        if (!track) {
            return;
        }
        
        NSArray *trackPoints = track.sotredTrackPoints;
        
        CLLocationCoordinate2D coors[trackPoints.count];
        
        int i = 0;
        for (TrackPoint *trackPoint in trackPoints) {
            coors[i] = trackPoint.coordinate;
            i++;
        }
        
        MKPolyline *line = [MKPolyline polylineWithCoordinates:coors count:trackPoints.count];
        
        // replace overlay
        [self.mapView removeOverlays:self.mapView.overlays];
        [self.mapView addOverlay:line];
        //设置新位置居中
        [self.mapView setCenterCoordinate:coors[0] animated:YES];
    }
    
}

- (void)locationManager:(PSLocationManager *)locationManager error:(NSError *)error {
    // location services is probably not enabled for the app

}


- (IBAction)beginOrStopTraveal:(id)sender {
    if (self.setOffItem.tag==0) {
        self.setOffItem.tag=1;
        self.setOffItem.title=@"结束";
        [PSLocationManager sharedLocationManager].delegate = self;
        [[PSLocationManager sharedLocationManager] prepLocationUpdates];
        [[PSLocationManager sharedLocationManager] startLocationUpdates];
    }else{
        self.setOffItem.tag=0;
        self.setOffItem.title=@"出发";
        [PSLocationManager sharedLocationManager].delegate = nil;
        [[PSLocationManager sharedLocationManager] stopLocationUpdates];
        [[PSLocationManager sharedLocationManager] resetLocationUpdates];
    }
    
}
@end
