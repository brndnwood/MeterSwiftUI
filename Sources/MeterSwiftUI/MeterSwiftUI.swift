import SwiftUI

@available(iOS 15, *)
public struct MeterSwiftUI : View {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



struct MeterSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MeterSwiftUI()
    }
}
