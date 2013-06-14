//
//  ViewController.m
//  TableTesting
//
//  Created by Huan Lin on 6/13/13.
//  Copyright (c) 2013 Huan Lin. All rights reserved.
//

#import "ViewController.h"
#import "ContentCell.h"
#import "HeaderCell.h"

@interface ViewController () {
    int _expandedSection;
}

@property (nonatomic, strong) NSArray *data;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView.backgroundColor = [UIColor clearColor];
    
    _expandedSection = -1;
    
    
    self.data = @[
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"},
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"},
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"},
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"},
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"},
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"},
                  @{@"title": @"this is announcement", @"day": @"20", @"month": @"may", @"content": @"this is content"}
                  ];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_expandedSection == section) {
        return 2;
    }
    else {
        return 1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.row == 0 )
    {
        return 54;
    }
    else
    {
        return 225;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if ( indexPath.row == 0 )
    {
        HeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
        
        cell.textLabel.text = self.data[indexPath.section][@"title"];
        
        
        return cell;
    }
    else
    {
        ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell"];
        [cell.contentView loadHTMLString:@"<html><body style='background-color: #ff0000'>this is contentasdoifjoiwjeofiqjweoifjqopweifj </body></html>" baseURL:nil];
        
        
        
        //set the back ground color in cell?
        //        cell.contentWebView.text = @"this is the content";
        //        [cell setWebViewContent:@"<html><head></head><body style='background-color:#000000; color:#FFFFFF'><p>this is content<p></body></html>"];
        return cell;
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ( indexPath.row == 0 )
    {
        if ( _expandedSection == indexPath.section )
        {
            //if originally expanded
            //close it
            _expandedSection = -1;
            
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
            
        }
        else
        {
            
            
            [tableView beginUpdates];
            
            
            //remove originally expanded item
            if ( _expandedSection != -1 )
            {
                int sectionToBeRemoved = _expandedSection;
                _expandedSection = -1;
                
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:1 inSection:sectionToBeRemoved]] withRowAnimation:UITableViewRowAnimationAutomatic];
                
            }
            
            //open a new session
            _expandedSection = indexPath.section;
            
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationTop];
            
            [tableView endUpdates];
            
            [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            
            
        }
        
    }
}

@end
