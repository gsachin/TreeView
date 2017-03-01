//
//  CustomCell.m
//  TreeView
//
//  Created by  on 30/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize dataAraay; //array to hold submenu data

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 10, 300, 50);
        _lblTitle=[UILabel new];
        [_lblTitle setTextColor:[UIColor whiteColor]];
        _lblTitle.frame = CGRectMake(0, 0, 300, 44);
        _lblTitle.backgroundColor=[UIColor colorWithRed:0.3f green:0.2f blue:0.0f alpha:0.5f];
        [self addSubview:_lblTitle];

        _subMenuTableView = [[CustomTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
         _subMenuTableView.CellList=[[NSMutableArray alloc]init];
            _subMenuTableView.tag = 100;
            _subMenuTableView.delegate = self;
            _subMenuTableView.dataSource = self;
            [self addSubview:_subMenuTableView];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withTagPostFix:(int)i
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //self.lblTitle=[[UILabel alloc]initWithStyle:style reuseIdentifier:reuseIdentifier];
        //self.subcell
       // [self addSubview:self.subcell];
        
       // [self.subcell fillCellWithNode:dataAraay];
        //self.subcell.frame =CGRectMake(0, 0, 300, 44);
       // [self.subcell setBackgroundColor:[UIColor brownColor]];
//        //self.frame = CGRectMake(0, 0, 300, 50);
        _lblTitle=[UILabel new];
                [_lblTitle setTextColor:[UIColor whiteColor]];
        _lblTitle.frame = CGRectMake(0, 0, 250, 44);
        _btn=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        _btn.frame = CGRectMake(250, 0, 50, 44);
        
        [_btn addTarget:self action:@selector(abcd:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_lblTitle];
        [self addSubview:_btn];
        
            _subMenuTableView = [[CustomTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _subMenuTableView.CellList=[[NSMutableArray alloc]init];
            _subMenuTableView.delegate = self;
            _subMenuTableView.dataSource = self;
            
            [self addSubview:_subMenuTableView];
        
    
        [self clipsToBounds];
        
        
    }
    
    return self;
}
- (void)abcd:(id)sender;
{
    id view = [self superview];
    
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }

    UITableView *tableView = (UITableView *)view;
    NSIndexPath *indexpath = [tableView indexPathForRowAtPoint:((UIView *)self).center];
    CustomCell *cell=(CustomCell *)[tableView cellForRowAtIndexPath:indexpath];
    UITableView *vw=cell.subMenuTableView;
    if([self.dataAraay.IsExpanded isEqualToString:@"true"]){
        [self setISExpandedToFalse:self.dataAraay];
    }else{self.dataAraay.IsExpanded=@"true";}
   // [self reloadSupperView:vw];
    [vw setHidden:![self.dataAraay.IsExpanded isEqualToString:@"true"]?true:false];
    [_delegate reloadview:_delegate.aTV];
}
-(void)setISExpandedToFalse:(Node *)node
{
    for (Node *obj in node.NodeList) {
        if (obj.NodeList !=nil) {
            [self setISExpandedToFalse:obj];
        }
        obj.IsExpanded=@"false";
    }
    node.IsExpanded=@"false";
}
-(void)reloadSupperView:(UIView *)tblView
{
    
//    UIView *view=tblView;
//    while (view && [view isKindOfClass:[UITableView class]] == NO) {
//        view = [view superview];
//    }
//    if (view==nil) {
//        return;
//    }
//     UITableView *tableView = (UITableView *)view;
//    [self reloadSupperView:tableView.superview];
    //if(
    //if([tblView respondsToSelector:@selector(reloadData)])
    //[(UITableView *)tblView reloadData];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _subMenuTableView.frame = CGRectMake(5, 44, self.bounds.size.width-5,self.bounds.size.height-45);
    [_subMenuTableView setContentInset:UIEdgeInsetsZero];
    if (self.dataAraay.NodeType%2==1)
    {
        self.backgroundColor=[UIColor clearColor];
        _subMenuTableView.backgroundColor = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:0.5f];

    }
    
    if (self.dataAraay.NodeType%2==0) {
        self.backgroundColor=[UIColor clearColor];
        _subMenuTableView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f];
        

    }
    [_lblTitle setText:dataAraay.Desc];
    //self.dataAraay.IsExpanded=@"true";
    if (self.dataAraay.NodeList==nil) {
        
        [_subMenuTableView removeFromSuperview];
        [_btn removeFromSuperview];
        
    }
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataAraay.NodeList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell==nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID" withTagPostFix:((Node *)[self.dataAraay.NodeList objectAtIndex:indexPath.row]).NodeType];
       if (![_subMenuTableView.CellList containsObject:cell])
       {
           [_subMenuTableView.CellList addObject:cell];
       }
    }
    
        cell.dataAraay =[self.dataAraay.NodeList objectAtIndex:indexPath.row];
    cell.delegate=_delegate;
        cell.backgroundColor=[UIColor clearColor];
    cell.supperNode=_supperNode;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"nodeId=%@---nodeSize=%ld --- IsExpanded=%@",self.dataAraay.NodeId,([self CellSize:self.dataAraay andInitalLength:0l]+1),self.dataAraay.IsExpanded);
    return ([self CellSize:[self.dataAraay.NodeList objectAtIndex:indexPath.row] andInitalLength:0l]+1)*50;
}

-(long)CellSize:(Node *)node andInitalLength:(long)l {
    if ([node.IsExpanded isEqualToString:@"false"]) {
        return 0;
    }
    long x=0;
    x=x+node.NodeList.count;
    for(Node *obj in node.NodeList)
    {
        if([obj.IsExpanded isEqualToString:@"true"])
        x=x+[self CellSize:obj andInitalLength:x];
       
    }
    return x;
}

@end
