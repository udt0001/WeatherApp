//
//  ViewController.m
//  WeatherApp
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "ViewController.h"
#import <WeatherDisplayController.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataSource = @[
                    @{
                        @"city": @"北京",
                        @"cityId": @"101010100"
                        },
                    @{
                        @"city": @"上海",
                        @"cityId": @"101020100"
                        },
                    @{
                        @"city": @"杭州",
                        @"cityId": @"101210101"
                        },
                    ];
    
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ( !cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *city = [_dataSource objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[city objectForKey:@"city"]];
    [cell.detailTextLabel setText:[city objectForKey:@"cityId"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *city = [_dataSource objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:[[WeatherDisplayController alloc] initWithCityId:[city objectForKey:@"cityId"]] animated:YES];
}

@end
