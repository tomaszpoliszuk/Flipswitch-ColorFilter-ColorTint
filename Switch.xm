#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface ColorFilterColorTintSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSColorTintFilterEnabled();
extern "C" void _AXSColorTintSetEnabled(BOOL);

@implementation ColorFilterColorTintSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSColorTintFilterEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSColorTintSetEnabled(newState == FSSwitchStateOn);
}

@end
