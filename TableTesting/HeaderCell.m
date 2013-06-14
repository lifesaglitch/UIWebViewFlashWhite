//
//  HeaderCell.m
//  TableTesting
//
//  Created by Huan Lin on 6/13/13.
//  Copyright (c) 2013 Huan Lin. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

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

@end
