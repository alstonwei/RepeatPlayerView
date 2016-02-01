# RepeatPlayerView

重复循环播放view

``` Objectve-C
#import "RepeatPlayerView.h"

@interface ViewController ()

@property(nonatomic,strong)RepeatPlayerView* fullScreenPlayerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.window addSubview:self.fullScreenPlayerView];
}


- (RepeatPlayerView *)fullScreenPlayerView{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"welcome_video" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    _fullScreenPlayerView =[[RepeatPlayerView alloc] initWithFrame:self.view.window.bounds sourceUrl:url];
    [_fullScreenPlayerView setBackgroundColor:[UIColor redColor]];
    return _fullScreenPlayerView;
}
```
