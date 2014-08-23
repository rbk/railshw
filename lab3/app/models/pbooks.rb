class Pbook < Book
	validates :weight, presence: true

	has_many :books, class_name: 'Book'

end