//
//  WayPointUtilites.h
//  Waypoint
//
//  Created by Steven on 12/12/13.
//  Copyright (c) 2013 陈欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#import <CoreLocation/CoreLocation.h>

@interface WayPointUtilites : NSObject

//秒格式化为时，分，秒显示 00:00:00
+(NSString *) formatSeconds:(NSTimeInterval) seconds;

//GPS坐标转换为百度地图坐标
+ (CLLocationCoordinate2D )getBaiduFromGoogle:(CLLocationCoordinate2D )locationCoord;

@end
