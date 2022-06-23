import SwiftUI

@available(iOS 15, *)
public struct MeterSwiftUI : View {
    
    @State public var meterValue  : CGFloat = 0.0

    private let frameSize : CGFloat = 300
    public let lineWidth : CGFloat = 50
    
    private let colors  = [Color.blue, Color.red]
    
    func checkMeterValue () {
        if (meterValue >= 0.5) {
            meterValue = 0.5
        } else {
            meterValue += 0.1
        }
    }

    public init() {
    }
    
    public var body: some View {
        
        ZStack {
            
            // meter background
            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(.black.opacity(0.25), lineWidth: lineWidth )
                .frame(width: frameSize, height: frameSize)
                .rotationEffect(Angle(degrees: 180))
        
        
            // meter value
            Circle()
                .trim(from: 0, to: meterValue)
                .stroke(AngularGradient(colors: colors, center: .center), lineWidth: lineWidth )
                .frame(width: frameSize, height: frameSize)
                .rotationEffect(Angle(degrees: 180))
        }.padding(.bottom, -60)
        

        
        
    }
}



struct MeterSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MeterSwiftUI()
    }
}
