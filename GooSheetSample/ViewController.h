//
//  ViewController.h
//  GooSheetSample
//
//  Created by Hokila Jan on 13/5/2.
//  Copyright (c) 2013年 Hokila Jan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SheetCell.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *sheetTable;

@end
