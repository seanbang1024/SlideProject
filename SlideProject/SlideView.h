//
//  SlideView.h
//  SlideProject
//
//  Created by 郭榜 on 2017/3/27.
//  Copyright © 2017年 com.B_crazy.new. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideView : UIView

@property (nonatomic, strong) UIButton *oneButton;
@property (nonatomic, strong) UIButton *twoButton;

-(void)changeLineViewX:(CGFloat) x;
@end
