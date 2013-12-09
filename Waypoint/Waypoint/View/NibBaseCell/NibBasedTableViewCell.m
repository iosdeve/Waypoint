//
//  NibBasedTableViewCell.m
//  PasswordManager
//
//  Created by Steven on 13-5-28.
//
//

#import "NibBasedTableViewCell.h"

@implementation NibBasedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib viewIndex:(int) index{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
		
        NSAssert2(([nibObjects count] > 0) &&
                  [[nibObjects objectAtIndex:index] isKindOfClass:[self class]],
                  @"Nib '%@' does not appear to contain a valid %@",
                  [self nibName], NSStringFromClass([self class]));
        
        cell = [nibObjects objectAtIndex:index];
    }
    return cell;
}


#pragma mark -
#pragma mark Nib support

+ (UINib *)nib {
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    return [UINib nibWithNibName:[self nibName] bundle:classBundle];
}

+ (NSString *)nibName {
    return [self cellIdentifier];
}


@end
