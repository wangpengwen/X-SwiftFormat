import Foundation
import Cocoa

public protocol SourceCodeTheme: SyntaxColorTheme {
	func color(for syntaxColorType: SourceCodeTokenType) -> Color
}

extension SourceCodeTheme {

	public func globalAttributes() -> [NSAttributedString.Key: Any] {
		var attributes = [NSAttributedString.Key: Any]()
		attributes[.font] = font
		attributes[.foregroundColor] = NSColor(named: "texteditor-plain-color")!
		return attributes
	}

	public func attributes(for token: Token) -> [NSAttributedString.Key: Any] {
		var attributes = [NSAttributedString.Key: Any]()
		if let token = token as? SimpleSourceCodeToken {
			attributes[.foregroundColor] = color(for: token.type)
		}
		return attributes
	}
}
