//
//  ParallaxPhotoViewController.m
//  RDParallaxController-Sample
//
//  Created by Toni Möckel on 07.11.13.
//  Copyright (c) 2013 Toni Möckel. All rights reserved.
//

#import "RDParallaxController.h"
#import "ParallaxPhotoViewController.h"
#import "KIImagePager.h"


@interface ParallaxPhotoViewController ()<QMBParallaxScrollViewControllerDelegate, KIImagePagerDataSource>
@property (nonatomic, weak) IBOutlet RDParallaxController *parallaxController;
@property (nonatomic, weak) IBOutlet KIImagePager *imagePagerView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *arrayWithImages;

@end

@implementation ParallaxPhotoViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.arrayWithImages = @[
        [UIImage imageNamed:@"NGC6559.jpg"],
        [UIImage imageNamed:@"2.jpg"],
        [UIImage imageNamed:@"3.jpg"],
        [UIImage imageNamed:@"1.jpg"],
        [UIImage imageNamed:@"4.jpg"],
    ];

    [self.parallaxController setupWithTopView:self.imagePagerView topHeight:200 bottomView:self.scrollView];
    self.parallaxController.delegate = self;
    self.parallaxController.fullHeight = self.scrollView.frame.size.height - 50.0f;
}

- (IBAction)dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - QMBParallaxScrollViewControllerDelegate

- (void)parallaxScrollViewController:(RDParallaxController *)controller didChangeState:(QMBParallaxState)state{
    self.imagePagerView.slideshowTimeInterval = controller.state == QMBParallaxStateFullSize ? 0 : 3;
}

- (UIViewContentMode)contentModeForImage:(NSUInteger)image {
    return UIViewContentModeScaleAspectFill;
}


@end
