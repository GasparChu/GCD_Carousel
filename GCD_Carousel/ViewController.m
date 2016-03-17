//
//  ViewController.m
//  GCD_Carousel
//
//  Created by PP－mac001 on 16/3/17.
//  Copyright © 2016年 Cgp. All rights reserved.
//

#import "ViewController.h"
#import "Banner/BannerView.h"
#import "BannerWebImageManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *UrlStringArray = @[@"http://ww1.sinaimg.cn/small/b1726f64gw1f1zzp0aqjcj20cs07875y.jpg",
                                @"http://ww3.sinaimg.cn/small/b1726f64gw1f1zzoz61g3j20hs0hstff.jpg",
                                @"http://ww3.sinaimg.cn/small/b1726f64gw1f1zzozxzhcj20go0awdgm.jpg",
                                @"http://ww1.sinaimg.cn/small/b1726f64gw1f1zzoz7h3nj20hs0bu41f.jpg"];
    
    
    NSArray *titleArray = [@"1.2.3.4" componentsSeparatedByString:@"."];
    
    
    BannerView  *bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    
    //设置图片和title
    bannerView.imageUrls = UrlStringArray;
    bannerView.titleData = titleArray;
    
    //占位图片,你可以在下载图片失败处修改占位图片
    bannerView.placeImage = [UIImage imageNamed:@"place.png"];
    
    //图片被点击事件,当前第几张图片被点击了,和数组顺序一致
    [bannerView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("第%zd张图片\n",index);
    }];
    
    //设置轮播时间
    bannerView.AutoScrollDelay = 2.0f;
    
    [self.view addSubview:bannerView];
    
    //下载失败重复下载次数,默认不重复,
    [[BannerWebImageManager shareManager] setDownloadImageRepeatCount:1];
    
    //图片下载失败会调用该block(如果设置了重复下载次数,则会在重复下载完后,假如还没下载成功,就会调用该block)
    //error错误信息
    //url下载失败的imageurl
    [[BannerWebImageManager shareManager] setDownLoadImageError:^(NSError *error, NSString *url) {
        NSLog(@"%@",error);
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
