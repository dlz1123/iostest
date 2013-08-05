//
//  YIYIImageListViewController.m
//  IYYN
//
//  Created by yiyi on 13-8-3.
//  Copyright (c) 2013年 yiyi. All rights reserved.
//

#import "YIYIImageListViewController.h"
#import "YIYICell.h"
#import "CALayer+SpinArrow.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface YIYIImageListViewController ()

@end

@implementation YIYIImageListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
            }
    return self;
}

- (void)createHeroData
{
    NSMutableArray *demaxiyaHeros;
    NSMutableArray *nuokesasiHeros;
    
    heroSections = [[NSMutableArray alloc] initWithObjects:@"德 玛 西 亚",@"诺 克 萨 斯", nil];
    demaxiyaHeros = [[NSMutableArray alloc] init];
    nuokesasiHeros = [[NSMutableArray alloc] init];
    
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"盖伦",@"name",@"gailun.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/garen.htm",@"url", nil]];
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"蛮王",@"name",@"manwang.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/tryndamere.htm",@"url", nil]];
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"易大师",@"name",@"jiansheng.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/yi.htm",@"url", nil]];
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"赵信",@"name",@"001_1.png",@"picture",@"http://games.qq.com/zt2011/lolchampions/xinzhao.htm",@"url", nil]];
    
    [nuokesasiHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"卡特琳娜",@"name",@"kate.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/katarina.htm",@"url", nil]];
    [nuokesasiHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"鬼术妖姬",@"name",@"guishu.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/leblanc.htm",@"url", nil]];
    
    heroData = [[NSMutableArray alloc] initWithObjects:demaxiyaHeros,nuokesasiHeros, nil];
    
    [demaxiyaHeros release];
    [nuokesasiHeros release];
}

- (void)viewDidLoad
{
    
    [self createHeroData];
    [super viewDidLoad];
    
    if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
		[view release];
		
	}
     self.tableView.backgroundColor = [UIColor redColor];
    [self customFooterView];
}

- (void)customFooterView {
    
    _cardFooterView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    _cardFooterView.userInteractionEnabled = YES;
    _cardFooterView.backgroundColor = RGBCOLOR(246.0f, 246.0f, 246.0f);
    
    _cardFooterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 55.0f/2-14.0f/2, 320, 14.0f)];
    _cardFooterLabel.textColor = RGBCOLOR(53.0f, 53.0f, 53.0f);
    _cardFooterLabel.backgroundColor = [UIColor clearColor];
    _cardFooterLabel.font = [UIFont systemFontOfSize:14.0f];
    _cardFooterLabel.text = @"上拉刷新";
    //    _cardFooterLabel.textColor        = TTSTYLEVAR(tableRefreshHeaderTextColor);
    //    _cardFooterLabel.shadowColor      = TTSTYLEVAR(tableRefreshHeaderTextShadowColor);
    //    _cardFooterLabel.shadowOffset     = TTSTYLEVAR(tableRefreshHeaderTextShadowOffset);
    _cardFooterLabel.textAlignment    = UITextAlignmentCenter;
    [_cardFooterView addSubview:_cardFooterLabel];
    
//    _cardFooterActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    _cardFooterActivity.hidesWhenStopped = YES;
//    _cardFooterActivity.frame = CGRectMake(15, 55/2-_cardFooterActivity.frame.size.height/2, _cardFooterActivity.frame.size.width, _cardFooterActivity.frame.size.height);
//    [_cardFooterView addSubview:_cardFooterActivity];
    
    self.tableView.tableFooterView = _cardFooterView;
    self.tableView.tableFooterView.frame = _cardFooterView.frame;
}

-(void)customArrowImage {
    
    layer = [CALayer layer];
    layer.frame = CGRectMake(7.5f,0, 32.0f, 32.0f);
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contents = (id)[UIImage imageNamed:@"refresh_icon.png"].CGImage;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        layer.contentsScale = [[UIScreen mainScreen] scale];
    }
#endif
    
    //[[emptyView layer] addSublayer:layer];
    _arrowImage=layer;
    
    // 箭头加点击按钮
    _arrowBtn = [[UIButton alloc] initWithFrame:layer.frame];
    //    _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    _arrowBtn.frame = layer.frame;
    //    [_arrowBtn setExclusiveTouch:YES];
    _arrowBtn.showsTouchWhenHighlighted = YES;
    [_arrowBtn addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventTouchUpInside];
    //[emptyView addSubview:_arrowBtn];
}

#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
    // 只在下拉刷新时，请求最新feed
	[self loadFeedData];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
       [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    // 下拉复位及刷新
    if (self.tableView.contentOffset.y < 0) {
        
        //[coverScrollView setContentOffset:CGPointZero animated:YES];
        [self performSelector:@selector(loadFeedData) withObject:nil afterDelay:0.5f];
    }
    
    // 上拉刷新
    if (self.tableView.contentOffset.y + self.tableView.contentSize.height - 20 > self.tableView.contentSize.height && self.tableView.contentSize.height>self.tableView.contentSize.height/2) {
        
        [self performSelector:@selector(loadMoreFeedData) withObject:nil afterDelay:0.0];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
  
   
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
    if (self.tableView.contentOffset.y + self.tableView.contentSize.height - 20 > self.tableView.contentSize.height && self.tableView.contentSize.height>self.tableView.contentSize.height) {
        
            _cardFooterLabel.text = @"加载更多";    //空列表时，则不显示
    }
   
}


-(void)loadFeedData {
    
    //[_arrowImage spinArrowStartAnimating];
     [_arrowImage spinArrowStopAnimating];
    _reloading = YES;
    //isMoreInfo = NO;
   
    
    //    if (feeds.count==0)
    //        catAniView.hidden = NO;
    //    else
    //        catAniView.hidden = YES;
}

-(void)loadMoreFeedData {
    
        [_cardFooterLabel setText:NSLocalizedString(@"Loading", nil)];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [heroSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[heroData objectAtIndex:section] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellTableIdentifier = @"CellTableIdentifier ";
    YIYICell *cell = (YIYICell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        cell = [[[YIYICell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier] autorelease];
    }
    cell.nameLab.text = [[[heroData objectAtIndex:indexPath.section] objectAtIndex: indexPath.row] objectForKey:@"name"];
    cell.imageBg.image=[UIImage imageNamed:[[[heroData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]objectForKey:@"picture"]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [heroSections objectAtIndex:section];
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //上分割线，
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 1));
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColor  purpleColor].CGColor);
    CGContextStrokeRect(context, CGRectMake(5, rect.size.height, rect.size.width - 10, 1));
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HeroDetailViewController *heroDetail = [[HeroDetailViewController alloc] initWithNibName:@"HeroDetailViewController" bundle:nil];
//    
//    heroDetail.detailURL = [[NSURL alloc] initWithString:[[[heroData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"url"]];
//    heroDetail.title = [[[heroData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"];
//    [self.navigationController pushViewController:heroDetail animated:YES];
//    [heroDetail release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [heroData release];
    [heroSections release];
    [super dealloc];
}
@end
