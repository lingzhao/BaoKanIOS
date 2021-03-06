// The MIT License
//
// Copyright (c) 2015 Gwendal Roué
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import Foundation

/**
VariableTag represents a variable tag such as {{name}} or {{{name}}}.
*/
final class VariableTag: LocatedTag {
    let token: TemplateToken
    let contentType: ContentType
    
    init(contentType: ContentType, token: TemplateToken) {
        self.contentType = contentType
        self.token = token
    }
    
    // Mark: - Tag protocol
    
    let type: TagType = .Variable
    let innerTemplateString: String = ""
    var tagDelimiterPair: TagDelimiterPair { return token.tagDelimiterPair! }
    
    var description: String {
        return "\(token.templateSubstring) at \(token.locationDescription)"
    }
    
    // Variable have no inner content.
    func render(context: Context) throws -> Rendering {
        return Rendering("", contentType)
    }
    
    // Mark: - LocatedTag
    
    var templateID: TemplateID? { return token.templateID }
    var lineNumber: Int { return token.lineNumber }
}