#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AddCalendarEventIntent, NSObject)

RCT_EXTERN_METHOD(
  addCalendarEventIntent
    :(NSDictionary *) event
    :(RCTPromiseResolveBlock) resolve
    :(RCTPromiseRejectBlock) reject
)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
