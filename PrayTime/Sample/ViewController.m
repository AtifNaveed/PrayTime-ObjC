//
//  ViewController.m
//  PrayTime
//
//  Created by Atif on 04/09/2018.
//  Copyright © 2018 atif.gcucs@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "PrayTime.h"

@interface ViewController ()
{
    NSMutableArray *prayerTimeList;
    PrayTime *prayTime;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    prayerTimeList = [[NSMutableArray alloc]init];
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:5];           // Day
    [dateComps setMonth:9];         // Month
    [dateComps setYear:2018];       // Year

    prayTime = [[PrayTime alloc] init];                     // Intilalize PrayTime
    [prayTime setCalcMethod:(int)prayTime.Karachi];         // Calculation Method
    [prayTime setTimeFormat:(int)prayTime.Time12];          // Pray Time Format
    prayerTimeList = [prayTime getPrayerTimes:dateComps     // Pray Time List
                                  andLatitude:40.730610
                                 andLongitude:-73.935242
                                  andtimeZone:-4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [prayerTimeList count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
    cell.textLabel.text = [prayTime.timeNames objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [prayerTimeList objectAtIndex:indexPath.row];
    
    return cell;
}


@end
