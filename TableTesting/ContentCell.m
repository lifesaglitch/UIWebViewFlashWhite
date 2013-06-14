//
//  ContentCell.m
//  TableTesting
//
//  Created by Huan Lin on 6/13/13.
//  Copyright (c) 2013 Huan Lin. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.placeholder.hidden = NO;
        
    }
    
    return self;
}


- (void)prepareForReuse
{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.placeholder.hidden = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
