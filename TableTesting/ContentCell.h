//
//  ContentCell.h
//  TableTesting
//
//  Created by Huan Lin on 6/13/13.
//  Copyright (c) 2013 Huan Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIWebView *contentView;
@property (weak, nonatomic) IBOutlet UIView *placeholder;

@end
