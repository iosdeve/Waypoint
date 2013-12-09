//
//  NibBasedTableViewCell.h
//  PasswordManager
//
//  Created by Steven on 13-5-28.
//
//

#import <UIKit/UIKit.h>

@interface NibBasedTableViewCell : UITableViewCell

+ (UINib *)nib;
+ (NSString *)nibName;

+ (NSString *)cellIdentifier;
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib viewIndex:(int) index;

@end
