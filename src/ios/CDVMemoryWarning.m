#import "CDVMemoryWarning.h"
#import <Cordova/CDVPluginResult.h>

@implementation CDVMemoryWarning 

-(void) pluginInitialize{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMemoryWarning) name:@"UIApplicationDidReceiveMemoryWarning" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMemoryWarning) name:@"UIApplicationDidReceiveMemoryWarning" object:nil];

}

 - (void)onMemoryWarning
{
   // override to remove caches, etc
    NSLog(@"onMemoryWarning");
    NSString * javascriptString = @"cleanMemoryCache();";
  if ([self.webView respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
    // Cordova-iOS pre-4
    [self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:javascriptString waitUntilDone:NO];
  } else {
    // Cordova-iOS 4+
    [self.webView performSelectorOnMainThread:@selector(evaluateJavaScript:completionHandler:) withObject:javascriptString waitUntilDone:NO];
  }
}


@end
