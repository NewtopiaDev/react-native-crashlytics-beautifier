
#import "RNStackBeautifier.h"
#import <React/RCTLog.h>
#import <Crashlytics/Crashlytics.h>

@implementation RNStackBeautifier

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()
// RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
// {
//   RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
// }

RCT_EXPORT_METHOD(recordException:(NSString *)title frameArray:(NSArray *)frameArray isFatal:(BOOL)isFatal)
{ 
  NSString* stack;
  for(NSDictionary* current in frameArray) {
    NSString* temp;
    temp = [NSString stringWithFormat:@"%@@%@:%@(%@)", current[@"methodName"], current[@"lineNumber"], current[@"column"], current[@"file"]];
    stack = [NSString stringWithFormat:@"%@$$$$%@", stack, temp];
  }

  NSString* errorTitle = [NSString stringWithFormat:@"%@", frameArray[0][@"file"]];
  // NSString* errorLine = [NSString stringWithFormat:@"%@", frameArray[0][@"lineNumber"]];
  NSLog(@"stack: %@", stack);
  NSError* error = [NSError errorWithDomain:errorTitle code:1234 userInfo:@{NSLocalizedDescriptionKey:stack}];
  [CrashlyticsKit recordError:error];
}
@end

// executeDispatchesInOrder@9286:11(blob:http://localhost:8081/8ac7d295-5fa5-4dc5-a39e-b3f1d3db9bd5)
