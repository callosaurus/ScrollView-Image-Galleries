//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Callum Davies on 2017-02-20.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UIImageView *imageView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.scrollView.pagingEnabled = YES;
    
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    [self.scrollView addSubview:self.imageView1];
   
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    [self.scrollView addSubview:self.imageView2];

    self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    [self.scrollView addSubview:self.imageView3];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat scrollViewWidth = CGRectGetWidth(self.scrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.scrollView.frame);
    
    self.imageView1.frame = CGRectMake(scrollViewWidth*0, 0, scrollViewWidth, scrollViewHeight);
    self.imageView1.contentMode = UIViewContentModeScaleAspectFit;
    
    self.imageView2.frame = CGRectMake(scrollViewWidth*1, 0, scrollViewWidth, scrollViewHeight);
    self.imageView2.contentMode = UIViewContentModeScaleAspectFit;
    
    self.imageView3.frame = CGRectMake(scrollViewWidth*2, 0, scrollViewWidth, scrollViewHeight);
    self.imageView3.contentMode = UIViewContentModeScaleAspectFit;

    self.scrollView.contentSize = CGSizeMake(scrollViewWidth*3, scrollViewHeight);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
