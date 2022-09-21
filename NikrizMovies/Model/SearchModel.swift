import Foundation

struct Search : Codable, Hashable {
	let title : String?
	let year : String?
	let imdbID : String?
	let type : String?
	let poster : String?

	enum CodingKeys: String, CodingKey {

		case title = "Title"
		case year = "Year"
		case imdbID = "imdbID"
		case type = "Type"
		case poster = "Poster"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		year = try values.decodeIfPresent(String.self, forKey: .year)
		imdbID = try values.decodeIfPresent(String.self, forKey: .imdbID)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		poster = try values.decodeIfPresent(String.self, forKey: .poster)
	}

}
