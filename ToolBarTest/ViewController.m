//
//  ViewController.m
//  ToolBarTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
- (IBAction)handleBarButtonClick:(id)sender {
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    if (1 == button.tag) {
        NSLog(@"왼쪽버튼");
    }else {
        NSLog(@"오른쪽버튼");
    }
}

- (void)handleRefresh:(id)sender {
    NSLog(@"Refresh!");
}

- (void)handleButton:(id)sender {
    NSLog(@"Button Clicked");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //코드를 이용해서 툴바 생성
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 160, 320, 60)];
    //문자열 버튼
    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc]initWithTitle:@"Button" style:UIBarButtonItemStyleDone target:self action:@selector(handleButton:)];
    
    //세그먼티드 컨트롤 추가
    NSArray *segments = @[@"A", @"B", @"C"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segments];
//    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    segment.frame = CGRectMake(0, 0, 140, 44);
    UIBarButtonItem *segmentButton = [[UIBarButtonItem alloc] initWithCustomView:segment];
    
    //공백추가
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //리프레쉬 버튼 추가
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(handleRefresh:)];
    
    NSArray *items = [NSArray arrayWithObjects:titleButton, segmentButton, space, refreshButton, nil];
    [toolbar setItems:items];
    
    [self.view addSubview:toolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
