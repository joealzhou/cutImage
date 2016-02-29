//
//  ViewController.m
//  图片裁剪
//
//  Created by 周强 on 16/2/29.
//  Copyright © 2016年 周强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *topImageView;
@property(nonatomic,strong)UIImageView *bottomImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 300, 100, 30)];
    label.textColor=[UIColor redColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"你看到我了" ;
    [self.view addSubview:label];
    
    UIImage *imageTop=[UIImage imageNamed:@"1111.jpg"];
    //根据创建的image 进行区域裁剪（关键代码）
    CGImageRef refTopImg=CGImageCreateWithImageInRect(imageTop.CGImage, CGRectMake(0, 0, imageTop.size.width, imageTop.size.height/2));
   _topImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667/2)];
    _topImageView.image=[UIImage imageWithCGImage:refTopImg];
    [self.view addSubview:_topImageView];
    
    CGImageRef refBottomImg=CGImageCreateWithImageInRect(imageTop.CGImage, CGRectMake(0, imageTop.size.height/2, imageTop.size.width, imageTop.size.height/2));
    _bottomImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 667/2, 375, 667/2)];
    _bottomImageView.image=[UIImage imageWithCGImage:refBottomImg];
    
    [self.view addSubview:_bottomImageView];
    
    
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1 animations:^{
       
        _topImageView.frame=CGRectMake(0, -667/2, 375, 667/2);
        
        _bottomImageView.frame=CGRectMake(0, 667, 375, 667/2);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
