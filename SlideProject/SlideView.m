//
//  SlideView.m
//  SlideProject
//
//  Created by 郭榜 on 2017/3/27.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

#import "SlideView.h"
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@implementation SlideView
{

    UIView *lineView;
    CGFloat lineViewCenterX;
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {

        [self setUpUI];
        
    }
    
    return self;
}

-(void)setUpUI {
    
    _oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_oneButton setTitle:@"one" forState:UIControlStateNormal];
    _oneButton.frame = CGRectMake(SCREEN_WIDTH / 2 - 100, 0, 100, 44);
    [self addSubview:_oneButton];
    [_oneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    _twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_twoButton setTitle:@"twotwo" forState:UIControlStateNormal];
    _twoButton.frame = CGRectMake(SCREEN_WIDTH / 2, 0, 100, 44);
    [self addSubview:_twoButton];
    [_twoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    CGSize titleSize = [_oneButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:_oneButton.titleLabel.font}];
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _oneButton.frame.size.height - 3, titleSize.width, 3)];
    lineView.backgroundColor = [UIColor greenColor];
    [self addSubview:lineView];
    lineView.center = CGPointMake(_oneButton.center.x, lineView.frame.origin.y);
    lineViewCenterX = lineView.center.x;
  
    
}


//改变线的位置，大小
-(void)changeLineViewX:(CGFloat) x {
    
    int tarIndex = (int)round(x/SCREEN_WIDTH);
    
    CGSize titleSize;
    if (tarIndex == 0) {
        
        titleSize = [_oneButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:_oneButton.titleLabel.font}];
        [_oneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_twoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    } else {
        
        titleSize = [_twoButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:_twoButton.titleLabel.font}];
        [_oneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_twoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
    }
    
    CGRect rect = lineView.frame;
    rect.size.width = titleSize.width;
    lineView.frame = rect;
    CGFloat changeX = lineViewCenterX + (_twoButton.center.x - _oneButton.center.x) / SCREEN_WIDTH * x;
    lineView.center = CGPointMake(changeX, lineView.center.y);
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
