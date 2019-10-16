import {
    NativeModules,
    ErrorUtils
} from 'react-native';

function parseErrorStack(e) {
    if (!e || !e.stack) {
        return [];
    }
    const stacktraceParser = require('stacktrace-parser');
    const stack = Array.isArray(e.stack) ? e.stack : stacktraceParser.parse(e.stack);
    let framesToPop = typeof e.framesToPop === 'number' ? e.framesToPop : 0;
    while (framesToPop--) {
        stack.shift();
    }
    return stack;
}

module.exports = {
    init: function () {
        var originalHandler = global.ErrorUtils.getGlobalHandler();

        function errorHandler(e, isFatal) {
            let parsedStack = parseErrorStack(e);
            let a = NativeModules.RNCrashlyticsBeautifier.recordException(e.message, parsedStack, isFatal);
        }
        global.ErrorUtils.setGlobalHandler(errorHandler);
    },
    log: function(e, isFatal = false) {
        const parsedStack = parseErrorStack(e)
        const filteredStack = []
        if (parsedStack) {
          parsedStack.forEach(item => {
            if (item.lineNumber && item.column && item.methodName) {
              filteredStack.push(item)
            }
          })
        }
        NativeModules.RNCrashlyticsBeautifier.recordException(
          e.message || '',
          filteredStack,
          isFatal
        )
    },
} 
