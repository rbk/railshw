module LightsabersHelper

	def display lightsaber, width
		unless lightsaber.image.blank?
			image_tag lightsaber.image, width: width
		end
	end

end
