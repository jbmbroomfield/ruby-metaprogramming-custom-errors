class Person
	attr_accessor :partner, :name

	def initialize(name)
		@name = name
	end

	def get_married(person)
		self.partner = person
		if person.class != Person
			PartnerError.raise_and_rescue
		else
			person.partner = self
		end
	end

	class PartnerError < StandardError
		def message
		  "you must give the get_married method an argument of an instance of the person class!"
		end

		def self.raise_and_rescue
			begin
				raise self
			rescue self => error
				puts error.message
			end
		end
	end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name



