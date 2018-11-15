
#import "RNCrashlyticsBeautifier.h"
#import <React/RCTLog.h>
#import <Crashlytics/Crashlytics.h>
#import <Crashlytics/CLSStackFrame.h>

@implementation RNCrashlyticsBeautifier

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(recordException:(NSString *)title frameArray:(NSArray *)frameArray isFatal:(BOOL)isFatal)
{ 
    NSMutableArray<CLSStackFrame *>* stack = [[NSMutableArray alloc]init];
    for(NSDictionary* current in frameArray) {
        CLSStackFrame* frame = [[CLSStackFrame alloc]init];
        [frame setLineNumber:[current[@"lineNumber"] intValue]];
        [frame setFileName:[NSString stringWithFormat:current[@"file"]]];
        [frame setOffset:[current[@"column"] intValue]];
        [frame setSymbol:current[@"methodName"]];
        [stack addObject:frame];
    }
    NSString* errorTitle = [NSString stringWithFormat:@"%@ - %d", frameArray[0][@"file"], [frameArray[0][@"lineNumber"] intValue]];
    [CrashlyticsKit recordCustomExceptionName:errorTitle reason:title frameArray:stack];
}
@end
