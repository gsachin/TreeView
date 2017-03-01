//
//  ViewController.m
//  TreeView
//
//  Created by  on 21/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

//in your main Table view

#import "ViewController.h"
#import "CustomCell.h"
#import <objC/runtime.h>
@interface ViewController ()<UITableViewDataSource , UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareTestData1];
    if (self.aTV.CellList==nil) {
        self.aTV.CellList=[[NSMutableArray alloc]init];
    }
   // self.automaticallyAdjustsScrollViewInsets = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [self.aTV dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
         cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        if (![self.aTV.CellList containsObject:cell]) {
            [self.aTV.CellList addObject:cell];
        }
        
    }
   // CustomCell *cell = [[CustomCell alloc]init];
    [cell setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f]];
    cell.delegate=self;
    cell.dataAraay = _node;
    //cell.textLabel.text=_node.Desc;
    if (_node.NodeType==0)
        [cell setBackgroundColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f]];
    cell.supperNode=_node;
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView reloadData];
    [self reloadview:self.aTV];
  //return  [tableView cellForRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"IndexPath=(%ld,%ld), level = %d - cellsize = %ld",indexPath.section,indexPath.row,_node.NodeType,[self CellSize:_node andInitalLength:0l]);
    NSLog(@"nodeId=%@---nodeSize=%ld --- IsExpanded=%@",_node.NodeId,([self CellSize:_node andInitalLength:0l]+1),_node.IsExpanded);
    return ([self CellSize:_node andInitalLength:0l]+1)*50;
}
-(void)reloadview:(CustomTableView *)ctv
{
    for(CustomCell *obj in ctv.CellList)
    {
        if (obj !=nil && [obj.subMenuTableView isKindOfClass:[CustomTableView class]]) {
            [self reloadview:obj.subMenuTableView];
        }
    }
    [ctv reloadData];
}
-(void)prepareTestData {
    _node=[[Node alloc]init];
    _node.NodeId=@"1";
    _node.Desc=@"n-1.0";
    _node.NodeType=0;
    
    _node.NodeList=[[NSMutableArray alloc]init];
    Node *node11=[[Node alloc]init];
    node11.NodeId=@"1.1";
    node11.Desc=@"n-1.1.0";
    node11.NodeType=1;
    node11.NodeList=[[NSMutableArray alloc]init];
        Node *node111=[[Node alloc]init];
        node111.NodeId=@"1.1.1";
        node111.Desc=@"n-1.1.1";
        node111.NodeType=2;
        [node11.NodeList addObject:node111];
    
    Node *node121=[[Node alloc]init];
    node121.NodeId=@"1.2.1";
    node121.Desc=@"n-1.2.1";
    node121.NodeType=21;
    [node11.NodeList addObject:node121];
    [_node.NodeList addObject:node11];
    
    
    Node *node12=[[Node alloc]init];
    node12.NodeId=@"1.2";
    node12.Desc=@"n-1.2.0";
    node12.NodeType=2;
    node12.NodeList=[[NSMutableArray alloc]init];
    [_node.NodeList addObject:node12];
    ;
    NSData *data = [[_node toJSON] dataUsingEncoding:NSUTF8StringEncoding];
    _json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%@",[_json description]);

}

-(void)prepareTestData1 {
    _node=[[Node alloc]init];
    _node.NodeId=@"1";
    _node.Desc=@"n-1.0";
    _node.NodeType=0;
    _node.IsExpanded=@"true";
    _node.NodeList=[[NSMutableArray alloc]init];
    Node *node11=[[Node alloc]init];
    node11.NodeId=@"1.1";
    node11.Desc=@"n-1.1.0";
    node11.NodeType=1;
    node11.NodeList=[[NSMutableArray alloc]init];
    node11.IsExpanded=@"true";
    Node *node111=[[Node alloc]init];
    node111.NodeId=@"1.1.1";
    node111.Desc=@"n-1.1.1";
    node111.NodeType=2;
    node111.IsExpanded=@"true";
    [node11.NodeList addObject:node111];
    [_node.NodeList addObject:node11];
    
    
    Node *node12=[[Node alloc]init];
    node12.NodeId=@"1.2";
    node12.Desc=@"n-1.2.0";
    node12.NodeType=3;
    node12.IsExpanded=@"true";
    node12.NodeList=[[NSMutableArray alloc]init];
    Node *node112=[[Node alloc]init];
    node112.NodeId=@"1.1.2";
    node112.Desc=@"n-1.1.2";
    node112.NodeType=4;
    node112.IsExpanded=@"true";
    [node12.NodeList addObject:node112];
    Node *node113=[[Node alloc]init];
    node113.NodeId=@"1.1.3";
    node113.Desc=@"n-1.1.3";
    node113.NodeType=5;
    node113.IsExpanded=@"true";
    [node12.NodeList addObject:node113];
    Node *node114=[[Node alloc]init];
    node114.NodeId=@"1.1.4";
    node114.NodeList=[[NSMutableArray alloc]init];
    node114.Desc=@"n-1.1.4";
    node114.NodeType=6;
    node114.IsExpanded=@"true";
    Node *node1141=[[Node alloc]init];
    node1141.NodeId=@"1.1.4.1";
    node1141.Desc=@"n-1.1.4.1";
    node1141.NodeType=7;
    node1141.IsExpanded=@"true";
    [node114.NodeList addObject:node1141];
    node1141.NodeList=[[NSMutableArray alloc]init];

    Node *node11411=[[Node alloc]init];
    node11411.NodeId=@"1.1.4.1.1";
    node11411.Desc=@"n-1.1.4.1.1";
    node11411.NodeType=7;
    node11411.IsExpanded=@"true";
    [node1141.NodeList addObject:node11411];

    
    Node *node1142=[[Node alloc]init];
    node1142.NodeId=@"1.1.4.2";
    node1142.Desc=@"n-1.1.4.2";
    node1142.NodeType=7;
    node1142.IsExpanded=@"true";
    [node114.NodeList addObject:node1142];
    
    node1142.NodeList=[[NSMutableArray alloc]init];
    
    Node *node11412=[[Node alloc]init];
    node11412.NodeId=@"1.1.4.1.2";
    node11412.Desc=@"n-1.1.4.1.2";
    node11412.NodeType=7;
    node11412.IsExpanded=@"true";
    [node1142.NodeList addObject:node11412];

    [node11.NodeList addObject:node114];

    [_node.NodeList addObject:node12];
    ;
    NSData *data = [[_node toJSON] dataUsingEncoding:NSUTF8StringEncoding];
    _json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //NSLog(@"%@",[_json description]);
//    NSMutableDictionary *muteDictionary = [NSMutableDictionary dictionary];
//    
//    id YourClass = objc_getClass("Node");
//    unsigned int outCount, i;
//    objc_property_t *properties = class_copyPropertyList(YourClass, &outCount);
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        SEL propertySelector = NSSelectorFromString(propertyName);
//        if ([node respondsToSelector:propertySelector]) {
//            [muteDictionary setValue:[node performSelector:propertySelector] forKey:propertyName];
//        }
//    }
//    NSError *jsonError = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:muteDictionary options:0 error:&jsonError];
    
}
-(long)CellSize:(Node *)node andInitalLength:(long)l {
    long x=0;
    x=x+node.NodeList.count;
    for(Node *obj in node.NodeList)
    {
        if ([obj.IsExpanded isEqualToString:@"true"]) {
             x=x+[self CellSize:obj andInitalLength:x];
        }
       
        //if (obj.IsExpanded) {
        
        //}
    }
    return x;
}

- (IBAction)abcd:(id)sender {
}
@end
