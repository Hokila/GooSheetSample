//
//  ViewController.m
//  GooSheetSample
//
//  Created by Hokila Jan on 13/5/2.
//  Copyright (c) 2013年 Hokila Jan. All rights reserved.
//

#import "ViewController.h"
#import "SVHTTPRequest.h"

@interface ViewController ()
@property (strong,nonatomic) NSArray* sheetList;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.sheetList = [[NSArray alloc]init];
    [self loadDataFromSheet];
}

-(void)loadDataFromSheet{
    /*
     fetch data from https://docs.google.com/spreadsheet/ccc?key=0AqPOk7uowgCPdF9aeWFFbkdZeU5Mbnhabm1jM1huY0E#gid=0
     */
    
    NSString *apiURL = @"https://spreadsheets.google.com/feeds/cells/0AqPOk7uowgCPdF9aeWFFbkdZeU5Mbnhabm1jM1huY0E/od6/public/basic?alt=json";
        
    [SVHTTPRequest GET:apiURL parameters:nil completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        if (error) {
            self.sheetList = nil;
            return ;
        }
        else{            
            NSDictionary* feedDic = [response objectForKey:@"feed"];
            self.sheetList= [self generateDic:feedDic];
        }
        
        [self.sheetTable reloadData];
    }];

}

-(NSArray*)generateDic:(NSDictionary*)aDic{
    NSMutableArray* generateArray = [NSMutableArray array];
    NSArray *entryList = [aDic objectForKey:@"entry"];

    [entryList enumerateObjectsUsingBlock:^(NSDictionary* entryItem, NSUInteger idx, BOOL *stop) {
        
        NSDictionary* contentDic = [entryItem objectForKey:@"content"];
        
        if ([[contentDic objectForKey:@"type"]isEqualToString:@"text"]) {
            NSString* itemStr = [contentDic objectForKey:@"$t"];
            NSLog(@"%@",itemStr);
            [generateArray addObject:itemStr];
        }
    }];
    
    return [NSArray arrayWithArray:generateArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sheetList count]/3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SheetCell"];
    [self configureCell:cell ForRowAtIndexPath:indexPath];
    
    return cell;
}

-(void)configureCell:(UITableViewCell*)cell ForRowAtIndexPath:(NSIndexPath *)indexPath{
    SheetCell* sheetItemCell = (SheetCell*)cell;
    if (3*indexPath.row +2 < [self.sheetList count]) {
        sheetItemCell.firstLabel.text = [self.sheetList objectAtIndex:3*indexPath.row ];
        sheetItemCell.secondLabel.text = [self.sheetList objectAtIndex:3*indexPath.row +1];
        sheetItemCell.thirdLabel.text = [self.sheetList objectAtIndex:3*indexPath.row +2];
    }
}
    @end
