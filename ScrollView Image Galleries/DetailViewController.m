//
//  DetailViewController.m
//  ScrollView Image Galleries
//
//  Created by Callum Davies on 2017-02-20.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (strong, nonatomic) UIImageView *detailedImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    
    self.detailedImageView = [[UIImageView alloc] initWithImage:self.imageToBeDetailed];
    [self.detailScrollView addSubview:self.detailedImageView];
    
    self.detailScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.detailedImageView.frame), CGRectGetHeight(self.detailedImageView.frame));
    self.detailedImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.detailScrollView.maximumZoomScale = 2.0;
    self.detailScrollView.minimumZoomScale = 0.5;
    
    //initial zoom scale
    self.detailScrollView.zoomScale = 1.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.detailedImageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
