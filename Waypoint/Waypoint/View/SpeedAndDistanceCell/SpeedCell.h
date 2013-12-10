//
//  SpeedCell.h
//  Waypoint
//
//  Created by Steven on 12/9/13.
//  Copyright (c) 2013 陈欣. All rights reserved.
//

#import "NibBasedTableViewCell.h"

@interface SpeedCell : NibBasedTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lbCurrentSpeed;
@property (strong, nonatomic) IBOutlet UILabel *lbAverageSpeed;
@property (strong, nonatomic) IBOutlet UILabel *lbFastSpeed;

@end
