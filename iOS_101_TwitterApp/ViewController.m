//
//  ViewController.m
//  iOS_101_TwitterApp
//
//  Created by Tomasz Janeczko on 03/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ServiceFactory.h"
#import "TwitterServiceProtocol.h"

@implementation ViewController {
    __weak IBOutlet UITableView *_tableView;

    NSArray *_tweets;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)refreshButtonTapped:(UIBarButtonItem *)sender {
    id<TwitterServiceProtocol> service = [[ServiceFactory new] onlineTwitterService];

    [service recentTweetsForHashTag:@"iOS" withSuccessBlock:^(NSArray *tweets) {
        _tweets = tweets;
        [_tableView reloadData];
    } errorBlock:^{

    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellID = @"MagicId";

    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID];
    }

    NSDictionary *tweet = _tweets[(NSUInteger) indexPath.row];
    cell.textLabel.text = tweet[@"text"];
    cell.detailTextLabel.text = tweet[@"from_user_name"];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tweets.count;
}


@end