//
//  ViewController.m
//  SlideProject
//
//  Created by 郭榜 on 2017/3/23.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

#import "ViewController.h"
#import "SlideView.h"


#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UIScrollViewDelegate>
{
    
    UIScrollView *bgScrollView;
    SlideView *slideV;
    
}

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //控件初始化
    slideV = [[SlideView alloc] initWithFrame:CGRectMake(0, 20, 375, 44)];
    [self.view addSubview:slideV];
    [slideV.oneButton addTarget:self action:@selector(oneAction:) forControlEvents:UIControlEventTouchUpInside];
    [slideV.twoButton addTarget:self action:@selector(twoAction:) forControlEvents:UIControlEventTouchUpInside];

    bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 667 - 64)];
    [self.view addSubview:bgScrollView];
    bgScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 0);
    
    for (int i = 0; i < 2; i++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, 667 - 64)];
        [bgScrollView addSubview:view];
        
        if (i % 2 == 0) {
            
            view.backgroundColor = [UIColor redColor];
            
        } else {
            
            view.backgroundColor = [UIColor blueColor];
            
        }
    }
    bgScrollView.delegate = self;
    bgScrollView.pagingEnabled = YES;
    
    
    
    
    
}

#pragma mark - scrollDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    [slideV changeLineViewX:scrollView.contentOffset.x];

 
}


//两个按钮点击方法
-(void)oneAction:(UIButton *) sender {
    
    [bgScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

-(void)twoAction:(UIButton *) sender {
    
    [bgScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
