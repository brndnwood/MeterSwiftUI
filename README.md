# MeterSwiftUI

A meter gauge view for SwiftUI.


To use import the package:

import MeterSwiftUI


Then place in your code:

<code>
MeterSwiftUI(lineWidth: <cgfloat>, meterValue <cgfloat)
</code>

Parameters:

lineWidth <CGFloat>: 
The thickness of the meter. Max value is 50.

meterValue <CGFloat>:
A percentage of the meter completed.

example values:
0.25 = 25%
0.5 = 50%
1 = 100%
