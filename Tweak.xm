
#include"scanify.h"

%hook WFAirportViewController

static long long rowsInSection1;


-(long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2 {
	long long val = %orig;
	if(arg2 == 1){
		rowsInSection1 = val + 1;
		return rowsInSection1;
	}
	return val;
}

-(id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
	
	if(((NSIndexPath *)arg2).section == 1 && ((NSIndexPath *)arg2).row + 1 == rowsInSection1){
			UITableViewCell* refreshCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WFRefreshCell"];
			refreshCell.textLabel.text = @"       Scan...";
			return refreshCell;	
	}
	else return %orig;
}


-(void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
	if(((NSIndexPath *)arg2).section == 1 && ((NSIndexPath *)arg2).row + 1 == rowsInSection1){
		
		WFNetworkListController *listDelegate = (WFNetworkListController *)[self listDelegate];
		[listDelegate stopScanning];
		[listDelegate startScanning];
		[self.tableView deselectRowAtIndexPath:arg2 animated:YES];
	}
	else %orig;
}

%end

//For Removing RSSI Rssi Threshold Filter

%hook WFScanRequest

-(BOOL)applyRssiThresholdFilter{
	return NO;
}

%end