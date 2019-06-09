#line 1 "Tweak.xm"

#include"scanify.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WFAirportViewController; @class WFScanRequest; 
static long long (*_logos_orig$_ungrouped$WFAirportViewController$tableView$numberOfRowsInSection$)(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST, SEL, id, long long); static long long _logos_method$_ungrouped$WFAirportViewController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST, SEL, id, long long); static id (*_logos_orig$_ungrouped$WFAirportViewController$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$WFAirportViewController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$WFAirportViewController$tableView$didSelectRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$WFAirportViewController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST, SEL, id, id); static BOOL (*_logos_orig$_ungrouped$WFScanRequest$applyRssiThresholdFilter)(_LOGOS_SELF_TYPE_NORMAL WFScanRequest* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$WFScanRequest$applyRssiThresholdFilter(_LOGOS_SELF_TYPE_NORMAL WFScanRequest* _LOGOS_SELF_CONST, SEL); 

#line 4 "Tweak.xm"


static long long rowsInSection1;


static long long _logos_method$_ungrouped$WFAirportViewController$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
	long long val = _logos_orig$_ungrouped$WFAirportViewController$tableView$numberOfRowsInSection$(self, _cmd, arg1, arg2);
	if(arg2 == 1){
		rowsInSection1 = val + 1;
		return rowsInSection1;
	}
	return val;
}

static id _logos_method$_ungrouped$WFAirportViewController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
	
	if(((NSIndexPath *)arg2).section == 1 && ((NSIndexPath *)arg2).row + 1 == rowsInSection1){
			
			

			UITableViewCell* refreshCell = [((UITableView *)arg1) dequeueReusableCellWithIdentifier:@"WFOtherNetworkCell"];
			refreshCell.textLabel.text = @"Scan...";
			[refreshCell setPreservesSuperviewLayoutMargins:YES];
			[[refreshCell contentView] setPreservesSuperviewLayoutMargins:YES];
			refreshCell.layoutMargins = UIEdgeInsetsMake(0.0 , 40.0, 0.0, 0.0);
			return refreshCell;	
	}
	else return _logos_orig$_ungrouped$WFAirportViewController$tableView$cellForRowAtIndexPath$(self, _cmd, arg1, arg2);
}


static void _logos_method$_ungrouped$WFAirportViewController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WFAirportViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
	if(((NSIndexPath *)arg2).section == 1 && ((NSIndexPath *)arg2).row + 1 == rowsInSection1){
		
		WFNetworkListController *listDelegate = (WFNetworkListController *)[self listDelegate];
		[listDelegate stopScanning];
		[listDelegate startScanning];
		[self.tableView deselectRowAtIndexPath:arg2 animated:YES];
	}
	else _logos_orig$_ungrouped$WFAirportViewController$tableView$didSelectRowAtIndexPath$(self, _cmd, arg1, arg2);
}







static BOOL _logos_method$_ungrouped$WFScanRequest$applyRssiThresholdFilter(_LOGOS_SELF_TYPE_NORMAL WFScanRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	return NO;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WFAirportViewController = objc_getClass("WFAirportViewController"); MSHookMessageEx(_logos_class$_ungrouped$WFAirportViewController, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$_ungrouped$WFAirportViewController$tableView$numberOfRowsInSection$, (IMP*)&_logos_orig$_ungrouped$WFAirportViewController$tableView$numberOfRowsInSection$);MSHookMessageEx(_logos_class$_ungrouped$WFAirportViewController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$WFAirportViewController$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$WFAirportViewController$tableView$cellForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$WFAirportViewController, @selector(tableView:didSelectRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$WFAirportViewController$tableView$didSelectRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$WFAirportViewController$tableView$didSelectRowAtIndexPath$);Class _logos_class$_ungrouped$WFScanRequest = objc_getClass("WFScanRequest"); MSHookMessageEx(_logos_class$_ungrouped$WFScanRequest, @selector(applyRssiThresholdFilter), (IMP)&_logos_method$_ungrouped$WFScanRequest$applyRssiThresholdFilter, (IMP*)&_logos_orig$_ungrouped$WFScanRequest$applyRssiThresholdFilter);} }
#line 57 "Tweak.xm"
