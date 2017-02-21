//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Callum Davies on 2017-02-20.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *currentPage;
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
    
    self.imageView1.userInteractionEnabled = YES;
    self.imageView2.userInteractionEnabled = YES;
    self.imageView3.userInteractionEnabled = YES;

    UITapGestureRecognizer *image1Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstImageTapped:)];
    [self.imageView1 addGestureRecognizer:image1Tapped];
    
    UITapGestureRecognizer *image2Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(secondImageTapped:)];
    [self.imageView2 addGestureRecognizer:image2Tapped];

    UITapGestureRecognizer *image3Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thirdImageTapped:)];
    [self.imageView3 addGestureRecognizer:image3Tapped];
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat scrollViewWidth = CGRectGetWidth(self.scrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.scrollView.frame);
    
    self.imageView1.frame = CGRectMake(scrollViewWidth * 0, 0, scrollViewWidth, scrollViewHeight);
    self.imageView1.contentMode = UIViewContentModeScaleAspectFit;
    
    self.imageView2.frame = CGRectMake(scrollViewWidth * 1, 0, scrollViewWidth, scrollViewHeight);
    self.imageView2.contentMode = UIViewContentModeScaleAspectFit;
    
    self.imageView3.frame = CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight);
    self.imageView3.contentMode = UIViewContentModeScaleAspectFit;

    self.scrollView.contentSize = CGSizeMake(scrollViewWidth * 3, scrollViewHeight);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)firstImageTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"imageWasTapped" sender:self.imageView1.image];
}

- (void)secondImageTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"imageWasTapped" sender:self.imageView2.image];
}

- (void)thirdImageTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"imageWasTapped" sender:self.imageView3.image];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *moarDetail = segue.destinationViewController;
    moarDetail.imageToBeDetailed = sender;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.currentPage.currentPage = page;
}

@end
