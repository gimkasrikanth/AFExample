//
//  ViewController.m
//  JSONExample
//
//  Created by Kvana Mac Pro 2 on 12/30/15.
//  Copyright © 2015 Kvana Mac Pro 2. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <MBProgressHUD.h>
@interface ViewController ()

@end

@implementation ViewController{
    UITableView *tableView;
    NSMutableArray *userArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDataFromServer];
    self.view.backgroundColor=[UIColor grayColor];
    userArray=[[NSMutableArray alloc]init];
    
    
    tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 500)];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];

    tableView.backgroundColor=[UIColor grayColor];

}

-(void)getDataFromServer{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager GET:@"http://jsonplaceholder.typicode.com/posts" parameters:@{} success:^(AFHTTPRequestOperation *operation, id  responseObject) {
        [userArray addObjectsFromArray:responseObject];
        [tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        

        
        
        
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CELLIDENTIFIER=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELLIDENTIFIER];
    }
    NSDictionary *user=[userArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[user valueForKey:@"title"];
    cell.detailTextLabel.text=[user valueForKey:@"body"];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
