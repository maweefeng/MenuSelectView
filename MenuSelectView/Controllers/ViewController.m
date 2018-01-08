//
//  ViewController.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/4.
//  Copyright © 2018年 maweefeng. All rights reserved.
//
#import "UserTableViewCell.h"
#import "ViewController.h"
#import "PulldownMeunView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat originY ;
    if (UIApplication.sharedApplication.statusBarFrame.size.height ==20) {
        originY = 64;
    }else{
        originY = 88;
        }
    UISearchBar * bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    bar.backgroundImage = [[UIImage alloc]init];
    bar.barTintColor = [UIColor whiteColor];
    UITextField *searchField = [bar valueForKey:@"searchField"];
    searchField.placeholder = @"请输入姓名关键字";
    [searchField setValue:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    searchField.textColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor colorWithRed:244/255.0 green:250/255.0 blue:253/255.0 alpha:1]];
        searchField.layer.cornerRadius = 18.0f;
        searchField.layer.masksToBounds = YES;
    }
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, originY+40, self.view.frame.size.width, self.view.frame.size.height-originY-40)];
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];

    self.tableView.rowHeight = 80;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = bar;
    
    PulldownMeunView * view = [[PulldownMeunView alloc]initWithFrame:CGRectMake(0, originY, self.view.frame.size.width, 40)];
    [self.view addSubview:view];
    
    UIView * alparV = [[UIView alloc]initWithFrame:self.tableView.frame];
    alparV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.view insertSubview:alparV belowSubview:view];
    alparV.hidden = YES;
    [view setClickBlock:^(int a) {
        if(a==0){
            alparV.hidden = YES;

        }else{
            alparV.hidden = NO;
        }
    }];
     
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%lu",indexPath.row);
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
 
    
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
