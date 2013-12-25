//
//  WayPointUtilites.m
//  Waypoint
//
//  Created by Steven on 12/12/13.
//  Copyright (c) 2013 陈欣. All rights reserved.
//

#import "WayPointUtilites.h"

UIKIT_EXTERN NSDictionary* BMKBaiduCoorForWgs84(CLLocationCoordinate2D coorWgs84);
UIKIT_EXTERN NSDictionary* BMKBaiduCoorForGcj(CLLocationCoordinate2D coorGcj);
UIKIT_EXTERN CLLocationCoordinate2D BMKCoorDictionaryDecode(NSDictionary* dictionary);


@implementation WayPointUtilites

+(NSString *) formatSeconds:(NSTimeInterval) seconds{
    NSString *time=[NSString stringWithFormat:@"%d%d:%d%d:%d%d",(int)seconds/3600/10,(int)seconds/3600%10,(int)seconds%3600/60/10,(int)seconds%3600/60%10,(int)seconds%60/10,(int)seconds%60%10];    
    return time;
//    return  [NSString stringWithFormat:@"%d%d:%d%d:%d%d",(int)seconds/3600/10,(int)seconds/3600%10,(int)seconds/60%60/10,(int)seconds/60%60/10,(int)seconds%60/10,(int)seconds%60%10];
//    NSDate *date=[NSDate dateWithTimeIntervalSinceReferenceDate:seconds];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter setDateFormat:@"HH:mm"];
//    //用[NSDate date]可以获取系统当前时间
//    NSString *currentDateStr = [dateFormatter stringFromDate:date];
//    //输出格式为：2010-10-27 10:22:13
//    NSLog(@"%@",currentDateStr);
//    
//    return currentDateStr;

}

+ (CLLocationCoordinate2D )getBaiduFromGoogle:(CLLocationCoordinate2D )locationCoord
{
    NSDictionary *baidudict =BMKBaiduCoorForGcj(CLLocationCoordinate2DMake(locationCoord.latitude, locationCoord.longitude));
    //NSLog(@"google坐标是:%f,%f",locationCoord.latitude,locationCoord.longitude);
    NSString *xbase64 =[baidudict objectForKey:@"x"];
    NSString *ybase64 = [baidudict objectForKey:@"y"];
    NSData *xdata = [GTMBase64 decodeString:xbase64];
    NSData *ydata = [GTMBase64 decodeString:ybase64];
    NSString *xstr = [[NSString alloc] initWithData:xdata encoding:NSUTF8StringEncoding];
    NSString *ystr = [[NSString alloc] initWithData:ydata encoding:NSUTF8StringEncoding];
    CLLocationCoordinate2D result;
    result.latitude =[ystr floatValue];
    result.longitude = [xstr floatValue];
    //NSLog(@"百度坐标是:%f,%f",result.latitude,result.longitude);
    return result;
}

@end
