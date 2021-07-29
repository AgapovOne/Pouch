import Foundation

public struct Configuration: Codable, Equatable {
    public var input: Input
    public let secrets: [SecretDeclaration]
    public let outputs: [Output]
    
    public init(input: Input, secrets: [SecretDeclaration], outputs: [Output]) {
        self.input = input
        self.secrets = secrets
        self.outputs = outputs
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.input = (try container.decodeIfPresent(Input.self, forKey: .input)) ?? Defaults.input
        self.secrets = try container.decode([SecretDeclaration].self, forKey: .secrets)
        self.outputs = try container.decode([Output].self, forKey: .outputs)
    }
}
