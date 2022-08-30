
import SymbolKit
import SomeSymbolKitExtension


/// This is the extension to `SymbolGraph.Symbol`, which collides
/// with the one to `UnifiedSymbolGraph.Symbol` if we use path contraction.
public extension SymbolGraph.Symbol {
    func foo() {}
}

/// This is the extension to `UnifiedSymbolGraph.Symbol`, which collides
/// with the one to `SymbolGraph.Symbol` if we use path contraction.
public extension UnifiedSymbolGraph.Symbol {
    func foo() {}
}

/// This is the extension to `SymbolGraph.Symbol.Swift.GenericConstraint.Kind`.
/// It results in basically empty pages for `SymbolGraph.Symbol.Swift` and
/// `SymbolGraph.Symbol.Swift.GenericConstraint` is we use the hierarchical
/// approach. If we didn't have other extensions for `SymbolGraph.Symbol`, we'd have
/// a total of four "empty" pages.
public extension SymbolGraph.Symbol.Swift.GenericConstraint.Kind {
    func foo() {}
}

/// This extension is declared on `SymbolGraph.ExternalType`, where `SymbolGraph` is
/// defined in `SymbolKit`, whereas `ExternalType` is defined in an extension to `SymbolGraph`
/// by the target `SomeSymbolKitExtension`.
///
/// In the hierarchical approach, this extension would be part of the extended module `SymbolKit`,
/// because if we define a hierarchy between the extended types, an extension to the inner type is always
/// also an extension to the context it lives in.
///
/// With path contraction, on the other hand, we view `SymbolGraph.ExternalType` independently of
/// its parent type `SymbolGraph`, and thus consider this an extension to the extended module
/// `SomeSymbolKitExtension`.
public extension SymbolGraph.ExternalType {
    func foo() {}
}
