import SwiftUI

@available(iOS 15, *)
public struct MeterSwiftUI : View {
    
    @State private var meterValue : CGFloat = 0

    private let frameSize : CGFloat = 300
    private var lineWidth : CGFloat = 50
    
    private let colors  = [Color.blue, Color.red]
    
    
    mutating func checkMeterValue () {
        if (meterValue >= 0.5) {
            self.meterValue = 0.5
        } else {
            self.meterValue += 0.1
        }
    }
    

    public init(lineWidth: CGFloat, meterValue : CGFloat) {
        self.lineWidth = lineWidth
        
        self.meterValue = meterValue
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
        }
        .padding(.bottom, -60)
        .onChange(of: meterValue) { value in
            withAnimation {
                meterValue = value
            }
        }
        
        
    }
}



struct MeterSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MeterSwiftUI(lineWidth: 50, meterValue: 0.25)
    }
}
