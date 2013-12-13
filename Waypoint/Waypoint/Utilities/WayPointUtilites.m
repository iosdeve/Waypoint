//
//  WayPointUtilites.m
//  Waypoint
//
//  Created by Steven on 12/12/13.
//  Copyright (c) 2013 陈欣. All rights reserved.
//

#import "WayPointUtilites.h"

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

@end
