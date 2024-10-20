#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AddCalendarEventIntent, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

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
