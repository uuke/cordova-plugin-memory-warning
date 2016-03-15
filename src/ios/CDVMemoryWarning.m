#import "CDVMemoryWarning.h"
#import <Cordova/CDVPluginResult.h>

@implementation CDVMemoryWarning 

 - (void)onMemoryWarning
{
   // override to remove caches, etc
    NSLog(@"onMemoryWarning");
    NSString * javascriptString = @"cleanMemoryCache();";
   [self.webView stringByEvaluatingJavaScriptFromString:javascriptString];
}


@end
