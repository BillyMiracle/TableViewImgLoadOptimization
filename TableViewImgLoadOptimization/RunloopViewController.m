//
//  RunloopViewController.m
//  TableViewImgLoadOptimization
//
//  Created by 张博添 on 2022/9/17.
//

#import "RunloopViewController.h"
#import "ImageDownLoadManager.h"
#import "DemoModel.h"

@interface RunloopViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *imageLoadDic;

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, 100, 30)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height - 150) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self loadData];
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    DemoModel *model = self.datas[indexPath.row];
    cell.textLabel.text = model.text;
   
    
    if (model.iconImage) {
        cell.imageView.image = model.iconImage;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
        [self performSelector:@selector(billy_loadImgeWithIndexPath:)
                   withObject:indexPath
                   afterDelay:0.0
                      inModes:@[NSDefaultRunLoopMode]];
    }
    return cell;
}

//下载图片，并渲染到cell上显示
- (void)billy_loadImgeWithIndexPath:(NSIndexPath *)indexPath {
    
    DemoModel *model = self.datas[indexPath.row];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [ImageDownLoadManager runloop_loadImageWithModel:model success:^{
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = model.iconImage;
            [cell layoutSubviews];
        });
    }];
}

- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//加载数据
- (void)loadData {
    self.datas = [[NSMutableArray alloc] init];
    NSString *head1 = @"https://img1.baidu.com/it/u=235631164,1853890350&fm=253&fmt=auto&app=120&f=JPEG?w=509&h=500";
    NSString *head2 = @"https://img2.baidu.com/it/u=1347252749,346830019&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head3 = @"https://img2.baidu.com/it/u=1720444668,1660517678&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head4 = @"https://img2.baidu.com/it/u=3916833205,2012938924&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=398";
    NSString *head5 = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202005%2F03%2F20200503193405_QavAd.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656316966&t=c149810eddedd6a85e1f5f898a342959";
    NSString *imageURL1 = @"https://img1.baidu.com/it/u=281008848,279623710&fm=253&fmt=auto&app=138&f=JPEG?w=504&h=500";
    NSString *imageURL2 = @"https://img1.baidu.com/it/u=672347980,1207046361&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *imageURL3 = @"https://img0.baidu.com/it/u=1839813024,118489649&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *imageURL4 = @"https://img1.baidu.com/it/u=1908708385,646906125&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400";
    NSString *imageURL5 = @"https://img0.baidu.com/it/u=3068951565,486514998&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *imageURL6 = @"https://img2.baidu.com/it/u=2841930004,63903528&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400";
    NSString *imageURL7 = @"https://img0.baidu.com/it/u=996074816,1541826551&fm=253&fmt=auto&app=138&f=JPEG?w=503&h=500";
    NSString *imageURL8 = @"https://img2.baidu.com/it/u=3949966856,2992083594&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *imageURL9 = @"https://img2.baidu.com/it/u=2351442759,2353435450&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *imageURL10 = @"https://img0.baidu.com/it/u=2415763825,2779814955&fm=253&fmt=auto&app=138&f=JPEG?w=517&h=500";
    NSString *imageURL11 = @"https://img0.baidu.com/it/u=2161795608,1145691066&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head6 = @"https://img2.baidu.com/it/u=3062813899,1142128231&fm=253&fmt=auto&app=138&f=JPEG?w=479&h=500";
    NSString *head7 = @"https://img1.baidu.com/it/u=3393614753,2638302835&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head8 = @"https://img0.baidu.com/it/u=1156520697,4040290757&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *head9 = @"https://img1.baidu.com/it/u=3988894411,24839006&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *heada = @"https://img1.baidu.com/it/u=3642236042,906489063&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500";
    NSString *headb = @"https://img1.baidu.com/it/u=3249070913,912844529&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *headc = @"https://img1.baidu.com/it/u=3505100638,372310150&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *headd = @"https://img2.baidu.com/it/u=454093399,1862723253&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *heade = @"https://img0.baidu.com/it/u=1361586225,1693293111&fm=253&fmt=auto&app=138&f=JPEG?w=506&h=500";
    NSString *headf = @"https://img1.baidu.com/it/u=215763656,1361220511&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *headg = @"https://img1.baidu.com/it/u=572730353,4009678491&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *headh = @"https://img0.baidu.com/it/u=1043076429,4072909793&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=498";
    NSString *headi = @"https://img0.baidu.com/it/u=2737778155,909292723&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    NSString *headj = @"https://img1.baidu.com/it/u=1407090155,2829624615&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500";
    [_datas addObject:[[DemoModel alloc] initWithText:@"普信男" andUserAvatar:head1]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"我是弟弟" andUserAvatar:head2]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"艾轩" andUserAvatar:head3]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"Alice" andUserAvatar:head4]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"蓝桉" andUserAvatar:head5]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"長安听曲客" andUserAvatar:imageURL1]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"火車驶出夢境" andUserAvatar:imageURL2]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"你头发乱了" andUserAvatar:imageURL3]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"櫻檸" andUserAvatar:imageURL4]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"淺茶" andUserAvatar:imageURL5]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"笑顏" andUserAvatar:imageURL6]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"悸動" andUserAvatar:imageURL7]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"盼丝" andUserAvatar:imageURL8]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"雲深起" andUserAvatar:imageURL9]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"钱小样儿" andUserAvatar:imageURL10]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"草莓小玩子" andUserAvatar:imageURL11]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"幻花露雪" andUserAvatar:head6]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"梧桐伴雨" andUserAvatar:head7]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"落叶知秋" andUserAvatar:head8]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"向钱进" andUserAvatar:head9]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"我叫啥" andUserAvatar:heada]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"平淡幸福" andUserAvatar:headb]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headc]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headd]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:heade]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headf]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headg]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headh]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headi]];
    [_datas addObject:[[DemoModel alloc] initWithText:@"name" andUserAvatar:headj]];
    [self.tableView reloadData];
}
    
@end
