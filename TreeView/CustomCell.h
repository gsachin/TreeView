//
//  CustomCell.h
//  TreeView
//
//  Created by  on 21/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubCustomCell.h"
#import "Node.h"
#import "CustomTableView.h"
#import "CustomCellDelegate.h"
@class ViewController;
@interface CustomCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)Node *dataAraay;
//@property (nonatomic,strong)SubCustomCell *subcell;
@property (nonatomic,strong)UILabel *lblTitle;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)CustomTableView *subMenuTableView;
@property (weak,nonatomic) Node *supperNode;
@property(nonatomic,weak)id<CustomCellDelegate> delegate;
@end
