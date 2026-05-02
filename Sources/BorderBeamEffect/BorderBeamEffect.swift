// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 17, *)
public extension View {
    
    /// Applies an animated border beam effect to the view.
    ///
    /// This modifier overlays a rotating gradient beam along the border of the view,
    /// creating a visually dynamic highlight effect. The animation is continuous
    /// and customizable via color, blur, and corner radius parameters.
    ///
    /// - Parameters:
    ///   - border: The base color used for the border and gradient masking.
    ///   - beam: An array of colors used to render the animated beam gradient.
    ///   - beamBlur: The blur radius applied to soften the beam edges.
    ///   - cornerRadius: The corner radius of the rounded border shape.
    ///   - isEnabled: A Boolean value indicating whether the beam effect is active. Defaults to `true`.
    ///   - isFadeBorderHidden: A Boolean value that determines whether the subtle base border is hidden. Defaults to `false`.
    ///
    /// - Returns: A view with the animated border beam effect applied.
    @ViewBuilder
    func borderBeamEffect(
        border: Color,
        beam: [Color],
        beamBlur: CGFloat,
        cornerRadius: CGFloat,
        isEnabled: Bool = true,
        isFadeBorderHidden: Bool = false
    ) -> some View {
        self
            .modifier(
                BorderBeamEffectModifier(
                    border: border,
                    beam: beam,
                    beamBlur: beamBlur,
                    cornerRadius: cornerRadius,
                    isEnabled: isEnabled,
                    isFadeBorderHidden: isFadeBorderHidden
                )
            )
    }
}

@available(iOS 17, *)
fileprivate struct BorderBeamEffectModifier: ViewModifier {
    
    /// The base border color used in the effect.
    var border: Color
    
    /// The gradient colors used for the animated beam.
    var beam: [Color]
    
    /// The blur radius applied to the beam for softness.
    var beamBlur: CGFloat
    
    /// The corner radius for the rounded rectangle border.
    var cornerRadius: CGFloat
    
    /// Indicates whether the animation is enabled.
    var isEnabled: Bool
    
    /// Controls visibility of the subtle static border.
    var isFadeBorderHidden: Bool
    
    /// Constructs the modified view with the optional animated border effect.
    ///
    /// - Parameter content: The original view content.
    /// - Returns: A view with an optional animated border overlay.
    func body(content: Content) -> some View {
        content
            .background {
                if isEnabled {
                    BorderBeamView()
                }
            }
    }
    
    /// Creates the animated border beam view.
    ///
    /// This view composes multiple gradient layers and masks, driven by a
    /// `KeyframeAnimator`, to produce a rotating beam effect along the border.
    ///
    /// - Returns: A view representing the animated border beam.
    @ViewBuilder
    func BorderBeamView() -> some View {
        ZStack {
            if !isFadeBorderHidden {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(border.tertiary, lineWidth: 0.6)
            }
            
            KeyframeAnimator(initialValue: 0.0, repeating: true) { value in
                let rotation = value * 360
                
                let borderGradient = AngularGradient(
                    colors: [.clear, border, .clear],
                    center: .center,
                    startAngle: .degrees(140 + rotation),
                    endAngle: .degrees(270 + rotation)
                )
                
                let beamGradient = LinearGradient(
                    colors: beam,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(beamGradient)
                    .mask {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .overlay {
                                Rectangle()
                                    .blur(radius: beamBlur)
                                    .blendMode(.destinationOut)
                            }
                    }
                    .mask {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(borderGradient)
                            .blur(radius: beamBlur / 1.5)
                            .padding(-beamBlur * 2)
                    }
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderGradient, lineWidth: 0.6)
                
            } keyframes: { _ in
                LinearKeyframe(1, duration: 2.5)
            }
        }
    }
}
