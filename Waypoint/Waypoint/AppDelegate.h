//
//  AppDelegate.h
//  Waypoint
//
//  Created by Steven on 12/6/13.
//  Copyright (c) 2013 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@class MoveViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MoveViewController *viewController;

@property (strong, nonatomic) BMKMapManager *mapManager;

@end
