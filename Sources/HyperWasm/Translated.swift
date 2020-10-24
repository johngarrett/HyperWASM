import Foundation
import HyperSwift

public class SynthesizedComponent: HTMLComponent {
    let classes = ["Div", "Header", "Paragraph", "VStack", "HStack", "RawHTML"]
    
    public init?(_ rawInput: String) {
        var innerValue:String? = ""
        while innerValue != nil {
            innerValue = rawInput.range(of: #"{[^\}|]+\}"#, options: .regularExpression)?.description
            print(innerValue)
        }
        
        return nil
        //super.init(.empty, cssClass: cssClass, attributes: attributes, children)
    }
}
