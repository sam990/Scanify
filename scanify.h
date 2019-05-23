@interface WFNetworkListController : NSObject
-(void)startScanning;
-(void)stopScanning;
@end

@interface WFAirportViewController : UIViewController 
@property (assign,nonatomic,weak) UITableView * tableView;
-(id)listDelegate;
-(long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2 ;
@end

@interface UITableView()
-(id)_templateLayoutCellForCellsWithReuseIdentifier:(id)arg1;
@end