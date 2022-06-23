import SwiftUI

@available(iOS 15, *)
public struct MeterSwiftUI : View {
    
    // percentage of meter completed
    private var meterValue : CGFloat = 0

    private let frameSize : CGFloat = 250
    private var lineWidth : CGFloat = 50
    private var maxLineWidth : CGFloat = 50
    
    private let colors  = [Color.blue, Color.red]
    
    private var meterTextValue : String = "0"
    
    
    // don't let value go past background
    mutating func checkMeterValue () {
        if (convertMeterValue() >= 1) {
            self.meterValue = 1
        }
    }
    
    func convertMeterValue () -> CGFloat {
        // Meter value comes in as a percentage of the meter completed.
        // The full value of the half-circle though is 0.5.
        // Need to conver the meterValue to the proper percentage value
        // of 0.5
        
        let percent = meterValue * 0.5
        return percent
    }
    
    func setMeterText () -> String{
        
        return String(format: "%.0f", meterValue * 100)

    }
    

    public init(lineWidth: CGFloat, meterValue : CGFloat) {
        
        if (lineWidth > maxLineWidth) {
            self.lineWidth = self.maxLineWidth
        } else {
            self.lineWidth = lineWidth
        }
        
        self.meterValue = meterValue
        checkMeterValue()
    }
    
    public var body: some View {
        
        ZStack {
            
            // meter background
            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(.black.opacity(0.25), lineWidth: lineWidth )
                .frame(width: frameSize, height: frameSize)
                .rotationEffect(Angle(degrees: 180))
                .padding(.top, 60)
                .padding(.leading, 30)
                .padding(.trailing, 30)

            Text(setMeterText() + "%")
                .font(.system(size: 55, design: .rounded)).bold()
                .padding(.top)
            
            // meter value
            Circle()
                .trim(from: 0, to: convertMeterValue())
                .stroke(AngularGradient(colors: colors, center: .center), lineWidth: lineWidth )
                .frame(width: frameSize, height: frameSize)
                .rotationEffect(Angle(degrees: 180))
                .padding(.top, 60)
//                .padding(.leading, 30)
//                .padding(.trailing, 30)



        }
                .padding(.bottom, -120)
                .padding(.top, -30)

        .background {
//            Color.green
        }
        

        
        
    }
}



struct MeterSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MeterSwiftUI(lineWidth: 50, meterValue: 1)
    }
}
