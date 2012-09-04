# encoding: UTF-8

class BitmapFont < GuiObject
	include Drawing

	easy_accessor :string

	def set_string(str)
		@chars = str.chars.to_a
		self
	end

	def initialize
		@letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','~','`','!','@','#','$','%','^','&','*','[',']','-','_','=','+','[','{',']','}',';',':',"'",'"',',','<','.','>','/','?','¡','¢','£','¥','§','©','®','¿','À','Á','Â','Ã','Ä','Å','Æ','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ð','Ñ','Ò','Ó','Ô','Õ','Ö','Ø','Ù','Ú','Û','Ü','Ý','ß','à','á','â','ã','ä','å','æ','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','ö','ø','ù','ú','û','ü','ý','ÿ']
		@widths = [13,12,11,13,10,10,13,14,7,9,12,9,18,15,13,12,13,12,11,10,13,13,18,12,12,12,11,11,8,11,10,7,11,11,6,6,12,6,17,11,11,11,11,8,9,6,11,10,15,11,10,10,12,12,12,12,12,12,12,12,12,12,16,8,7,20,16,13,20,14,13,9,6,6,8,12,16,16,6,9,6,9,7,7,6,11,7,16,7,16,11,11,7,9,12,13,13,19,19,11,13,13,13,13,13,13,17,11,10,10,10,10,7,7,7,7,13,15,13,13,13,13,13,13,13,13,13,13,12,12,11,11,11,11,11,11,16,8,10,10,10,10,6,6,6,6,11,11,11,11,11,11,11,11,11,11,11,11,10,10]
		@rects = [[0,0,21,34],[22,0,18,34],[41,0,18,34],[60,0,18,34],[79,0,15,34],[95,0,15,34],[111,0,19,34],[131,0,18,34],[150,0,11,34],[162,0,14,34],[177,0,18,34],[196,0,14,34],[211,0,24,34],[236,0,19,34],[256,0,19,34],[276,0,17,34],[294,0,19,34],[314,0,17,34],[332,0,17,34],[350,0,15,34],[366,0,17,34],[384,0,21,34],[406,0,26,34],[433,0,20,34],[454,0,19,34],[474,0,19,34],[494,0,16,34],[0,34,17,34],[18,34,15,34],[34,34,16,34],[51,34,17,34],[69,34,14,34],[84,34,16,34],[101,34,16,34],[118,34,11,34],[130,34,11,34],[142,34,18,34],[161,34,11,34],[173,34,21,34],[195,34,16,34],[212,34,18,34],[231,34,17,34],[249,34,16,34],[266,34,14,34],[281,34,16,34],[298,34,13,34],[312,34,16,34],[329,34,17,34],[347,34,22,34],[370,34,18,34],[389,34,17,34],[407,34,17,34],[425,34,18,34],[444,34,13,34],[458,34,17,34],[476,34,17,34],[494,34,17,34],[0,68,17,34],[18,68,18,34],[37,68,18,34],[56,68,17,34],[74,68,18,34],[93,68,22,34],[116,68,13,34],[130,68,11,34],[142,68,25,34],[168,68,22,34],[191,68,18,34],[210,68,27,34],[238,68,21,34],[260,68,21,34],[282,68,15,34],[298,68,13,34],[312,68,12,34],[325,68,14,34],[340,68,20,34],[361,68,21,34],[383,68,21,34],[405,68,12,34],[418,68,16,34],[435,68,12,34],[448,68,16,34],[465,68,13,34],[479,68,11,34],[491,68,12,34],[0,102,18,34],[19,102,13,34],[33,102,21,34],[55,102,11,34],[67,102,21,34],[89,102,17,34],[107,102,17,34],[125,102,11,34],[137,102,18,34],[156,102,18,34],[175,102,21,34],[197,102,18,34],[216,102,26,34],[243,102,26,34],[270,102,17,34],[288,102,21,34],[310,102,21,34],[332,102,21,34],[354,102,21,34],[376,102,21,34],[398,102,21,34],[420,102,23,34],[444,102,17,34],[462,102,15,34],[478,102,15,34],[494,102,16,34],[0,136,16,34],[17,136,13,34],[31,136,13,34],[45,136,16,34],[62,136,16,34],[79,136,20,34],[100,136,19,34],[120,136,19,34],[140,136,19,34],[160,136,19,34],[180,136,19,34],[200,136,19,34],[220,136,19,34],[240,136,17,34],[258,136,17,34],[276,136,17,34],[294,136,17,34],[312,136,19,34],[332,136,18,34],[351,136,16,34],[368,136,16,34],[385,136,16,34],[402,136,16,34],[419,136,16,34],[436,136,16,34],[453,136,23,34],[477,136,15,34],[493,136,17,34],[0,170,17,34],[18,170,17,34],[36,170,17,34],[54,170,13,34],[68,170,13,34],[82,170,16,34],[99,170,16,34],[116,170,18,34],[135,170,16,34],[152,170,18,34],[171,170,18,34],[190,170,18,34],[209,170,18,34],[228,170,18,34],[247,170,18,34],[266,170,16,34],[283,170,16,34],[300,170,16,34],[317,170,16,34],[334,170,17,34],[352,170,17,34]]

		@offsets = [-4,-2,-3,-2,-2,-2,-3,-2,-2,-3,-2,-2,-3,-2,-3,-2,-3,-2,-3,-3,-2,-4,-4,-4,-4,-4,-3,-3,-104,-3,-4,-4,-3,-3,-3,-3,-3,-3,-3,-3,-4,-3,-3,-3,-4,-4,-3,-4,-4,-4,-4,-4,-3,-2,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-2,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-4,-3,-2,-2,-4,-4,-3,-5,-3,-3,-3,-3,-3,-3,-3,-3,-3,-2,-5,-3,-4,-3,-3,-3,-3,-4,-4,-4,-4,-4,-4,-4,-3,-2,-2,-2,-2,-4,-2,-4,-4,-4,-2,-3,-3,-3,-3,-3,-3,-2,-2,-2,-2,-4,-3,-3,-3,-3,-3,-3,-3,-4,-4,-4,-4,-4,-4,-5,-3,-5,-5,-4,-3,-4,-4,-4,-4,-4,-4,-3,-3,-3,-3,-4,-4]

		@image = $engine.load_image('fonts/TwCenMTCondensedExtraBold18.png')
		super
	end

	empty_method :gui_tick!

	def gui_render!
		return unless @image and @letters

		with_color([1,1,1,1]) {
			with_pixel_combine_function(:brighten) {
				with_positioning {
					render_letters
				}
			}
		}
	end

	def render_letters
		draw_offset_x = 0.0
		@image.using {
			@chars.each_with_index { |letter, index|
				if letter == ' '
					draw_offset_x += (1.0)
					next
				end
				letter_index = @letters.index(letter)		# slow
				next unless letter_index

				if index+1 < @chars.size
					next_letter = @chars[index+1]
					next_letter_index = @letters.index(next_letter)
				end

				letter_rect = @rects[letter_index]

				letter_source_x = letter_rect[0].to_f / @image.width.to_f
				letter_source_y = letter_rect[1].to_f / @image.height.to_f

				# these are a % of total
				letter_source_width = letter_rect[2].to_f / @image.width.to_f
				letter_source_height = letter_rect[3].to_f / @image.height.to_f

				with_translation(draw_offset_x, 0.0) {
					with_texture_scale_and_translate(letter_source_width,letter_source_height,letter_source_x/letter_source_width,letter_source_y/letter_source_height) {
						unit_square
					}
				}

				if next_letter_index
					draw_offset_x += (@widths[letter_index] / @image.width.to_f) * 15.0
					draw_offset_x += (@widths[next_letter_index] / @image.width.to_f) * 15.0
					#draw_offset_x += (@offsets[next_letter_index] / @image.width.to_f)
				end
			}
		}
	end
end
